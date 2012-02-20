package bean;

/**
 * UserLogin entity. @author MyEclipse Persistence Tools
 */
public class UserLogin extends AbstractUserLogin implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserLogin() {
	}

	/** full constructor */
	public UserLogin(Integer userId, String userName, String password,
			String passwordQuestion, String passwordAnswer, String uuid) {
		super(userId, userName, password, passwordQuestion, passwordAnswer,
				uuid);
	}

}
