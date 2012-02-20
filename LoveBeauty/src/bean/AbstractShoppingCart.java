package bean;

/**
 * AbstractShoppingCart entity provides the base persistence definition of the
 * ShoppingCart entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractShoppingCart implements java.io.Serializable {

	// Fields

	private ShoppingCartId id;

	// Constructors

	/** default constructor */
	public AbstractShoppingCart() {
	}

	/** full constructor */
	public AbstractShoppingCart(ShoppingCartId id) {
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