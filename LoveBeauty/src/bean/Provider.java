package bean;

/**
 * Provider entity. @author MyEclipse Persistence Tools
 */
public class Provider extends AbstractProvider implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Provider() {
	}

	/** full constructor */
	public Provider(String providerName, String providerThumb,
			String providerDescription, String providerService,
			String providerDeliver) {
		super(providerName, providerThumb, providerDescription,
				providerService, providerDeliver);
	}

}
