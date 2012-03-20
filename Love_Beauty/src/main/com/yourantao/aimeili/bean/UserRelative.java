package main.com.yourantao.aimeili.bean;

import java.util.Date;

/**
 * UserRelative entity. @author MyEclipse Persistence Tools
 */

public class UserRelative implements java.io.Serializable {

	// Fields

	private Integer userRelativeId;
	private Integer userId;
	private String relative;
	private String skin;
	private String city;
	private Date birthday;

	// Constructors

	/** default constructor */
	public UserRelative() {
	}

	/** minimal constructor */
	public UserRelative(Integer userId, String relative, String city,
			Date birthday) {
		this.userId = userId;
		this.relative = relative;
		this.city = city;
		this.birthday = birthday;
	}

	/** full constructor */
	public UserRelative(Integer userId, String relative, String skin,
			String city, Date birthday) {
		this.userId = userId;
		this.relative = relative;
		this.skin = skin;
		this.city = city;
		this.birthday = birthday;
	}

	// Property accessors

	public Integer getUserRelativeId() {
		return this.userRelativeId;
	}

	public void setUserRelativeId(Integer userRelativeId) {
		this.userRelativeId = userRelativeId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getRelative() {
		return this.relative;
	}

	public void setRelative(String relative) {
		this.relative = relative;
	}

	public String getSkin() {
		return this.skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

}