package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;
import java.util.Date;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String nickName;
	private String email;
	private Short verified;
	private String sex;
	private Date birthday;
	private String mobile;
	private Integer imageId;
	private String description;
	private String skin;
	private String hair;
	private Integer point;
	private Integer coin;
	private Short vip;
	private Timestamp regTime;
	private Timestamp lastlogin;

	private UserLogin login;

	// Constructors

	/** default constructor */
	public User() {
		email = "";
		verified = 0;
		birthday = new Date(0);
		mobile = "";
		description = "";
		point = 0;
		coin = 0;
		vip = 0;
		regTime = new Timestamp(System.currentTimeMillis());
		lastlogin = new Timestamp(System.currentTimeMillis());
	}

	/** full constructor */
	public User(String nickName, String email, Short verified, String sex,
			Date birthday, String mobile, Integer imageId, String description,
			String skin, String hair, Integer point, Integer coin, Short vip,
			Timestamp regTime,Timestamp lastlogin) {
		this.nickName = nickName;
		this.email = email;
		this.verified = verified;
		this.sex = sex;
		this.birthday = birthday;
		this.mobile = mobile;
		this.setImageId(imageId);
		this.description = description;
		this.skin = skin;
		this.hair = hair;
		this.point = point;
		this.coin = coin;
		this.vip = vip;
		this.regTime = regTime;
		this.lastlogin = lastlogin;
	}

	// Property accessors

	public Timestamp getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(Timestamp lastlogin) {
		this.lastlogin = lastlogin;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return this.nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Short getVerified() {
		return this.verified;
	}

	public void setVerified(Short verified) {
		this.verified = verified;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSkin() {
		return this.skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getHair() {
		return this.hair;
	}

	public void setHair(String hair) {
		this.hair = hair;
	}

	public Integer getPoint() {
		return this.point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getCoin() {
		return this.coin;
	}

	public void setCoin(Integer coin) {
		this.coin = coin;
	}

	public Short getVip() {
		return this.vip;
	}

	public void setVip(Short vip) {
		this.vip = vip;
	}

	public Timestamp getRegTime() {
		return this.regTime;
	}

	public void setRegTime(Timestamp regTime) {
		this.regTime = regTime;
	}

	public void setLogin(UserLogin login) {
		this.login = login;
		login.setUser(this);
	}

	public UserLogin getLogin() {
		return login;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public Integer getImageId() {
		return imageId;
	}

}