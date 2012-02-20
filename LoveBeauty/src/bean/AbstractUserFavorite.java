package bean;

/**
 * AbstractUserFavorite entity provides the base persistence definition of the
 * UserFavorite entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserFavorite implements java.io.Serializable {

	// Fields

	private UserFavoriteId id;

	// Constructors

	/** default constructor */
	public AbstractUserFavorite() {
	}

	/** full constructor */
	public AbstractUserFavorite(UserFavoriteId id) {
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