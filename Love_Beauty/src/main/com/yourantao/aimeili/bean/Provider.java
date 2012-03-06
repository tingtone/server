package main.com.yourantao.aimeili.bean;

/**
 * Provider entity. @author MyEclipse Persistence Tools
 */

public class Provider implements java.io.Serializable {

	// Fields

	private Integer providerId;
	private String providerName;
	private Integer providerThumbId;
	private String providerDescription;
	private String providerService;
	private String providerDeliver;

	// Constructors

	/** default constructor */
	public Provider() {
	}

	/** full constructor */
	public Provider(String providerName, Integer providerThumbId,
			String providerDescription, String providerService,
			String providerDeliver) {
		this.providerName = providerName;
		this.providerThumbId = providerThumbId;
		this.providerDescription = providerDescription;
		this.providerService = providerService;
		this.providerDeliver = providerDeliver;
	}

	// Property accessors

	public Integer getProviderId() {
		return this.providerId;
	}

	public void setProviderId(Integer providerId) {
		this.providerId = providerId;
	}

	public String getProviderName() {
		return this.providerName;
	}

	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}

	public Integer getProviderThumbId() {
		return this.providerThumbId;
	}

	public void setProviderThumbId(Integer providerThumbId) {
		this.providerThumbId = providerThumbId;
	}

	public String getProviderDescription() {
		return this.providerDescription;
	}

	public void setProviderDescription(String providerDescription) {
		this.providerDescription = providerDescription;
	}

	public String getProviderService() {
		return this.providerService;
	}

	public void setProviderService(String providerService) {
		this.providerService = providerService;
	}

	public String getProviderDeliver() {
		return this.providerDeliver;
	}

	public void setProviderDeliver(String providerDeliver) {
		this.providerDeliver = providerDeliver;
	}

}