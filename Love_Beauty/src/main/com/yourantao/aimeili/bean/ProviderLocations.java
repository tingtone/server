package main.com.yourantao.aimeili.bean;

/**
 * ProviderLocations entity. @author MyEclipse Persistence Tools
 */

public class ProviderLocations implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer providerId;
	private String province;
	private String city;
	private String distric;

	// Constructors

	/** default constructor */
	public ProviderLocations() {
	}

	/** full constructor */
	public ProviderLocations(Integer providerId, String province, String city,
			String distric) {
		this.providerId = providerId;
		this.province = province;
		this.city = city;
		this.distric = distric;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProviderId() {
		return this.providerId;
	}

	public void setProviderId(Integer providerId) {
		this.providerId = providerId;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistric() {
		return this.distric;
	}

	public void setDistric(String distric) {
		this.distric = distric;
	}

}