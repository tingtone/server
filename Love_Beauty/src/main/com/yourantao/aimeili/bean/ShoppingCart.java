package main.com.yourantao.aimeili.bean;

/**
 * ShoppingCart entity. @author MyEclipse Persistence Tools
 */

public class ShoppingCart implements java.io.Serializable {

	// Fields

	private ShoppingCartId id;

	// Constructors

	/** default constructor */
	public ShoppingCart() {
	}

	/** full constructor */
	public ShoppingCart(ShoppingCartId id) {
		this.id = id;
	}

	// Property accessors

	public ShoppingCartId getId() {
		return this.id;
	}

	public void setId(ShoppingCartId id) {
		this.id = id;
	}

}