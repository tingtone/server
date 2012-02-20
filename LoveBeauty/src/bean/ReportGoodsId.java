package bean;

/**
 * ReportGoodsId entity. @author MyEclipse Persistence Tools
 */
public class ReportGoodsId extends AbstractReportGoodsId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ReportGoodsId() {
	}

	/** full constructor */
	public ReportGoodsId(Integer reportId, Integer goodsId, Float goodsScore) {
		super(reportId, goodsId, goodsScore);
	}

}
