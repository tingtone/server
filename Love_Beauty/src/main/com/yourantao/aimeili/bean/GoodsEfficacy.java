package main.com.yourantao.aimeili.bean;

/**
 * GoodsEfficacy entity. @author MyEclipse Persistence Tools
 */

public class GoodsEfficacy implements java.io.Serializable {

	// Fields

	private GoodsEfficacyId id;

	// Constructors

	/** default constructor */
	public GoodsEfficacy() {
	}

	/** full constructor */
	public GoodsEfficacy(GoodsEfficacyId id) {
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