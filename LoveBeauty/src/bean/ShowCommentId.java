package bean;

import java.sql.Timestamp;

/**
 * ShowCommentId entity. @author MyEclipse Persistence Tools
 */
public class ShowCommentId extends AbstractShowCommentId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ShowCommentId() {
	}

	/** full constructor */
	public ShowCommentId(Integer showId, Integer userId, Short contentType,
			String commentContent, Timestamp addTime) {
		super(showId, userId, contentType, commentContent, addTime);
	}

}
