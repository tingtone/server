package main.com.yourantao.aimeili.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.Goods;
import main.com.yourantao.aimeili.bean.GoodsDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.Series;
import main.com.yourantao.aimeili.bean.User;
import main.com.yourantao.aimeili.bean.UserDAO;
import main.com.yourantao.aimeili.bean.UserFavorite;
import main.com.yourantao.aimeili.bean.UserFavoriteDAO;
import main.com.yourantao.aimeili.bean.UserLogin;
import main.com.yourantao.aimeili.bean.UserLoginDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.TransTool;
import main.com.yourantao.aimeili.vo.GoodsView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserAction extends BaseAction implements UserInterface,Constant{
	private static final Logger log = LoggerFactory.getLogger(UserAction.class);
	private UserDAO userDAO;
	private UserLoginDAO userLoginDAO;
	private UserFavoriteDAO userFavoriteDAO;
	private GoodsDAO goodsDAO;
	
	
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
	
}
