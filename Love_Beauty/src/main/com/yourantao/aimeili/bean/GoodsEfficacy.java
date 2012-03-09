package main.com.yourantao.aimeili.bean;

/**
 * GoodsEfficacy entity. @author MyEclipse Persistence Tools
 */

public class GoodsEfficacy implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer efficacyId;
	private Integer goodsId;

	// Constructors

	/** default constructor */
	public GoodsEfficacy() {
	}

	/** full constructor */
	public GoodsEfficacy(Integer efficacyId, Integer goodsId) {
		this.efficacyId = efficacyId;
		this.goodsId = goodsId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

}