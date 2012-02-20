package bean;

/**
 * AbstractUserAddress entity provides the base persistence definition of the
 * UserAddress entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserAddress implements java.io.Serializable {

	// Fields

	private Integer addressId;
	private Integer userId;
	private Short province;
	private Short city;
	private Short district;
	private String detail;
	private String mobile;
	private String telephone;
	private String receiver;
	private String zipCode;
	private Short default_;

	// Constructors

	/** default constructor */
	public AbstractUserAddress() {
	}

	/** full constructor */
	public AbstractUserAddress(Integer userId, Short province, Short city,
			Short district, String detail, String mobile, String telephone,
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

	public Short getProvince() {
		return this.province;
	}

	public void setProvince(Short province) {
		this.province = province;
	}

	public Short getCity() {
		return this.city;
	}

	public void setCity(Short city) {
		this.city = city;
	}

	public Short getDistrict() {
		return this.district;
	}

	public void setDistrict(Short district) {
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