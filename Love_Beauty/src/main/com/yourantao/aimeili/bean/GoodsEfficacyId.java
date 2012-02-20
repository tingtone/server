package main.com.yourantao.aimeili.bean;

/**
 * GoodsEfficacyId entity. @author MyEclipse Persistence Tools
 */

public class GoodsEfficacyId implements java.io.Serializable {

	// Fields

	private Integer efficacyId;
	private Integer goodsId;

	// Constructors

	/** default constructor */
	public GoodsEfficacyId() {
	}

	/** full constructor */
	public GoodsEfficacyId(Integer efficacyId, Integer goodsId) {
		this.efficacyId = efficacyId;
		this.goodsId = goodsId;
	}

	// Property accessors

	public Integer getEfficacyId() {
		return this.efficacyId;
	}

	public void setEfficacyId(Integer efficacyId) {
		this.efficacyId = efficacyId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof GoodsEfficacyId))
			return false;
		GoodsEfficacyId castOther = (GoodsEfficacyId) other;

		return ((this.getEfficacyId() == castOther.getEfficacyId()) || (this
				.getEfficacyId() != null
				&& castOther.getEfficacyId() != null && this.getEfficacyId()
				.equals(castOther.getEfficacyId())))
				&& ((this.getGoodsId() == castOther.getGoodsId()) || (this
						.getGoodsId() != null
						&& castOther.getGoodsId() != null && this.getGoodsId()
						.equals(castOther.getGoodsId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getEfficacyId() == null ? 0 : this.getEfficacyId()
						.hashCode());
		result = 37 * result
				+ (getGoodsId() == null ? 0 : this.getGoodsId().hashCode());
		return result;
	}

}