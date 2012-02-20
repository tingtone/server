package bean;

/**
 * AbstractProvider entity provides the base persistence definition of the
 * Provider entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractProvider implements java.io.Serializable {

	// Fields

	private Integer providerId;
	private String providerName;
	private String providerThumb;
	private String providerDescription;
	private String providerService;
	private String providerDeliver;

	// Constructors

	/** default constructor */
	public AbstractProvider() {
	}

	/** full constructor */
	public AbstractProvider(String providerName, String providerThumb,
			String providerDescription, String providerService,
			String providerDeliver) {
		this.providerName = providerName;
		this.providerThumb = providerThumb;
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

	public String getProviderThumb() {
		return this.providerThumb;
	}

	public void setProviderThumb(String providerThumb) {
		this.providerThumb = providerThumb;
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