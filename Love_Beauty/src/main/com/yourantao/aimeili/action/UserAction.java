package main.com.yourantao.aimeili.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import main.com.yourantao.aimeili.bean.GoodsDAO;
import main.com.yourantao.aimeili.bean.User;
import main.com.yourantao.aimeili.bean.UserAddress;
import main.com.yourantao.aimeili.bean.UserAddressDAO;
import main.com.yourantao.aimeili.bean.UserDAO;
import main.com.yourantao.aimeili.bean.UserFavorite;
import main.com.yourantao.aimeili.bean.UserFavoriteDAO;
import main.com.yourantao.aimeili.bean.UserLogin;
import main.com.yourantao.aimeili.bean.UserLoginDAO;
import main.com.yourantao.aimeili.bean.UserRelative;
import main.com.yourantao.aimeili.bean.UserRelativeDAO;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.conf.FavoriteType;
import main.com.yourantao.aimeili.util.TransTool;
import main.com.yourantao.aimeili.vo.UserView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class UserAction extends BaseAction implements UserInterface, Constant {
	private static final Logger LOG = LoggerFactory.getLogger(UserAction.class);
	private static final String NO_UUID = "{'msg':'没有设备号'}";
	private static final String NO_GOODS_ID = "{'msg':'没有商品号'}";
	private static final String NO_SKIN = "{'msg':'没有肤质结果'}";
	private static final String NO_USER_LOGIN = "{'msg':'设备号未登记'}";
	private static final String NO_USER = "{'msg':'没有该用户'}";
	private static final String FAVORITE_DUPLICATED = "{'msg':'重复的收藏'}";

	private UserDAO userDAO;
	private UserLoginDAO userLoginDAO;
	private UserFavoriteDAO userFavoriteDAO;
	private GoodsDAO goodsDAO;
	private UserAddressDAO userAddressDAO;
	private UserRelativeDAO userRelativeDAO;

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.UserInterface#insertTopic()
	 */
	@Override
	public String userInsertFav() {
		String msg = "";
		String uuid = getStringParameter(UUID);
		Integer goodsId = getIntegerParameter(GOODS_ID);
		Short favoriteType = FavoriteType.GOODS;
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		if (goodsId == null || goodsId == 0) {
			printString(NO_GOODS_ID);
			return null;
		}
		List<UserLogin> userLoginList = userLoginDAO.findByUuid(uuid);
		if (userLoginList.isEmpty()) {
			printString(NO_USER_LOGIN);
			return null;
		}
		int userId = userLoginList.get(0).getUserId();
		if (userFavoriteDAO.exist(userId, goodsId, favoriteType)) {
			printString(FAVORITE_DUPLICATED);
			return null;
		}
		userFavoriteDAO.save(new UserFavorite(userId, favoriteType, goodsId,
				new Timestamp(System.currentTimeMillis())));

		printString(MSG_SUCCESS);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.UserInterface#insertTopic()
	 */
	@Override
	public String userLoginRegister() {
		String uuid = getStringParameter(UUID);
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		List<UserLogin> userLoginList = userLoginDAO.findByUuid(uuid);
		Timestamp current = new Timestamp(System.currentTimeMillis());
		if (userLoginList.isEmpty()) { // 无此用户，改用户注册
			UserLogin userLogin = new UserLogin(uuid);
			userDAO.save(new User(current, current, userLogin));
		} else { // 用户存在，修改登录时间
			userLoginList.get(0).getUser().setLastlogin(current);
		}

		printString(MSG_SUCCESS); // 返回成功或者失败
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.UserInterface#userUpdateUserInfo()
	 */
	@Override
	public String userUpdateUserInfo() {

		String uuid = getStringParameter(UUID);
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		String skin = getStringParameter(SKIN);
		if (skin == null) {
			printString(NO_SKIN);
			return null;
		}
		skin = TransTool.transSkin(skin);
		List<UserLogin> userLoginList = userLoginDAO.findByUuid(uuid);
		User user = userLoginList.get(0).getUser();
		user.setSkin(skin);

		printString(MSG_SUCCESS);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.UserInterface#getUserAddress()
	 */
	@Override
	public String getUserAddress() {
		// 获取参数
		String uuid = getStringParameter(UUID);
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		List<UserLogin> userLoginList = userLoginDAO.findByUuid(uuid);
		if (userLoginList.isEmpty()) {
			printString(NO_USER_LOGIN);
			return null;
		}
		int userId = userLoginList.get(0).getUserId();
		List<UserAddress> userAddresses = userAddressDAO.findByUserId(userId);
		printArray(userAddresses);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.UserInterface#UserUpdateAddress()
	 */
	@Override
	public String userUpdateAddress() {
		int aid = getIntegerParameter(ADDRESS_ID); // 送货信息id
		if (aid == 0) {
			printString(NO_USER);
			return null;
		}

		String location = getStringParameter("loc"); // 省，市，区
		String[] locations = location.split("/"); // 0-》省，1-》市，2=》区
		String address = getStringParameter("add");
		String userName = getStringParameter("user");
		String telphone = getStringParameter("tel");
		String zipCode = getStringParameter("code");

		UserAddress userAddress = userAddressDAO.findById(aid);
		userAddress.setCity(locations[1]);
		userAddress.setProvince(locations[0]);
		userAddress.setDistrict(locations[2]);
		userAddress.setDetail(address);
		userAddress.setReceiver(userName);
		userAddress.setMobile(telphone);
		userAddress.setZipCode(zipCode);

		printString(MSG_SUCCESS);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.UserInterface#userInsertAddress()
	 */
	@Override
	public String userInsertAddress() {
		String uuid = getStringParameter(UUID);
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		int uid = userLogin.get(0).getUserId();
		UserAddress userAddress = new UserAddress();
		String location = getStringParameter("loc"); // 省，市，区
		String[] locations = location.split("/"); // 0-》省，1-》市，2=》区
		String address = getStringParameter("add");
		String userName = getStringParameter("user");
		String telphone = getStringParameter("tel");
		String zipCode = getStringParameter("code");
		userAddress.setUserId(uid);
		userAddress.setCity(locations[1]);
		userAddress.setProvince(locations[0]);
		userAddress.setDistrict(locations[2]);
		userAddress.setDetail(address);
		userAddress.setReceiver(userName);
		userAddress.setMobile(telphone);
		userAddress.setZipCode(zipCode);
		userAddress.setDefault_((short) 1);
		userAddressDAO.save(userAddress);

		printString(MSG_SUCCESS);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.UserInterface#deleteUserAddress()
	 */
	public String deleteUserAddress() {
		String msg = "";
		// 获取参数
		String uuid = getStringParameter(UUID);
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		int uid = userLogin.get(0).getUserId();
		int addressId = getIntegerParameter(ADDRESS_ID);//
		UserAddress userAddress = userAddressDAO.findById(addressId);
		if (userAddress.getUserId() == uid) {
			userAddressDAO.delete(userAddress);//
		} else {
			msg = "{'msg':'地址与用户不匹配'}";
		}
		printString(msg);
		return null;

	}

	/*
	 * for Client (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.UserInterface#userRelativeSkin()
	 */
	@Override
	public String userInsertOrUpdateRelativeSkin() {
		String msg = "";
		String uuid = getStringParameter(UUID);
		String skin = getStringParameter(SKIN);
		String birthday = getStringParameter("birth");
		String city = getStringParameter(CITY);
		String relative = getStringParameter("rel");
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printString(NO_USER);
			return null;
		}
		int uid = userLogin.get(0).getUserId();
		if (skin == null|| skin.equals("null")) {
			msg = "{'msg':'没有皮肤id'}";
			printString(msg);
			return null;
		}
		if (relative == null|| relative.equals("null")) {
			msg = "{'msg':'没有亲戚关键词'}";
			printString(msg);
			return null;
		}
		if (city == null|| city.equals("null")) {
			msg = "{'msg':'没有城市'}";
			printString(msg);
			return null;
		}
		// try {
		// String outStr = new String(relative.getBytes("iso-8859-1"),"UTF-8");
		// //浏览器页面发来的就为乱码~~
		// log.error("out:{}",outStr);
		// } catch (UnsupportedEncodingException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		try {
			relative = URLDecoder.decode(relative, UTF8);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		skin = TransTool.transSkin(skin);
		List<UserRelative> userRelativeList = userRelativeDAO.findByUidAndRelative(relative,
				uid);
		if (userRelativeList.size() != 0) {    //重复的代表需要更新
//			UserRelative userRelative=userRelativeDAO.findById(userRelativeList.get(0).getUserRelativeId());
			UserRelative userRelative=userRelativeList.get(0);
			try {
				userRelative.setBirthday(dateFormat.parse(birthday));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			userRelative.setCity(city);
			userRelative.setSkin(skin);
			printString(MSG_SUCCESS);
			return null;
		}
		UserRelative userRelative = new UserRelative();
		userRelative.setUserId(uid);
		userRelative.setSkin(skin);
		userRelative.setRelative(relative);
		userRelative.setCity(city);
		try {
			userRelative.setBirthday(dateFormat.parse(birthday));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userRelativeDAO.save(userRelative);

		printString(MSG_SUCCESS);
		return null;
	}

	/*
	 * for Client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.UserInterface#getUserAndRelativeSkin()
	 */
	@Override
	public String getUserAndRelativeSkin() {
		String msg = "";
		String uuid = getStringParameter(UUID);
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printString(NO_USER);
			return null;
		}
		int uid = userLogin.get(0).getUserId();
		User user = userDAO.findById(userLogin.get(0).getUserId());
		List<UserView> userViews=new ArrayList<UserView>();
		//“我”的那部分信息
		UserView userView = new UserView();
		userView.setBirthday(TransTool.transBirthday(user.getBirthday()));
		userView.setCity(user.getCity());
		userView.setSkin(user.getSkin());
		userView.setUserId(uid);
		userView.setUserName("我");
		userViews.add(userView);
		
		//其他亲戚的信息
		List<UserRelative> userRelatives=userRelativeDAO.findByUserId(uid);
		for (UserRelative userRelative : userRelatives) {
			userView = new UserView();
			userView.setBirthday(TransTool.transBirthday(userRelative.getBirthday()));
			userView.setCity(userRelative.getCity());
			userView.setSkin(userRelative.getSkin());
			userView.setUserId(uid);
			userView.setUserName(userRelative.getRelative());
			userViews.add(userView);
		}
		
		printArray(userViews);
		return null;
	}

	/*
	 * for Client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.UserInterface#userDeleteRelativeSkin()
	 */
	@Override
	public String userDeleteRelativeSkin() {
		String uuid = getStringParameter(UUID);
		String relative = getStringParameter("rel");
		if (uuid == null || uuid.equals("null")) {
			printString(NO_UUID);
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printString(NO_USER);
			return null;
		}
		int uid = userLogin.get(0).getUserId();
		if (relative == null|| relative.equals("null")) {
			printString("{'msg':'没有亲戚关键词'}");
			return null;
		}
		List<UserRelative> userRelative = userRelativeDAO.findByUidAndRelative(
				relative, uid);
		if(userRelative.isEmpty()){
			printString("{'msg':'没有该亲戚'}");
			return null;
		}else{
			userRelativeDAO.delete(userRelative.get(0));
			printString(MSG_SUCCESS);
			return null;
		}
	}

	public UserRelativeDAO getUserRelativeDAO() {
		return userRelativeDAO;
	}

	public void setUserRelativeDAO(UserRelativeDAO userRelativeDAO) {
		this.userRelativeDAO = userRelativeDAO;
	}

	public UserAddressDAO getUserAddressDAO() {
		return userAddressDAO;
	}

	public void setUserAddressDAO(UserAddressDAO userAddressDAO) {
		this.userAddressDAO = userAddressDAO;
	}

	public GoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(GoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	public UserFavoriteDAO getUserFavoriteDAO() {
		return userFavoriteDAO;
	}

	public void setUserFavoriteDAO(UserFavoriteDAO userFavoriteDAO) {
		this.userFavoriteDAO = userFavoriteDAO;
	}

	public UserLoginDAO getUserLoginDAO() {
		return userLoginDAO;
	}

	public void setUserLoginDAO(UserLoginDAO userLoginDAO) {
		this.userLoginDAO = userLoginDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
}
