package bean;

import java.sql.Timestamp;

/**
 * AbstractQuestion entity provides the base persistence definition of the
 * Question entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractQuestion implements java.io.Serializable {

	// Fields

	private Integer questionId;
	private Integer userId;
	private String questionTitle;
	private Short contentType;
	private String questionContent;
	private Integer questionCoin;
	private Integer questionCoinRemain;
	private Integer questionRank;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public AbstractQuestion() {
	}

	/** full constructor */
	public AbstractQuestion(Integer userId, String questionTitle,
			Short contentType, String questionContent, Integer questionCoin,
			Integer questionCoinRemain, Integer questionRank, Timestamp addTime) {
		this.userId = userId;
		this.questionTitle = questionTitle;
		this.contentType = contentType;
		this.questionContent = questionContent;
		this.questionCoin = questionCoin;
		this.questionCoinRemain = questionCoinRemain;
		this.questionRank = questionRank;
		this.addTime = addTime;
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

	public String getQuestionTitle() {
		return this.questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public Short getContentType() {
		return this.contentType;
	}

	public void setContentType(Short contentType) {
		this.contentType = contentType;
	}

	public String getQuestionContent() {
		return this.questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Integer getQuestionCoin() {
		return this.questionCoin;
	}

	public void setQuestionCoin(Integer questionCoin) {
		this.questionCoin = questionCoin;
	}

	public Integer getQuestionCoinRemain() {
		return this.questionCoinRemain;
	}

	public void setQuestionCoinRemain(Integer questionCoinRemain) {
		this.questionCoinRemain = questionCoinRemain;
	}

	public Integer getQuestionRank() {
		return this.questionRank;
	}

	public void setQuestionRank(Integer questionRank) {
		this.questionRank = questionRank;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

}