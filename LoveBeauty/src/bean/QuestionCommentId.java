package bean;

import java.sql.Timestamp;

/**
 * QuestionCommentId entity. @author MyEclipse Persistence Tools
 */
public class QuestionCommentId extends AbstractQuestionCommentId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public QuestionCommentId() {
	}

	/** full constructor */
	public QuestionCommentId(Integer questionId, Integer userId,
			Short contentType, String commentContent, Timestamp addTime,
			Integer coin) {
		super(questionId, userId, contentType, commentContent, addTime, coin);
	}

}
