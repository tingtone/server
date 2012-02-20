package bean;

/**
 * AbstractProviderLocations entity provides the base persistence definition of
 * the ProviderLocations entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractProviderLocations implements java.io.Serializable {

	// Fields

	private ProviderLocationsId id;

	// Constructors

	/** default constructor */
	public AbstractProviderLocations() {
	}

	/** full constructor */
	public AbstractProviderLocations(ProviderLocationsId id) {
		this.id = id;
	}

	// Property accessors

	public ProviderLocationsId getId() {
		return this.id;
	}

	public void setId(ProviderLocationsId id) {
		this.id = id;
	}

}