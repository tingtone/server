package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * Topic entity. @author MyEclipse Persistence Tools
 */

public class Topic implements java.io.Serializable {

	// Fields

	private Integer topicId;
	private String topicName;
	private Integer categoryId;
	private String topicKeywords;
	private Integer topicImagesId;
	private Integer topicRank;
	private Timestamp addTime;
	private Integer topicThumbId;

	// Constructors

	/** default constructor */
	public Topic() {
	}

	/** minimal constructor */
	public Topic(String topicName, Integer categoryId, String topicKeywords,
			Integer topicRank, Timestamp addTime) {
		this.topicName = topicName;
		this.categoryId = categoryId;
		this.topicKeywords = topicKeywords;
		this.topicRank = topicRank;
		this.addTime = addTime;
	}

	/** full constructor */
	public Topic(String topicName, Integer categoryId, String topicKeywords,
			Integer topicImagesId, Integer topicRank, Timestamp addTime,
			Integer topicThumbId) {
		this.topicName = topicName;
		this.categoryId = categoryId;
		this.topicKeywords = topicKeywords;
		this.topicImagesId = topicImagesId;
		this.topicRank = topicRank;
		this.addTime = addTime;
		this.topicThumbId = topicThumbId;
	}

	// Property accessors

	public Integer getTopicId() {
		return this.topicId;
	}

	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	public String getTopicName() {
		return this.topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getTopicKeywords() {
		return this.topicKeywords;
	}

	public void setTopicKeywords(String topicKeywords) {
		this.topicKeywords = topicKeywords;
	}

	public Integer getTopicImagesId() {
		return this.topicImagesId;
	}

	public void setTopicImagesId(Integer topicImagesId) {
		this.topicImagesId = topicImagesId;
	}

	public Integer getTopicRank() {
		return this.topicRank;
	}

	public void setTopicRank(Integer topicRank) {
		this.topicRank = topicRank;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public Integer getTopicThumbId() {
		return this.topicThumbId;
	}

	public void setTopicThumbId(Integer topicThumbId) {
		this.topicThumbId = topicThumbId;
	}

}