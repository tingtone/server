package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Topic entity. @author MyEclipse Persistence Tools
 */

public class Topic implements java.io.Serializable {

	// Fields

	private Integer topicId;
	private String topicName;
	private Integer categoryId;
	private String topicKeywords;
	private String topicImages;
	private Integer topicRank;
	private Timestamp addTime;
	private Set goods;

	// Constructors

	/** default constructor */
	public Topic() {
		goods = new HashSet();
	}

	/** full constructor */
	public Topic(String topicName, Integer categoryId, String topicKeywords,
			String topicImages, Integer topicRank, Timestamp addTime, Set goods) {
		this.topicName = topicName;
		this.setCategoryId(categoryId);
		this.topicKeywords = topicKeywords;
		this.topicImages = topicImages;
		this.topicRank = topicRank;
		this.addTime = addTime;
		this.goods = goods;
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

	public void setGoods(Set goods) {
		this.goods = goods;
	}

	public Set getGoods() {
		return goods;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

}