package main.com.yourantao.aimeili.bean;

/**
 * UserAddress entity. @author MyEclipse Persistence Tools
 */

public class UserAddress implements java.io.Serializable {

	// Fields

	private Integer addressId;
	private Integer userId;
	private String province;
	private String city;
	private String district;
	private String detail;
	private String mobile;
	private String telephone;
	private String receiver;
	private String zipCode;
	private Short default_;

	// Constructors

	/** default constructor */
	public UserAddress() {
	}

	/** full constructor */
	public UserAddress(Integer userId, String province, String city,
			String district, String detail, String mobile, String telephone,
			String receiver, String zipCode, Short default_) {
		this.userId = userId;
		this.province = province;
		this.city = city;
		this.district = district;
		this.detail = detail;
		this.mobile = mobile;
		this.telephone = telephone;
		this.receiver = receiver;
		this.zipCode = zipCode;
		this.default_ = default_;
	}

	// Property accessors

	public Integer getAddressId() {
		return this.addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return this.district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getZipCode() {
		return this.zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public Short getDefault_() {
		return this.default_;
	}

	public void setDefault_(Short default_) {
		this.default_ = default_;
	}

}