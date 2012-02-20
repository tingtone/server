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
	private String image;
	private String description;
	private String skin;
	private String hair;
	private Integer point;
	private Integer coin;
	private Short vip;
	private Timestamp regTime;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String nickName, String email, Short verified, String sex,
			Date birthday, String mobile, String image, String description,
			String skin, String hair, Integer point, Integer coin, Short vip,
			Timestamp regTime) {
		this.nickName = nickName;
		this.email = email;
		this.verified = verified;
		this.sex = sex;
		this.birthday = birthday;
		this.mobile = mobile;
		this.image = image;
		this.description = description;
		this.skin = skin;
		this.hair = hair;
		this.point = point;
		this.coin = coin;
		this.vip = vip;
		this.regTime = regTime;
	}

	// Property accessors

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

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
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

}