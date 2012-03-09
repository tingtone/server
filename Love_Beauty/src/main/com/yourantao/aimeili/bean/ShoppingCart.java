package main.com.yourantao.aimeili.bean;

/**
 * ShoppingCart entity. @author MyEclipse Persistence Tools
 */

public class ShoppingCart implements java.io.Serializable {

	// Fields

	private Integer cartId;
	private Integer userId;
	private Integer goodsRealId;
	private Integer count;

	// Constructors

	/** default constructor */
	public ShoppingCart() {
	}

	/** full constructor */
	public ShoppingCart(Integer userId, Integer goodsRealId, Integer count) {
		this.userId = userId;
		this.goodsRealId = goodsRealId;
		this.count = count;
	}

	// Property accessors

	public Integer getCartId() {
		return this.cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGoodsRealId() {
		return this.goodsRealId;
	}

	public void setGoodsRealId(Integer goodsRealId) {
		this.goodsRealId = goodsRealId;
	}

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}