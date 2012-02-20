package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * CoinRecord entity. @author MyEclipse Persistence Tools
 */

public class CoinRecord implements java.io.Serializable {

	// Fields

	private Integer recordId;
	private Integer userId;
	private Short recordType;
	private Integer relatedId;
	private Integer variation;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public CoinRecord() {
	}

	/** full constructor */
	public CoinRecord(Integer userId, Short recordType, Integer relatedId,
			Integer variation, Timestamp addTime) {
		this.userId = userId;
		this.recordType = recordType;
		this.relatedId = relatedId;
		this.variation = variation;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getRecordType() {
		return this.recordType;
	}

	public void setRecordType(Short recordType) {
		this.recordType = recordType;
	}

	public Integer getRelatedId() {
		return this.relatedId;
	}

	public void setRelatedId(Integer relatedId) {
		this.relatedId = relatedId;
	}

	public Integer getVariation() {
		return this.variation;
	}

	public void setVariation(Integer variation) {
		this.variation = variation;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

}