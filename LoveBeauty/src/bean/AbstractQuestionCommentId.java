package bean;

import java.sql.Timestamp;

/**
 * AbstractQuestionCommentId entity provides the base persistence definition of
 * the QuestionCommentId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractQuestionCommentId implements java.io.Serializable {

	// Fields

	private Integer questionId;
	private Integer userId;
	private Short contentType;
	private String commentContent;
	private Timestamp addTime;
	private Integer coin;

	// Constructors

	/** default constructor */
	public AbstractQuestionCommentId() {
	}

	/** full constructor */
	public AbstractQuestionCommentId(Integer questionId, Integer userId,
			Short contentType, String commentContent, Timestamp addTime,
			Integer coin) {
		this.questionId = questionId;
		this.userId = userId;
		this.contentType = contentType;
		this.commentContent = commentContent;
		this.addTime = addTime;
		this.coin = coin;
	}

	// Property accessors

	public Integer getQuestionId() {
		return this.questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getContentType() {
		return this.contentType;
	}

	public void setContentType(Short contentType) {
		this.contentType = contentType;
	}

	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public Integer getCoin() {
		return this.coin;
	}

	public void setCoin(Integer coin) {
		this.coin = coin;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractQuestionCommentId))
			return false;
		AbstractQuestionCommentId castOther = (AbstractQuestionCommentId) other;

		return ((this.getQuestionId() == castOther.getQuestionId()) || (this
				.getQuestionId() != null
				&& castOther.getQuestionId() != null && this.getQuestionId()
				.equals(castOther.getQuestionId())))
				&& ((this.getUserId() == castOther.getUserId()) || (this
						.getUserId() != null
						&& castOther.getUserId() != null && this.getUserId()
						.equals(castOther.getUserId())))
				&& ((this.getContentType() == castOther.getContentType()) || (this
						.getContentType() != null
						&& castOther.getContentType() != null && this
						.getContentType().equals(castOther.getContentType())))
				&& ((this.getCommentContent() == castOther.getCommentContent()) || (this
						.getCommentContent() != null
						&& castOther.getCommentContent() != null && this
						.getCommentContent().equals(
								castOther.getCommentContent())))
				&& ((this.getAddTime() == castOther.getAddTime()) || (this
						.getAddTime() != null
						&& castOther.getAddTime() != null && this.getAddTime()
						.equals(castOther.getAddTime())))
				&& ((this.getCoin() == castOther.getCoin()) || (this.getCoin() != null
						&& castOther.getCoin() != null && this.getCoin()
						.equals(castOther.getCoin())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getQuestionId() == null ? 0 : this.getQuestionId()
						.hashCode());
		result = 37 * result
				+ (getUserId() == null ? 0 : this.getUserId().hashCode());
		result = 37
				* result
				+ (getContentType() == null ? 0 : this.getContentType()
						.hashCode());
		result = 37
				* result
				+ (getCommentContent() == null ? 0 : this.getCommentContent()
						.hashCode());
		result = 37 * result
				+ (getAddTime() == null ? 0 : this.getAddTime().hashCode());
		result = 37 * result
				+ (getCoin() == null ? 0 : this.getCoin().hashCode());
		return result;
	}

}