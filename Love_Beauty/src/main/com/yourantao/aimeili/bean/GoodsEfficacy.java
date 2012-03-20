package main.com.yourantao.aimeili.bean;

/**
 * GoodsEfficacy entity. @author MyEclipse Persistence Tools
 */

public class GoodsEfficacy implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer efficacyId;
	private Goods goods;

	// Constructors

	/** default constructor */
	public GoodsEfficacy() {
	}

	/** full constructor */
	public GoodsEfficacy(Integer efficacyId, Goods goods) {
		this.efficacyId = efficacyId;
		this.setGoods(goods);
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

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Goods getGoods() {
		return goods;
	}

}