package main.com.yourantao.aimeili.bean;

/**
 * ProviderLocations entity. @author MyEclipse Persistence Tools
 */

public class ProviderLocations implements java.io.Serializable {

	// Fields

	private ProviderLocationsId id;

	// Constructors

	/** default constructor */
	public ProviderLocations() {
	}

	/** full constructor */
	public ProviderLocations(ProviderLocationsId id) {
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