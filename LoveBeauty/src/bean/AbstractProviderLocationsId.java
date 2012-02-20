package bean;

/**
 * AbstractProviderLocationsId entity provides the base persistence definition
 * of the ProviderLocationsId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractProviderLocationsId implements
		java.io.Serializable {

	// Fields

	private Integer providerId;
	private String province;
	private String city;
	private String distric;

	// Constructors

	/** default constructor */
	public AbstractProviderLocationsId() {
	}

	/** full constructor */
	public AbstractProviderLocationsId(Integer providerId, String province,
			String city, String distric) {
		this.providerId = providerId;
		this.province = province;
		this.city = city;
		this.distric = distric;
	}

	// Property accessors

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

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractProviderLocationsId))
			return false;
		AbstractProviderLocationsId castOther = (AbstractProviderLocationsId) other;

		return ((this.getProviderId() == castOther.getProviderId()) || (this
				.getProviderId() != null
				&& castOther.getProviderId() != null && this.getProviderId()
				.equals(castOther.getProviderId())))
				&& ((this.getProvince() == castOther.getProvince()) || (this
						.getProvince() != null
						&& castOther.getProvince() != null && this
						.getProvince().equals(castOther.getProvince())))
				&& ((this.getCity() == castOther.getCity()) || (this.getCity() != null
						&& castOther.getCity() != null && this.getCity()
						.equals(castOther.getCity())))
				&& ((this.getDistric() == castOther.getDistric()) || (this
						.getDistric() != null
						&& castOther.getDistric() != null && this.getDistric()
						.equals(castOther.getDistric())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getProviderId() == null ? 0 : this.getProviderId()
						.hashCode());
		result = 37 * result
				+ (getProvince() == null ? 0 : this.getProvince().hashCode());
		result = 37 * result
				+ (getCity() == null ? 0 : this.getCity().hashCode());
		result = 37 * result
				+ (getDistric() == null ? 0 : this.getDistric().hashCode());
		return result;
	}

}