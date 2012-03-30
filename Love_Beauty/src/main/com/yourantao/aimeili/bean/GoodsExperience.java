package main.com.yourantao.aimeili.bean;

/**
 * GoodsExperience entity. @author MyEclipse Persistence Tools
 */

public class GoodsExperience implements java.io.Serializable {

	// Fields

	private Integer experienceId;
	private Integer goodsId;
	private String goodsName;
	private String experienceName;
	private Short experienceFrom;
	private String experienceIntroduction;
	private String experienceDetail;

	// Constructors

	/** default constructor */
	public GoodsExperience() {
	}

	/** minimal constructor */
	public GoodsExperience(String goodsName, String experienceName,
			Short experienceFrom) {
		this.goodsName = goodsName;
		this.experienceName = experienceName;
		this.experienceFrom = experienceFrom;
	}

	/** full constructor */
	public GoodsExperience(Integer goodsId, String goodsName,
			String experienceName, Short experienceFrom,
			String experienceIntroduction, String experienceDetail) {
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.experienceName = experienceName;
		this.experienceFrom = experienceFrom;
		this.experienceIntroduction = experienceIntroduction;
		this.experienceDetail = experienceDetail;
	}

	// Property accessors

	public Integer getExperienceId() {
		return this.experienceId;
	}

	public void setExperienceId(Integer experienceId) {
		this.experienceId = experienceId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return this.goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getExperienceName() {
		return this.experienceName;
	}

	public void setExperienceName(String experienceName) {
		this.experienceName = experienceName;
	}

	public Short getExperienceFrom() {
		return this.experienceFrom;
	}

	public void setExperienceFrom(Short experienceFrom) {
		this.experienceFrom = experienceFrom;
	}

	public String getExperienceIntroduction() {
		return this.experienceIntroduction;
	}

	public void setExperienceIntroduction(String experienceIntroduction) {
		this.experienceIntroduction = experienceIntroduction;
	}

	public String getExperienceDetail() {
		return this.experienceDetail;
	}

	public void setExperienceDetail(String experienceDetail) {
		this.experienceDetail = experienceDetail;
	}

}