package main.com.yourantao.aimeili.bean;

/**
 * Series entity. @author MyEclipse Persistence Tools
 */

public class Series implements java.io.Serializable {

	// Fields

	private Integer seriesId;
	private String seriesName;
	private Integer brandId;
	private String seriesDescription;

	// Constructors

	/** default constructor */
	public Series() {
	}

	/** minimal constructor */
	public Series(String seriesName, Integer brandId) {
		this.seriesName = seriesName;
		this.brandId = brandId;
	}

	/** full constructor */
	public Series(String seriesName, Integer brandId, String seriesDescription) {
		this.seriesName = seriesName;
		this.brandId = brandId;
		this.seriesDescription = seriesDescription;
	}

	// Property accessors

	public Integer getSeriesId() {
		return this.seriesId;
	}

	public void setSeriesId(Integer seriesId) {
		this.seriesId = seriesId;
	}

	public String getSeriesName() {
		return this.seriesName;
	}

	public void setSeriesName(String seriesName) {
		this.seriesName = seriesName;
	}

	public Integer getBrandId() {
		return this.brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public String getSeriesDescription() {
		return this.seriesDescription;
	}

	public void setSeriesDescription(String seriesDescription) {
		this.seriesDescription = seriesDescription;
	}

}