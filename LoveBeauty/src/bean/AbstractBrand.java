package bean;

/**
 * AbstractBrand entity provides the base persistence definition of the Brand
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractBrand implements java.io.Serializable {

	// Fields

	private Integer brandId;
	private String brandName;
	private String brandAlias;
	private String brandOtherNames;
	private String brandDescription;
	private Integer brandRank;

	// Constructors

	/** default constructor */
	public AbstractBrand() {
	}

	/** full constructor */
	public AbstractBrand(String brandName, String brandAlias,
			String brandOtherNames, String brandDescription, Integer brandRank) {
		this.brandName = brandName;
		this.brandAlias = brandAlias;
		this.brandOtherNames = brandOtherNames;
		this.brandDescription = brandDescription;
		this.brandRank = brandRank;
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

	public Integer getBrandRank() {
		return this.brandRank;
	}

	public void setBrandRank(Integer brandRank) {
		this.brandRank = brandRank;
	}

}