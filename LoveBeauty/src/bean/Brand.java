package bean;

/**
 * Brand entity. @author MyEclipse Persistence Tools
 */
public class Brand extends AbstractBrand implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Brand() {
	}

	/** full constructor */
	public Brand(String brandName, String brandAlias, String brandOtherNames,
			String brandDescription, Integer brandRank) {
		super(brandName, brandAlias, brandOtherNames, brandDescription,
				brandRank);
	}

}
