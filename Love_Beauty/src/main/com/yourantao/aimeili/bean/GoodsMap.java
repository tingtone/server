package main.com.yourantao.aimeili.bean;

/**
 * GoodsMap entity. @author MyEclipse Persistence Tools
 */

public class GoodsMap implements java.io.Serializable {

	// Fields

	private Integer mapId;
	private Integer goodsRealId;
	private Integer goodsId;

	// Constructors

	/** default constructor */
	public GoodsMap() {
	}

	/** full constructor */
	public GoodsMap(Integer goodsRealId, Integer goodsId) {
		this.goodsRealId = goodsRealId;
		this.goodsId = goodsId;
	}

	// Property accessors

	public Integer getMapId() {
		return this.mapId;
	}

	public void setMapId(Integer mapId) {
		this.mapId = mapId;
	}

	public Integer getGoodsRealId() {
		return this.goodsRealId;
	}

	public void setGoodsRealId(Integer goodsRealId) {
		this.goodsRealId = goodsRealId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

}