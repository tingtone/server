package bean;

import java.sql.Timestamp;

/**
 * AbstractTopic entity provides the base persistence definition of the Topic
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTopic implements java.io.Serializable {

	// Fields

	private Integer topicId;
	private String topicName;
	private Integer categoryId;
	private String topicKeywords;
	private String topicImages;
	private Integer topicRank;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public AbstractTopic() {
	}

	/** full constructor */
	public AbstractTopic(String topicName, Integer categoryId,
			String topicKeywords, String topicImages, Integer topicRank,
			Timestamp addTime) {
		this.topicName = topicName;
		this.categoryId = categoryId;
		this.topicKeywords = topicKeywords;
		this.topicImages = topicImages;
		this.topicRank = topicRank;
		this.addTime = addTime;
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

	public String getTopicImages() {
		return this.topicImages;
	}

	public void setTopicImages(String topicImages) {
		this.topicImages = topicImages;
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

}