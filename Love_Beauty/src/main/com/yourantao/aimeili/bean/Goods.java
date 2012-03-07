package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods implements java.io.Serializable {

	// Fields

	private Integer goodsId;
	private Integer brandId;
	private Integer seriesId;
	private Integer categoryId;
	private String goodsName;
	private Integer goodsThumbId;
	private Float goodsScore;
	private String goodsForskin;
	private String goodsNotforskin;
	private String goodsNoticeforskin;
	private String goodsAge;
	private String goodsDescription;
	private String goodsSpecification;
	private Integer goodsBuyCount;
	private Integer goodsViewCount;
	private Timestamp goodsAddTime;
	private Timestamp goodsLastUpdate;
	private Short goodsStatus;
	private Integer goodsRank;

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(Integer brandId, Integer seriesId, Integer categoryId,
			String goodsName, Integer goodsThumbId, Float goodsScore,
			String goodsForskin, String goodsAge, String goodsDescription,
			String goodsSpecification, Integer goodsBuyCount,
			Integer goodsViewCount, Timestamp goodsAddTime,
			Timestamp goodsLastUpdate, Short goodsStatus, Integer goodsRank) {
		this.brandId = brandId;
		this.seriesId = seriesId;
		this.categoryId = categoryId;
		this.goodsName = goodsName;
		this.goodsThumbId = goodsThumbId;
		this.goodsScore = goodsScore;
		this.goodsForskin = goodsForskin;
		this.goodsAge = goodsAge;
		this.goodsDescription = goodsDescription;
		this.goodsSpecification = goodsSpecification;
		this.goodsBuyCount = goodsBuyCount;
		this.goodsViewCount = goodsViewCount;
		this.goodsAddTime = goodsAddTime;
		this.goodsLastUpdate = goodsLastUpdate;
		this.goodsStatus = goodsStatus;
		this.goodsRank = goodsRank;
	}

	/** full constructor */
	public Goods(Integer brandId, Integer seriesId, Integer categoryId,
			String goodsName, Integer goodsThumbId, Float goodsScore,
			String goodsForskin, String goodsNotforskin,
			String goodsNoticeforskin, String goodsAge,
			String goodsDescription, String goodsSpecification,
			Integer goodsBuyCount, Integer goodsViewCount,
			Timestamp goodsAddTime, Timestamp goodsLastUpdate,
			Short goodsStatus, Integer goodsRank) {
		this.brandId = brandId;
		this.seriesId = seriesId;
		this.categoryId = categoryId;
		this.goodsName = goodsName;
		this.goodsThumbId = goodsThumbId;
		this.goodsScore = goodsScore;
		this.goodsForskin = goodsForskin;
		this.goodsNotforskin = goodsNotforskin;
		this.goodsNoticeforskin = goodsNoticeforskin;
		this.goodsAge = goodsAge;
		this.goodsDescription = goodsDescription;
		this.goodsSpecification = goodsSpecification;
		this.goodsBuyCount = goodsBuyCount;
		this.goodsViewCount = goodsViewCount;
		this.goodsAddTime = goodsAddTime;
		this.goodsLastUpdate = goodsLastUpdate;
		this.goodsStatus = goodsStatus;
		this.goodsRank = goodsRank;
	}

	// Property accessors

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getBrandId() {
		return this.brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public Integer getSeriesId() {
		return this.seriesId;
	}

	public void setSeriesId(Integer seriesId) {
		this.seriesId = seriesId;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getGoodsName() {
		return this.goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Integer getGoodsThumbId() {
		return this.goodsThumbId;
	}

	public void setGoodsThumbId(Integer goodsThumbId) {
		this.goodsThumbId = goodsThumbId;
	}

	public Float getGoodsScore() {
		return this.goodsScore;
	}

	public void setGoodsScore(Float goodsScore) {
		this.goodsScore = goodsScore;
	}

	public String getGoodsForskin() {
		return this.goodsForskin;
	}

	public void setGoodsForskin(String goodsForskin) {
		this.goodsForskin = goodsForskin;
	}

	public String getGoodsNotforskin() {
		return this.goodsNotforskin;
	}

	public void setGoodsNotforskin(String goodsNotforskin) {
		this.goodsNotforskin = goodsNotforskin;
	}

	public String getGoodsNoticeforskin() {
		return this.goodsNoticeforskin;
	}

	public void setGoodsNoticeforskin(String goodsNoticeforskin) {
		this.goodsNoticeforskin = goodsNoticeforskin;
	}

	public String getGoodsAge() {
		return this.goodsAge;
	}

	public void setGoodsAge(String goodsAge) {
		this.goodsAge = goodsAge;
	}

	public String getGoodsDescription() {
		return this.goodsDescription;
	}

	public void setGoodsDescription(String goodsDescription) {
		this.goodsDescription = goodsDescription;
	}

	public String getGoodsSpecification() {
		return this.goodsSpecification;
	}

	public void setGoodsSpecification(String goodsSpecification) {
		this.goodsSpecification = goodsSpecification;
	}

	public Integer getGoodsBuyCount() {
		return this.goodsBuyCount;
	}

	public void setGoodsBuyCount(Integer goodsBuyCount) {
		this.goodsBuyCount = goodsBuyCount;
	}

	public Integer getGoodsViewCount() {
		return this.goodsViewCount;
	}

	public void setGoodsViewCount(Integer goodsViewCount) {
		this.goodsViewCount = goodsViewCount;
	}

	public Timestamp getGoodsAddTime() {
		return this.goodsAddTime;
	}

	public void setGoodsAddTime(Timestamp goodsAddTime) {
		this.goodsAddTime = goodsAddTime;
	}

	public Timestamp getGoodsLastUpdate() {
		return this.goodsLastUpdate;
	}

	public void setGoodsLastUpdate(Timestamp goodsLastUpdate) {
		this.goodsLastUpdate = goodsLastUpdate;
	}

	public Short getGoodsStatus() {
		return this.goodsStatus;
	}

	public void setGoodsStatus(Short goodsStatus) {
		this.goodsStatus = goodsStatus;
	}

	public Integer getGoodsRank() {
		return this.goodsRank;
	}

	public void setGoodsRank(Integer goodsRank) {
		this.goodsRank = goodsRank;
	}

}