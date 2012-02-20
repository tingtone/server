package main.com.yourantao.aimeili.bean;

/**
 * OrderGoods entity. @author MyEclipse Persistence Tools
 */

public class OrderGoods implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private Integer goodsId;
	private Integer count;

	// Constructors

	/** default constructor */
	public OrderGoods() {
	}

	/** full constructor */
	public OrderGoods(Integer orderId, Integer goodsId, Integer count) {
		this.orderId = orderId;
		this.goodsId = goodsId;
		this.count = count;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}