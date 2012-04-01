package main.com.yourantao.aimeili.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

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
import main.com.yourantao.aimeili.log.LeaveCurrentPageLog;
import main.com.yourantao.aimeili.log.UserFavoriteLog;
import main.com.yourantao.aimeili.log.UserInfoLog;
import main.com.yourantao.aimeili.log.UserLoginLog;
import main.com.yourantao.aimeili.log.UserLogoutLog;
import main.com.yourantao.aimeili.log.UserRegisterLog;
import main.com.yourantao.aimeili.util.TransTool;
import main.com.yourantao.aimeili.vo.UserView;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class UserAction extends BaseAction implements UserInterface, Constant {
	private static final Logger logger = LoggerFactory.getLogger(UserAction.class);
	private static Log userRegisterLogger = LogFactory.getLog("UserRegister"); /*用户注册日志记录*/
	private static Log userLoginLogger = LogFactory.getLog("UserLogin");/*用户登录日志记录*/
	private static Log userLogoutLogger = LogFactory.getLog("UserLogout");/*用户登出日志记录*/
	private static Log userFavoriteLogger = LogFactory.getLog("UserFavorite");/*用户收藏记录*/
	private static Log userInfoLogger = LogFactory.getLog("UserInfo");/*用户收藏记录*/
	private static Log leaveCurrentPageLogger = LogFactory.getLog("LeaveCurrentPage");/*用户离开访问页面记录*/
	
	
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
		if (!userFavoriteDAO.findByUserIdAndGoodId(userId, goodsId, favoriteType).isEmpty()) {
			printString(FAVORITE_DUPLICATED);
			return null;
		}
		userFavoriteDAO.save(new UserFavorite(userId, favoriteType, goodsId,
				new Timestamp(System.currentTimeMillis())));
		
		/*用户收藏日志*/
		UserFavoriteLog userFavoriteLog=new UserFavoriteLog(uuid, getRequest());
		userFavoriteLog.setGoodsId(goodsId);
		userFavoriteLog.setType(UserFavoriteLog.INSERT);   //删除操作
		userFavoriteLogger.debug(userFavoriteLog.toString());

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
			
			/*用户注册日志记录*/
			UserRegisterLog userRegisterLog=new UserRegisterLog(uuid,getRequest());
			userRegisterLog.setRegisterTime(current);
			userRegisterLogger.debug(userRegisterLog.toString());
		} else { // 用户存在，修改登录时间
			userLoginList.get(0).getUser().setLastlogin(current);
			
			/*用户登录日志记录*/
			UserLoginLog userLoginLog=new UserLoginLog(uuid,getRequest());
			userLoginLog.setLoginTime(current);
			userLoginLogger.debug(userLoginLog.toString());
		}

		printString(MSG_SUCCESS); // 返回成功或者失败
		
		return null;
	}
	
	/*
	 * for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#userLoginOut()
	 */
	@Override
	public void userLogout() {
		String pageName = getStringParameter("page");  //离开时的最后一页
		String uuid = getStringParameter(UUID);
		List<UserLogin> userLoginList = userLoginDAO.findByUuid(uuid);
		Timestamp loginTimes=userLoginList.get(0).getUser().getLastlogin();
		Long loginTime=loginTimes.getTime();   //上次登录时间
		Long logoutTime=System.currentTimeMillis();  //当前时间，即登出时间
		
		/*用户登出日志记录*/
		UserLogoutLog userLogoutLog=new UserLogoutLog(uuid,getRequest());
		userLogoutLog.setPageName(pageName);
		userLogoutLog.setLastTime(logoutTime-loginTime);
		userLogoutLogger.debug(userLogoutLog.toString());
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
		String nickName=getStringParameter("nick");   //昵称
		String city=getStringParameter("city");
		String skin = getStringParameter(SKIN).substring(0,1);
		String isSensitive = getStringParameter(SKIN).substring(1,2);
		String birthday = getStringParameter("birth");
		if (skin == null || skin.equals("n")) {
			printString(NO_SKIN);
			return null;
		}
		if(birthday==null && birthday.equals("null")){
			printString("{'msg':'没有生日信息'}");
			return null;
		}
		String userTags=getStringParameter("tag");
		if (userTags == null || userTags.equals("null")) {
			printString(NO_SKIN);
			return null;
		}
		userTags=TransTool.transUserTagsIdToName(userTags);
		if (city == null|| city.equals("null")) {
			printString("{'msg':'没有城市'}");
			return null;
		}
		if (userTags == null|| userTags.equals("null")||userTags.equals("000000")) {
			printString("{'msg':'没有用户标签'}");
			return null;
		}
		skin = TransTool.transSkinIdToName(skin);
		List<UserLogin> userLoginList = userLoginDAO.findByUuid(uuid);
		User user = userLoginList.get(0).getUser();
		user.setSkin(skin);
		user.setCity(city);
		user.setNickName(nickName);
		user.setUserTags(userTags);
		try {
			user.setBirthday(dateFormat.parse(birthday));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setIsSensitivie(Short.parseShort(isSensitive));

		/*用户信息修改*/
		UserInfoLog userInfoLog=new UserInfoLog(uuid,getRequest());
		userInfoLog.setBirthday(birthday);
		userInfoLog.setCity(city);
		userInfoLog.setNickName(nickName);
		userInfoLog.setRelativeId(0);   //0代表 “我”
		userInfoLog.setSkin(skin);
		userInfoLog.setType(UserInfoLog.UPDATE);
		userInfoLog.setUserTags(userTags);
		userInfoLogger.debug(userInfoLog.toString());
		
		
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
		Integer aid = getIntegerParameter(ADDRESS_ID); // 送货信息id
		if (aid==null || aid == 0) {
			printString("{'msg':'没有送货ID'}");
			return null;
		}
		UserAddress userAddress = userAddressDAO.findById(aid);
		if(userAddress==null){
			printString("{'msg':'没有该送货地址'}");
			return null;
		}

		String location = getStringParameter("loc"); // 省，市，区，方位
		String[] locations = location.split("/"); // 0-》省，1-》市，2=》区 ，3=》方位
		String address = getStringParameter("add");
		String userName = getStringParameter("user");
		String telphone = getStringParameter("tel");
		String mobile = getStringParameter("mobile");
		String zipCode = getStringParameter("code");

		userAddress.setCity(locations[1]);
		userAddress.setProvince(locations[0]);
		userAddress.setDistrict(locations[2]);
		userAddress.setDetail(locations[3]);
		userAddress.setUserAddress(address);
		userAddress.setReceiver(userName);
		userAddress.setMobile(mobile);
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
		
		List<UserAddress> userAddresses=userAddressDAO.findByUserId(uid);
		for (UserAddress userAddress2 : userAddresses) {   //将其余的设置为非默认地址
			userAddress2.setIsDefault((short) 0);
		}
		
		
		UserAddress userAddress = new UserAddress();
		String location = getStringParameter("loc"); // 省，市，区，方位
		String[] locations = location.split("/"); // 0-》省，1-》市，2=》区 ，3=》方位
		String address = getStringParameter("add");   //用户填的具体地址
		String userName = getStringParameter("user");
		String mobile = getStringParameter("mobile");
		String zipCode = getStringParameter("code");
//		String telphone = getStringParameter("tel");
		userAddress.setUserId(uid);
		userAddress.setCity(locations[1]);
		userAddress.setProvince(locations[0]);
		userAddress.setDistrict(locations[2]);
		userAddress.setDetail(locations[3]);
		userAddress.setUserAddress(address);
		userAddress.setReceiver(userName);
		userAddress.setMobile(mobile);
		userAddress.setTelephone("0");  // 现在没有用户输入的电话，都默认为0
		userAddress.setZipCode(zipCode);
		userAddress.setIsDefault((short) 1);
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
		Integer id=getIntegerParameter("id");   //relative的id号
		String uuid = getStringParameter(UUID);
		String skin = getStringParameter(SKIN).substring(0,1);
		String isSensitive = getStringParameter(SKIN).substring(1,2);
		String birthday = getStringParameter("birth");
		String city = getStringParameter(CITY);
		String relative = getStringParameter("rel");
		String userTags = getStringParameter("tag");
		int relativeId=0;
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
		if (skin == null|| skin.equals("n")) {
			msg = "{'msg':'没有肤质结果'}";
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
		if (userTags == null|| userTags.equals("null")||userTags.equals("000000")) {
			msg = "{'msg':'没有用户标签'}";
			printString(msg);
			return null;
		}
		if(birthday==null && birthday.equals("null")){
			printString("{'msg':'没有生日信息'}");
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
		userTags=TransTool.transUserTagsIdToName(userTags);
		skin = TransTool.transSkinIdToName(skin);   //数字转换为文字存储
//		List<UserRelative> userRelativeList = userRelativeDAO.findByUidAndRelative(relative,uid);
		if(id==null||id==0){   //id为空，则代表是插入处理
			UserRelative userRelative = new UserRelative();
			userRelative.setUserId(uid);
			userRelative.setSkin(skin);
			userRelative.setIsSensitive(Short.parseShort(isSensitive)); //是否敏感
			userRelative.setUserTags(userTags);//用户标签
			userRelative.setRelative(relative);
			userRelative.setCity(city);
			try {
				userRelative.setBirthday(dateFormat.parse(birthday));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			userRelativeDAO.save(userRelative);
			
			/*用户信息修改*/
			UserInfoLog userInfoLog=new UserInfoLog(uuid,getRequest());
			userInfoLog.setBirthday(birthday);
			userInfoLog.setCity(city);
			userInfoLog.setNickName(relative);
			userInfoLog.setRelativeId(userRelative.getUserRelativeId());   
			userInfoLog.setSkin(skin);
			userInfoLog.setType(UserInfoLog.INSERT);
			userInfoLog.setUserTags(userTags);
			userInfoLogger.debug(userInfoLog.toString());
			
		}else{
			UserRelative userRelative=userRelativeDAO.findById(id);
			if(userRelative==null){
				printString("{'msg':'没有该id'}");
				return null;
			}
			try {
				userRelative.setBirthday(dateFormat.parse(birthday));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			userRelative.setRelative(relative);
			userRelative.setCity(city);   //城市
			userRelative.setSkin(skin);  //4选1肤质
			userRelative.setUserTags(userTags);//用户标签
			userRelative.setIsSensitive(Short.parseShort(isSensitive)); //是否敏感
			
			/*用户信息修改*/
			UserInfoLog userInfoLog=new UserInfoLog(uuid,getRequest());
			userInfoLog.setBirthday(birthday);
			userInfoLog.setCity(city);
			userInfoLog.setNickName(relative);
			userInfoLog.setRelativeId(userRelative.getUserRelativeId());   
			userInfoLog.setSkin(skin);
			userInfoLog.setType(UserInfoLog.UPDATE);
			userInfoLog.setUserTags(userTags);
			userInfoLogger.debug(userInfoLog.toString());
			
			printString(MSG_SUCCESS);
			return null;
		}
		
		
		
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
		User user = userDAO.findById(uid);
		List<UserView> userViews=new ArrayList<UserView>();
		String userTags=user.getUserTags();
		userTags=TransTool.transUserTagsNameToId(userTags);
		
		//“我”的那部分信息
		UserView userView = new UserView();
		userView.setRelativeId(0);   //我是0
		userView.setBirthday(TransTool.transBirthday(user.getBirthday()));  //只取birthday字段中的前10位，即 2012-01-01
		userView.setCity(user.getCity());
		if(user.getSkin()==null || user.getSkin().equals("null")){
			userView.setSkin("0"+user.getIsSensitivie());   //skin包含4选1肤质+是否敏感
		}else{
			userView.setSkin(TransTool.transSkinNameToId(user.getSkin())+user.getIsSensitivie());   //skin包含4选1肤质+是否敏感
		}
		userView.setUserId(uid);
		userView.setUserName(user.getNickName());
		userView.setUserTags(userTags);
		userViews.add(userView);
		
		//其他亲戚的信息
		List<UserRelative> userRelatives=userRelativeDAO.findByUserId(uid);
		for (UserRelative userRelative : userRelatives) {
			userView = new UserView();
			userView.setRelativeId(userRelative.getUserRelativeId());
			userView.setBirthday(TransTool.transBirthday(userRelative.getBirthday()));
			userView.setCity(userRelative.getCity());
			userView.setSkin(TransTool.transSkinNameToId(userRelative.getSkin())+userRelative.getIsSensitive());   //skin包含4选1肤质+是否敏感
			userView.setUserId(uid);
			userView.setUserName(userRelative.getRelative());
			userView.setUserTags(TransTool.transUserTagsNameToId(userRelative.getUserTags()));
			userViews.add(userView);
		}
		
		printArray(userViews);
		return null;
	}

	/*
	 * for Client (non-Javadoc)
	 *
	 * main.com.yourantao.aimeili.action.UserInterface#userDeleteRelativeSkin()
	 */
	@Override
	public String userDeleteRelativeSkin() {
		String uuid = getStringParameter(UUID);
		Integer relativeId=getIntegerParameter("id");
		
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
		if (relativeId == null|| relativeId==0) {
			printString("{'msg':'没有亲戚ID'}");
			return null;
		}
		UserRelative userRelative = userRelativeDAO.findById(relativeId);
				
		if(userRelative==null){
			printString("{'msg':'没有该亲戚'}");
			return null;
		}else{
			userRelativeDAO.delete(userRelative);
			/*用户信息修改*/
			UserInfoLog userInfoLog=new UserInfoLog(uuid,getRequest());
			userInfoLog.setRelativeId(userRelative.getUserRelativeId());   
			userInfoLog.setType(UserInfoLog.DELETE);
			userInfoLogger.debug(userInfoLog.toString());
			
			printString(MSG_SUCCESS);
			return null;
		}
	}

	/*
	 * for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#userDeleteFav()
	 */
	@Override
	public String userDeleteFav() {
		Integer goodsId=getIntegerParameter(GOODS_ID);
		String uuid = getStringParameter(UUID); 
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
		int userId=userLoginList.get(0).getUserId();
		List<UserFavorite> userFavorites=userFavoriteDAO.findByUserIdAndGoodId(userId, goodsId, favoriteType);
		if (userFavorites.isEmpty()) {
			printString("{'msg':'没有收藏'}");
			return null;
		}else{
			userFavoriteDAO.delete(userFavorites.get(0));
			
			/*用户收藏日志*/
			UserFavoriteLog userFavoriteLog=new UserFavoriteLog(uuid, getRequest());
			userFavoriteLog.setGoodsId(goodsId);
			userFavoriteLog.setType(UserFavoriteLog.DELETE);   //删除操作
			userFavoriteLogger.debug(userFavoriteLog.toString());
			
		}
		return null;
	}
	
	/*
	 * for statistic
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.StatisticInterface#statistic()
	 */
	@Override
	public void leavePage() {
		String uuid=getStringParameter(UUID);
		String pageName=getStringParameter("page");
		Integer time=getIntegerParameter("time");  //毫秒值
		
		LeaveCurrentPageLog leaveCurrentPage = new LeaveCurrentPageLog(uuid, getRequest());
		leaveCurrentPage.setPageName(pageName);
		leaveCurrentPage.setTime(time);
		leaveCurrentPageLogger.debug(leaveCurrentPage);
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
