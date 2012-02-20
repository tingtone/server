package bean;

/**
 * ShoppingCart entity. @author MyEclipse Persistence Tools
 */
public class ShoppingCart extends AbstractShoppingCart implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ShoppingCart() {
	}

	/** full constructor */
	public ShoppingCart(ShoppingCartId id) {
		super(id);
	}

}
