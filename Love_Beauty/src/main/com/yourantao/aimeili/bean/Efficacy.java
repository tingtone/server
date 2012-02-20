package main.com.yourantao.aimeili.bean;

/**
 * Efficacy entity. @author MyEclipse Persistence Tools
 */

public class Efficacy implements java.io.Serializable {

	// Fields

	private Integer efficacyId;
	private String efficacyName;
	private Integer efficacyRank;

	// Constructors

	/** default constructor */
	public Efficacy() {
	}

	/** full constructor */
	public Efficacy(String efficacyName, Integer efficacyRank) {
		this.efficacyName = efficacyName;
		this.efficacyRank = efficacyRank;
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

	public Integer getEfficacyRank() {
		return this.efficacyRank;
	}

	public void setEfficacyRank(Integer efficacyRank) {
		this.efficacyRank = efficacyRank;
	}

}