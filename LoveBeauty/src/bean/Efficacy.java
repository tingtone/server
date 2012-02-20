package bean;

/**
 * Efficacy entity. @author MyEclipse Persistence Tools
 */
public class Efficacy extends AbstractEfficacy implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Efficacy() {
	}

	/** full constructor */
	public Efficacy(String efficacyName, Integer efficacyRank) {
		super(efficacyName, efficacyRank);
	}

}
