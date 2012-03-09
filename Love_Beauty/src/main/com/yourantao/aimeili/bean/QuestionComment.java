package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * QuestionComment entity. @author MyEclipse Persistence Tools
 */

public class QuestionComment implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer questionId;
	private Integer userId;
	private Short contentType;
	private String commentContent;
	private Timestamp addTime;
	private Integer coin;

	// Constructors

	/** default constructor */
	public QuestionComment() {
	}

	/** full constructor */
	public QuestionComment(Integer questionId, Integer userId,
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

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

}