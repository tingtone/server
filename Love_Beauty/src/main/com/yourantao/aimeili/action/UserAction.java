package main.com.yourantao.aimeili.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.Goods;
import main.com.yourantao.aimeili.bean.GoodsDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.Series;
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
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.TransTool;
import main.com.yourantao.aimeili.vo.GoodsView;
import main.com.yourantao.aimeili.vo.UserView;

import org.hibernate.mapping.Array;
import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserAction extends BaseAction implements UserInterface,Constant{
	private static final Logger log = LoggerFactory.getLogger(UserAction.class);
	private UserDAO userDAO;
	private UserLoginDAO userLoginDAO;
	private UserFavoriteDAO userFavoriteDAO;
	private GoodsDAO goodsDAO;
	private UserAddressDAO userAddressDAO;
	private UserRelativeDAO userRelativeDAO;
	
	
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
	
	
	/* for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#insertTopic()
	 */
	@Override
	public String userInsertFav() {
		String msg="";
		String uuid=getReqeust().getParameter("uuid");
		Integer gid=getIntegerParameter(GOODS_ID);
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			outputString(msg);
			return null;
		}
		if(gid==null || gid==0){
			msg="{'msg':'没有商品号'}";
			outputString(msg);
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		Integer uid=userLogin.get(0).getUserId();
		if(uid==null || uid==0){
			msg="{'msg':'设备号未登记'}";
			outputString(msg);
			return null;
		}
		List<UserFavorite> userfavlist=userFavoriteDAO.findByUidAndGid(uid,gid);
		if(userfavlist.size()!=0){
			msg="{'msg':'重复的收藏'}";
			outputString(msg);
			return null;
		}
		UserFavorite userFavorite=new UserFavorite();
		userFavorite.setAddTime(Timestamp.valueOf(dateFormat.format(new Date())));
		userFavorite.setFavoriteType((short)0);    //暂时只收藏商品，不收藏专题
		userFavorite.setRelatedId(gid);
		userFavorite.setUserId(uid);
		userFavoriteDAO.save(userFavorite);
		
		outputString(msg);
		return null;
	}
	
	/* for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#insertTopic()
	 */
	@Override
	public String userLoginRegister() {
		String msg="";  //默认返回成功
		String uuid=getReqeust().getParameter("uuid");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		if(userLogin.size()==0){    //无此用户，改用户注册
			User user=new User();
			UserLogin userLogin2=new UserLogin();
			userLogin2.setUuid(uuid);
			user.setRegTime(Timestamp.valueOf(dateFormat.format(new Date())));
			user.setLastlogin(Timestamp.valueOf(dateFormat.format(new Date())));
			user.setLogin(userLogin2);
			userDAO.save(user);
		}else{  //用户存在，修改登录时间
			User user=userDAO.findById(userLogin.get(0).getUserId());
			user.setLastlogin(Timestamp.valueOf(dateFormat.format(new Date())));
		}
		
		outputString(msg);  //返回成功或者失败
		return null;
	}
	
	/* for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#userUpdateUserInfo()
	 */
	@Override
	public String userUpdateUserInfo() {
		String msg="";
		String uuid=getReqeust().getParameter("uuid");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			return null;
		}
		String skin=getReqeust().getParameter("skin");
		if(skin==null){
			msg="{'msg':'没有肤质结果'}";
			return null;
		}
		String skinName=TransTool.transSkin(skin);
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		User user=userDAO.findById(userLogin.get(0).getUserId());
		user.setSkin(skinName);
		user.setLogin(userLogin.get(0));
		
		outputString(msg);
		return null;
	}
	
	/*
	 * for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#getUserAddress()
	 */
	@Override
	public String getUserAddress() {
		//获取参数
		String uuid=getReqeust().getParameter("uuid");
		if(uuid==null){
			outputString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		if(userLogin.size()==0){
			outputString("{'msg':'没有该用户'}");
			return null;
		}
		int userId=userLogin.get(0).getUserId();
		List<UserAddress> userAddresses=userAddressDAO.findByUserId(userId);
		printArray(userAddresses);
		return null;
	}
	
	/*
	 * for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#UserUpdateAddress()
	 */
	@Override
	public String userUpdateAddress() {
		String msg="";
		int aid=getIntegerParameter(ADDRESS_ID);   //送货信息id
		if(aid==0){
			msg="{'msg':'没有送货地址'}";
			return null;
		}
		String location=getReqeust().getParameter("loc");   //省，市，区
		String [] locations=location.split("/");  //0-》省，1-》市，2=》区
		String address=getReqeust().getParameter("add");
		String userName=getReqeust().getParameter("user");
		String telphone=getReqeust().getParameter("tel");
		String zipCode=getReqeust().getParameter("code");
		
		UserAddress userAddress=userAddressDAO.findById(aid);
		userAddress.setCity(locations[1]);
		userAddress.setProvince(locations[0]);
		userAddress.setDistrict(locations[2]);
		userAddress.setDetail(address);
		userAddress.setReceiver(userName);
		userAddress.setMobile(telphone);
		userAddress.setZipCode(zipCode);
		outputString(msg);
		return null;
	}
	
	/*
	 * for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#userInsertAddress()
	 */
	@Override
	public String userInsertAddress() {
		String msg="";
		String uuid=getReqeust().getParameter("uuid");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		int uid=userLogin.get(0).getUserId();
		UserAddress userAddress=new UserAddress();
		String location=getReqeust().getParameter("loc");   //省，市，区
		String [] locations=location.split("/");  //0-》省，1-》市，2=》区
		String address=getReqeust().getParameter("add");
		String userName=getReqeust().getParameter("user");
		String telphone=getReqeust().getParameter("tel");
		String zipCode=getReqeust().getParameter("code");
		
		userAddress.setUserId(uid);
		userAddress.setCity(locations[1]);
		userAddress.setProvince(locations[0]);
		userAddress.setDistrict(locations[2]);
		userAddress.setDetail(address);
		userAddress.setReceiver(userName);
		userAddress.setMobile(telphone);
		userAddress.setZipCode(zipCode);
		userAddress.setDefault_((short)1);
		
		userAddressDAO.save(userAddress);
		outputString(msg);
		return null;
	}
	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#deleteUserAddress()
	 */
	public String deleteUserAddress() {
		String msg="";
		//获取参数
		String uuid=getReqeust().getParameter("uuid");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		int uid=userLogin.get(0).getUserId();
		int addressId = getIntegerParameter(ADDRESS_ID);//
		UserAddress userAddress = userAddressDAO.findById(addressId);
		if(userAddress.getUserId() == uid)
		{
			userAddressDAO.delete(userAddress);//
		}
		else
		{
			msg = "{'msg':'地址与用户不匹配'}";
		}
		outputString(msg);
		return null;
		
	}
	
	/*
	 * for Client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#userRelativeSkin()
	 */
	@Override
	public String userInsertRelativeSkin() {
		String msg="";
		String uuid=getReqeust().getParameter("uuid");
		String skin=getReqeust().getParameter("skin");
		String relative=getReqeust().getParameter("rel");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			outputString(msg);
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		if(userLogin.size()==0){
			msg="{'msg':'没有该用户'}";
			outputString(msg);
			return null;
		}
		int uid=userLogin.get(0).getUserId();
		if(skin==null){
			msg="{'msg':'没有皮肤id'}";
			outputString(msg);
			return null;
		}
		if(relative==null){
			msg="{'msg':'没有亲戚关键词'}";
			outputString(msg);
			return null;
		}
//		try {
//			String outStr = new String(relative.getBytes("iso-8859-1"),"UTF-8");   //浏览器页面发来的就为乱码~~
//			log.error("out:{}",outStr);
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		relative =URLDecoder.decode(relative);
		skin=TransTool.transSkin(skin);
		List userRelativeList=userRelativeDAO.findByUidAndRelative(relative,uid);
		if(userRelativeList.size()!=0){
			msg="{'msg':'重复收录亲戚'}";
			outputString(msg);
			return null;
		}
		UserRelative userRelative=new UserRelative();
		userRelative.setUserId(uid);
		userRelative.setSkin(skin);
		userRelative.setRelative(relative);
		userRelativeDAO.save(userRelative);
		
		outputString(msg);
		return null;
	}
	
	/*
	 * for Client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#getUserAndRelativeSkin()
	 */
	@Override
	public String getUserAndRelativeSkin() {
		String msg="";
		String uuid=getReqeust().getParameter("uuid");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			outputString(msg);
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		if(userLogin.size()==0){
			msg="{'msg':'没有该用户'}";
			outputString(msg);
			return null;
		}
		int uid=userLogin.get(0).getUserId();
		User user=userDAO.findById(userLogin.get(0).getUserId());
		UserView userView=new UserView();
		
		Map<String, String> relative=new HashMap<String, String>();    //用map保存 （亲戚名：肤质）
		List<UserRelative> userRelatives=userRelativeDAO.findByUserId(uid);
		for (UserRelative userRelative : userRelatives) {
			relative.put(userRelative.getRelative(), userRelative.getSkin());
		}	
		
		userView.setSkin(user.getSkin());
		userView.setUserId(uid);
		userView.setRelativeSkin(relative);
		printObject(userView);
		return null;
	}
	
	/*
	 * for Client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.UserInterface#userDeleteRelativeSkin()
	 */
	@Override
	public String userDeleteRelativeSkin() {
		String msg="";
		String uuid=getReqeust().getParameter("uuid");
		String relative=getReqeust().getParameter("rel");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			outputString(msg);
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		if(userLogin.size()==0){
			msg="{'msg':'没有该用户'}";
			outputString(msg);
			return null;
		}
		int uid=userLogin.get(0).getUserId();
		if(relative==null){
			msg="{'msg':'没有亲戚关键词'}";
			outputString(msg);
			return null;
		}
		List<UserRelative> userRelative=userRelativeDAO.findByUidAndRelative(relative, uid);
		userRelativeDAO.delete(userRelative.get(0));
		return null;
	}
	
}
