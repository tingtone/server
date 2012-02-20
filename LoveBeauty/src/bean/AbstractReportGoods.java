package bean;

/**
 * AbstractReportGoods entity provides the base persistence definition of the
 * ReportGoods entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractReportGoods implements java.io.Serializable {

	// Fields

	private ReportGoodsId id;

	// Constructors

	/** default constructor */
	public AbstractReportGoods() {
	}

	/** full constructor */
	public AbstractReportGoods(ReportGoodsId id) {
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