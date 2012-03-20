package main.com.yourantao.aimeili.vo;

import java.util.Date;


/**
 * 用户信息展示类(肤质和其亲戚的肤质)
 * 
 * @author mac
 * 创建时间： 2012-3-13 下午03:29:33
 * 修改时间：2012-3-13 下午03:29:33
 * 具体描述： TODO
 */
public class UserView {
	private int userId;
	private String skin;
	private String birthday;
	private String city;
	private String userName;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getSkin() {
		return skin;
	}
	public void setSkin(String skin) {
		this.skin = skin;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
