package main.com.yourantao.aimeili.vo;

public class ProviderView {
	
	private int providerId;
	private String providerName;
	private String providerThumb;
	public int getProviderId() {
		return providerId;
	}

	public void setProviderId(int providerId) {
		this.providerId = providerId;
	}

	public String getProviderName() {
		return providerName;
	}

	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}

	public String getProviderThumb() {
		return providerThumb;
	}

	public void setProviderThumb(String providerThumb) {
		this.providerThumb = providerThumb;
	}

	public String getProviderDescription() {
		return providerDescription;
	}

	public void setProviderDescription(String providerDescription) {
		this.providerDescription = providerDescription;
	}

	public String getProviderService() {
		return providerService;
	}

	public void setProviderService(String providerService) {
		this.providerService = providerService;
	}

	public String getProviderDeliver() {
		return providerDeliver;
	}

	public void setProviderDeliver(String providerDeliver) {
		this.providerDeliver = providerDeliver;
	}

	private String providerDescription;
	private String providerService;
	private String providerDeliver;

	public ProviderView()
	{}
}
