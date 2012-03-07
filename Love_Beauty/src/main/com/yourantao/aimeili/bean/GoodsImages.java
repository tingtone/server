package main.com.yourantao.aimeili.bean;

/**
 * GoodsImages entity. @author MyEclipse Persistence Tools
 */

public class GoodsImages implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer goodsId;
	private Integer imgId;

	// Constructors

	/** default constructor */
	public GoodsImages() {
	}

	/** full constructor */
	public GoodsImages(Integer goodsId, Integer imgId) {
		this.goodsId = goodsId;
		this.imgId = imgId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getImgId() {
		return this.imgId;
	}

	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}

}