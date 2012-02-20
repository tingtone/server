package bean;

import java.sql.Timestamp;

/**
 * UserFavoriteId entity. @author MyEclipse Persistence Tools
 */
public class UserFavoriteId extends AbstractUserFavoriteId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserFavoriteId() {
	}

	/** full constructor */
	public UserFavoriteId(Integer favoriteId, Integer userId,
			Short favoriteType, Integer relatedId, Timestamp addTime) {
		super(favoriteId, userId, favoriteType, relatedId, addTime);
	}

}
