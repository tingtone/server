package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * UserMessage entity. @author MyEclipse Persistence Tools
 */

public class UserMessage implements java.io.Serializable {

	// Fields

	private Integer messageId;
	private Integer userId;
	private String messageText;
	private String messageMd5;
	private Timestamp messageTime;

	// Constructors

	/** default constructor */
	public UserMessage() {
	}

	/** full constructor */
	public UserMessage(Integer userId, String messageText, String messageMd5,
			Timestamp messageTime) {
		this.userId = userId;
		this.messageText = messageText;
		this.messageMd5 = messageMd5;
		this.messageTime = messageTime;
	}

	// Property accessors

	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getMessageText() {
		return this.messageText;
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	public String getMessageMd5() {
		return this.messageMd5;
	}

	public void setMessageMd5(String messageMd5) {
		this.messageMd5 = messageMd5;
	}

	public Timestamp getMessageTime() {
		return this.messageTime;
	}

	public void setMessageTime(Timestamp messageTime) {
		this.messageTime = messageTime;
	}

}