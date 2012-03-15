package main.com.yourantao.aimeili.bean;

/**
 * Efficacy entity. @author MyEclipse Persistence Tools
 */

public class Efficacy implements java.io.Serializable {

	// Fields

	private Integer efficacyId;
	private String efficacyName;
	private Long efficacyRank;
	private Integer efficacyImageId;

	// Constructors

	/** default constructor */
	public Efficacy() {
	}

	/** full constructor */
	public Efficacy(String efficacyName, Long efficacyRank,
			Integer efficacyImageId) {
		this.efficacyName = efficacyName;
		this.efficacyRank = efficacyRank;
		this.efficacyImageId = efficacyImageId;
	}

	// Property accessors

	public Integer getEfficacyId() {
		return this.efficacyId;
	}

	public void setEfficacyId(Integer efficacyId) {
		this.efficacyId = efficacyId;
	}

	public String getEfficacyName() {
		return this.efficacyName;
	}

	public void setEfficacyName(String efficacyName) {
		this.efficacyName = efficacyName;
	}

	public Long getEfficacyRank() {
		return this.efficacyRank;
	}

	public void setEfficacyRank(Long efficacyRank) {
		this.efficacyRank = efficacyRank;
	}

	public Integer getEfficacyImageId() {
		return this.efficacyImageId;
	}

	public void setEfficacyImageId(Integer efficacyImageId) {
		this.efficacyImageId = efficacyImageId;
	}

}