package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * DiaryComment entity. @author MyEclipse Persistence Tools
 */

public class DiaryComment implements java.io.Serializable {

	// Fields

	private Integer commentId;
	private Integer diaryId;
	private Integer userId;
	private Short contentType;
	private String commentContent;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public DiaryComment() {
	}

	/** full constructor */
	public DiaryComment(Integer diaryId, Integer userId, Short contentType,
			String commentContent, Timestamp addTime) {
		this.diaryId = diaryId;
		this.userId = userId;
		this.contentType = contentType;
		this.commentContent = commentContent;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

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

}