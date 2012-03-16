package main.com.yourantao.aimeili.vo;

import java.util.Map;

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
	private Map relativeSkin;
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
	public Map getRelativeSkin() {
		return relativeSkin;
	}
	public void setRelativeSkin(Map relativeSkin) {
		this.relativeSkin = relativeSkin;
	}
	
}
