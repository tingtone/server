package main.com.yourantao.aimeili.bean;

/**
 * UserRelative entity. @author MyEclipse Persistence Tools
 */

public class UserRelative implements java.io.Serializable {

	// Fields

	private Integer userRelativeId;
	private Integer userId;
	private String relative;
	private String skin;

	// Constructors

	/** default constructor */
	public UserRelative() {
	}

	/** minimal constructor */
	public UserRelative(Integer userId, String relative) {
		this.userId = userId;
		this.relative = relative;
	}

	/** full constructor */
	public UserRelative(Integer userId, String relative, String skin) {
		this.userId = userId;
		this.relative = relative;
		this.skin = skin;
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

}