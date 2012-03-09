package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * GoodsReal entity. @author MyEclipse Persistence Tools
 */

public class GoodsReal implements java.io.Serializable {

	// Fields

	private Integer goodsRealId;
	private Integer providerId;
	private Integer brandId;
	private Integer categoryId;
	private String brandName;
	private String categoryName;
	private String seriesName;
	private String goodsName;
	private String goodsThumb;
	private String goodsImages;
	private Float goodsPrice;
	private String goodsContent;
	private String goodsUrl;
	private String goodsOrigPid;
	private Float goodsScore;
	private String goodsForskin;
	private String goodsNotforskin;
	private String goodsNoticeforskin;
	private String goodsAge;
	private String goodsDescription;
	private String goodsSpecification;
	private Integer goodsCount;
	private Short goodsIsNew;
	private Short goodsIsHot;
	private Integer goodsBuyCount;
	private Integer goodsViewCount;
	private Timestamp goodsAddTime;
	private Timestamp goodsLastUpdate;
	private Short goodsStatus;
	private Integer goodsRank;

	// Constructors

	/** default constructor */
	public GoodsReal() {
	}

	/** minimal constructor */
	public GoodsReal(Integer providerId, Integer brandId, Integer categoryId,
			String brandName, String categoryName, String seriesName,
			String goodsName, String goodsThumb, String goodsImages,
			Float goodsPrice, String goodsUrl, String goodsOrigPid,
			Float goodsScore, String goodsForskin, String goodsAge,
			String goodsDescription, String goodsSpecification,
			Integer goodsCount, Short goodsIsNew, Short goodsIsHot,
			Integer goodsBuyCount, Integer goodsViewCount,
			Timestamp goodsAddTime, Timestamp goodsLastUpdate,
			Short goodsStatus, Integer goodsRank) {
		this.providerId = providerId;
		this.brandId = brandId;
		this.categoryId = categoryId;
		this.brandName = brandName;
		this.categoryName = categoryName;
		this.seriesName = seriesName;
		this.goodsName = goodsName;
		this.goodsThumb = goodsThumb;
		this.goodsImages = goodsImages;
		this.goodsPrice = goodsPrice;
		this.goodsUrl = goodsUrl;
		this.goodsOrigPid = goodsOrigPid;
		this.goodsScore = goodsScore;
		this.goodsForskin = goodsForskin;
		this.goodsAge = goodsAge;
		this.goodsDescription = goodsDescription;
		this.goodsSpecification = goodsSpecification;
		this.goodsCount = goodsCount;
		this.goodsIsNew = goodsIsNew;
		this.goodsIsHot = goodsIsHot;
		this.goodsBuyCount = goodsBuyCount;
		this.goodsViewCount = goodsViewCount;
		this.goodsAddTime = goodsAddTime;
		this.goodsLastUpdate = goodsLastUpdate;
		this.goodsStatus = goodsStatus;
		this.goodsRank = goodsRank;
	}

	/** full constructor */
	public GoodsReal(Integer providerId, Integer brandId, Integer categoryId,
			String brandName, String categoryName, String seriesName,
			String goodsName, String goodsThumb, String goodsImages,
			Float goodsPrice, String goodsContent, String goodsUrl,
			String goodsOrigPid, Float goodsScore, String goodsForskin,
			String goodsNotforskin, String goodsNoticeforskin, String goodsAge,
			String goodsDescription, String goodsSpecification,
			Integer goodsCount, Short goodsIsNew, Short goodsIsHot,
			Integer goodsBuyCount, Integer goodsViewCount,
			Timestamp goodsAddTime, Timestamp goodsLastUpdate,
			Short goodsStatus, Integer goodsRank) {
		this.providerId = providerId;
		this.brandId = brandId;
		this.categoryId = categoryId;
		this.brandName = brandName;
		this.categoryName = categoryName;
		this.seriesName = seriesName;
		this.goodsName = goodsName;
		this.goodsThumb = goodsThumb;
		this.goodsImages = goodsImages;
		this.goodsPrice = goodsPrice;
		this.goodsContent = goodsContent;
		this.goodsUrl = goodsUrl;
		this.goodsOrigPid = goodsOrigPid;
		this.goodsScore = goodsScore;
		this.goodsForskin = goodsForskin;
		this.goodsNotforskin = goodsNotforskin;
		this.goodsNoticeforskin = goodsNoticeforskin;
		this.goodsAge = goodsAge;
		this.goodsDescription = goodsDescription;
		this.goodsSpecification = goodsSpecification;
		this.goodsCount = goodsCount;
		this.goodsIsNew = goodsIsNew;
		this.goodsIsHot = goodsIsHot;
		this.goodsBuyCount = goodsBuyCount;
		this.goodsViewCount = goodsViewCount;
		this.goodsAddTime = goodsAddTime;
		this.goodsLastUpdate = goodsLastUpdate;
		this.goodsStatus = goodsStatus;
		this.goodsRank = goodsRank;
	}

	// Property accessors

	public Integer getGoodsRealId() {
		return this.goodsRealId;
	}

	public void setGoodsRealId(Integer goodsRealId) {
		this.goodsRealId = goodsRealId;
	}

	public Integer getProviderId() {
		return this.providerId;
	}

	public void setProviderId(Integer providerId) {
		this.providerId = providerId;
	}

	public Integer getBrandId() {
		return this.brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getBrandName() {
		return this.brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSeriesName() {
		return this.seriesName;
	}

	public void setSeriesName(String seriesName) {
		this.seriesName = seriesName;
	}

	public String getGoodsName() {
		return this.goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsThumb() {
		return this.goodsThumb;
	}

	public void setGoodsThumb(String goodsThumb) {
		this.goodsThumb = goodsThumb;
	}

	public String getGoodsImages() {
		return this.goodsImages;
	}

	public void setGoodsImages(String goodsImages) {
		this.goodsImages = goodsImages;
	}

	public Float getGoodsPrice() {
		return this.goodsPrice;
	}

	public void setGoodsPrice(Float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsContent() {
		return this.goodsContent;
	}

	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}

	public String getGoodsUrl() {
		return this.goodsUrl;
	}

	public void setGoodsUrl(String goodsUrl) {
		this.goodsUrl = goodsUrl;
	}

	public String getGoodsOrigPid() {
		return this.goodsOrigPid;
	}

	public void setGoodsOrigPid(String goodsOrigPid) {
		this.goodsOrigPid = goodsOrigPid;
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

	public Integer getGoodsCount() {
		return this.goodsCount;
	}

	public void setGoodsCount(Integer goodsCount) {
		this.goodsCount = goodsCount;
	}

	public Short getGoodsIsNew() {
		return this.goodsIsNew;
	}

	public void setGoodsIsNew(Short goodsIsNew) {
		this.goodsIsNew = goodsIsNew;
	}

	public Short getGoodsIsHot() {
		return this.goodsIsHot;
	}

	public void setGoodsIsHot(Short goodsIsHot) {
		this.goodsIsHot = goodsIsHot;
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