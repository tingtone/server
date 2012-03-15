package main.com.yourantao.aimeili.bean;

/**
 * Brand entity. @author MyEclipse Persistence Tools
 */

public class Brand implements java.io.Serializable {

	// Fields

	private Integer brandId;
	private String brandName;
	private String brandAlias;
	private String brandOtherNames;
	private String brandDescription;
	private Long brandRank;
	private Integer brandImageId;

	// Constructors

	/** default constructor */
	public Brand() {
	}

	/** full constructor */
	public Brand(String brandName, String brandAlias, String brandOtherNames,
			String brandDescription, Long brandRank, Integer brandImageId) {
		this.brandName = brandName;
		this.brandAlias = brandAlias;
		this.brandOtherNames = brandOtherNames;
		this.brandDescription = brandDescription;
		this.brandRank = brandRank;
		this.brandImageId = brandImageId;
	}

	// Property accessors

	public Integer getBrandId() {
		return this.brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public String getBrandName() {
		return this.brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getBrandAlias() {
		return this.brandAlias;
	}

	public void setBrandAlias(String brandAlias) {
		this.brandAlias = brandAlias;
	}

	public String getBrandOtherNames() {
		return this.brandOtherNames;
	}

	public void setBrandOtherNames(String brandOtherNames) {
		this.brandOtherNames = brandOtherNames;
	}

	public String getBrandDescription() {
		return this.brandDescription;
	}

	public void setBrandDescription(String brandDescription) {
		this.brandDescription = brandDescription;
	}

	public Long getBrandRank() {
		return this.brandRank;
	}

	public void setBrandRank(Long brandRank) {
		this.brandRank = brandRank;
	}

	public Integer getBrandImageId() {
		return this.brandImageId;
	}

	public void setBrandImageId(Integer brandImageId) {
		this.brandImageId = brandImageId;
	}

}