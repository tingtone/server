package main.com.yourantao.aimeili.bean;

/**
 * ReportGoodsId entity. @author MyEclipse Persistence Tools
 */

public class ReportGoodsId implements java.io.Serializable {

	// Fields

	private Integer reportId;
	private Integer goodsId;
	private Float goodsScore;

	// Constructors

	/** default constructor */
	public ReportGoodsId() {
	}

	/** full constructor */
	public ReportGoodsId(Integer reportId, Integer goodsId, Float goodsScore) {
		this.reportId = reportId;
		this.goodsId = goodsId;
		this.goodsScore = goodsScore;
	}

	// Property accessors

	public Integer getReportId() {
		return this.reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Float getGoodsScore() {
		return this.goodsScore;
	}

	public void setGoodsScore(Float goodsScore) {
		this.goodsScore = goodsScore;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ReportGoodsId))
			return false;
		ReportGoodsId castOther = (ReportGoodsId) other;

		return ((this.getReportId() == castOther.getReportId()) || (this
				.getReportId() != null
				&& castOther.getReportId() != null && this.getReportId()
				.equals(castOther.getReportId())))
				&& ((this.getGoodsId() == castOther.getGoodsId()) || (this
						.getGoodsId() != null
						&& castOther.getGoodsId() != null && this.getGoodsId()
						.equals(castOther.getGoodsId())))
				&& ((this.getGoodsScore() == castOther.getGoodsScore()) || (this
						.getGoodsScore() != null
						&& castOther.getGoodsScore() != null && this
						.getGoodsScore().equals(castOther.getGoodsScore())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getReportId() == null ? 0 : this.getReportId().hashCode());
		result = 37 * result
				+ (getGoodsId() == null ? 0 : this.getGoodsId().hashCode());
		result = 37
				* result
				+ (getGoodsScore() == null ? 0 : this.getGoodsScore()
						.hashCode());
		return result;
	}

}