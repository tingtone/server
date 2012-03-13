package main.com.yourantao.aimeili.bean;

/**
 * UserLogin entity. @author MyEclipse Persistence Tools
 */

public class UserLogin implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String password;
	private String passwordQuestion;
	private String passwordAnswer;
	private String uuid;

	private User user;

	// Constructors

	/** default constructor */
	public UserLogin() {
		userName = "";
		password = "";
		passwordQuestion = "";
		passwordAnswer = "";
		uuid = "";
	}

	/** full constructor */
	public UserLogin(Integer userId, String userName, String password,
			String passwordQuestion, String passwordAnswer, String uuid) {
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.passwordQuestion = passwordQuestion;
		this.passwordAnswer = passwordAnswer;
		this.uuid = uuid;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordQuestion() {
		return this.passwordQuestion;
	}

	public void setPasswordQuestion(String passwordQuestion) {
		this.passwordQuestion = passwordQuestion;
	}

	public String getPasswordAnswer() {
		return this.passwordAnswer;
	}

	public void setPasswordAnswer(String passwordAnswer) {
		this.passwordAnswer = passwordAnswer;
	}

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

}