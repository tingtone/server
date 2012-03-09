package main.com.yourantao.aimeili.bean;

/**
 * ReportGoods entity. @author MyEclipse Persistence Tools
 */

public class ReportGoods implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer reportId;
	private Integer goodsId;
	private Float goodsScore;

	// Constructors

	/** default constructor */
	public ReportGoods() {
	}

	/** full constructor */
	public ReportGoods(Integer reportId, Integer goodsId, Float goodsScore) {
		this.reportId = reportId;
		this.goodsId = goodsId;
		this.goodsScore = goodsScore;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

}