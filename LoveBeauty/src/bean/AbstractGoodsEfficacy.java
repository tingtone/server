package bean;

/**
 * AbstractGoodsEfficacy entity provides the base persistence definition of the
 * GoodsEfficacy entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractGoodsEfficacy implements java.io.Serializable {

	// Fields

	private GoodsEfficacyId id;

	// Constructors

	/** default constructor */
	public AbstractGoodsEfficacy() {
	}

	/** full constructor */
	public AbstractGoodsEfficacy(GoodsEfficacyId id) {
		this.id = id;
	}

	// Property accessors

	public GoodsEfficacyId getId() {
		return this.id;
	}

	public void setId(GoodsEfficacyId id) {
		this.id = id;
	}

}