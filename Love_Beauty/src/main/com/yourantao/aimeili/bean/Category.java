package main.com.yourantao.aimeili.bean;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	private Integer categoryId;
	private String categoryName;
	private String categoryDescription;
	private Integer categoryRank;
	private Integer parentCatid;
	private Short catLayer;

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(String categoryName, String categoryDescription,
			Integer categoryRank, Integer parentCatid, Short catLayer) {
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
		this.categoryRank = categoryRank;
		this.parentCatid = parentCatid;
		this.catLayer = catLayer;
	}

	// Property accessors

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDescription() {
		return this.categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	public Integer getCategoryRank() {
		return this.categoryRank;
	}

	public void setCategoryRank(Integer categoryRank) {
		this.categoryRank = categoryRank;
	}

	public Integer getParentCatid() {
		return this.parentCatid;
	}

	public void setParentCatid(Integer parentCatid) {
		this.parentCatid = parentCatid;
	}

	public Short getCatLayer() {
		return this.catLayer;
	}

	public void setCatLayer(Short catLayer) {
		this.catLayer = catLayer;
	}

}