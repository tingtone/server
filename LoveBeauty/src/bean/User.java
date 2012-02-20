package bean;

import java.sql.Timestamp;
import java.util.Date;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String nickName, String email, Short verified, String sex,
			Date birthday, String mobile, String image, String description,
			String skin, String hair, Integer point, Integer coin, Short vip,
			Timestamp regTime) {
		super(nickName, email, verified, sex, birthday, mobile, image,
				description, skin, hair, point, coin, vip, regTime);
	}

}
