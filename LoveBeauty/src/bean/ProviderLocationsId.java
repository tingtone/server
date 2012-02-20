package bean;

/**
 * ProviderLocationsId entity. @author MyEclipse Persistence Tools
 */
public class ProviderLocationsId extends AbstractProviderLocationsId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ProviderLocationsId() {
	}

	/** full constructor */
	public ProviderLocationsId(Integer providerId, String province,
			String city, String distric) {
		super(providerId, province, city, distric);
	}

}
