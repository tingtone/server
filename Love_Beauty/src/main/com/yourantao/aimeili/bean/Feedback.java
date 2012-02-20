package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * Feedback entity. @author MyEclipse Persistence Tools
 */

public class Feedback implements java.io.Serializable {

	// Fields

	private Integer feedbackId;
	private Integer userId;
	private String content;
	private Timestamp addTime;
	private Short read;

	// Constructors

	/** default constructor */
	public Feedback() {
	}

	/** full constructor */
	public Feedback(Integer userId, String content, Timestamp addTime,
			Short read) {
		this.userId = userId;
		this.content = content;
		this.addTime = addTime;
		this.read = read;
	}

	// Property accessors

	public Integer getFeedbackId() {
		return this.feedbackId;
	}

	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public Short getRead() {
		return this.read;
	}

	public void setRead(Short read) {
		this.read = read;
	}

}