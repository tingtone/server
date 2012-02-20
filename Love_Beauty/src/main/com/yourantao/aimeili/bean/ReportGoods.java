package main.com.yourantao.aimeili.bean;

/**
 * ReportGoods entity. @author MyEclipse Persistence Tools
 */

public class ReportGoods implements java.io.Serializable {

	// Fields

	private ReportGoodsId id;

	// Constructors

	/** default constructor */
	public ReportGoods() {
	}

	/** full constructor */
	public ReportGoods(ReportGoodsId id) {
		this.id = id;
	}

	// Property accessors

	public ReportGoodsId getId() {
		return this.id;
	}

	public void setId(ReportGoodsId id) {
		this.id = id;
	}

}