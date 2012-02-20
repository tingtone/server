package bean;

/**
 * UserAddress entity. @author MyEclipse Persistence Tools
 */
public class UserAddress extends AbstractUserAddress implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserAddress() {
	}

	/** full constructor */
	public UserAddress(Integer userId, Short province, Short city,
			Short district, String detail, String mobile, String telephone,
			String receiver, String zipCode, Short default_) {
		super(userId, province, city, district, detail, mobile, telephone,
				receiver, zipCode, default_);
	}

}
