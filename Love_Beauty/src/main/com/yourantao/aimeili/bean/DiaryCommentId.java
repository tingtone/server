package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * DiaryCommentId entity. @author MyEclipse Persistence Tools
 */

public class DiaryCommentId implements java.io.Serializable {

	// Fields

	private Integer diaryId;
	private Integer userId;
	private Short contentType;
	private String commentContent;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public DiaryCommentId() {
	}

	/** full constructor */
	public DiaryCommentId(Integer diaryId, Integer userId, Short contentType,
			String commentContent, Timestamp addTime) {
		this.diaryId = diaryId;
		this.userId = userId;
		this.contentType = contentType;
		this.commentContent = commentContent;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getDiaryId() {
		return this.diaryId;
	}

	public void setDiaryId(Integer diaryId) {
		this.diaryId = diaryId;
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

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof DiaryCommentId))
			return false;
		DiaryCommentId castOther = (DiaryCommentId) other;

		return ((this.getDiaryId() == castOther.getDiaryId()) || (this
				.getDiaryId() != null
				&& castOther.getDiaryId() != null && this.getDiaryId().equals(
				castOther.getDiaryId())))
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
						.equals(castOther.getAddTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getDiaryId() == null ? 0 : this.getDiaryId().hashCode());
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
		return result;
	}

}