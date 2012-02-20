package main.com.yourantao.aimeili.bean;

/**
 * UserFavorite entity. @author MyEclipse Persistence Tools
 */

public class UserFavorite implements java.io.Serializable {

	// Fields

	private UserFavoriteId id;

	// Constructors

	/** default constructor */
	public UserFavorite() {
	}

	/** full constructor */
	public UserFavorite(UserFavoriteId id) {
		this.id = id;
	}

	// Property accessors

	public UserFavoriteId getId() {
		return this.id;
	}

	public void setId(UserFavoriteId id) {
		this.id = id;
	}

}