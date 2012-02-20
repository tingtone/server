package bean;

/**
 * ShoppingCartId entity. @author MyEclipse Persistence Tools
 */
public class ShoppingCartId extends AbstractShoppingCartId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ShoppingCartId() {
	}

	/** full constructor */
	public ShoppingCartId(Integer userId, Integer goodsId, Integer count) {
		super(userId, goodsId, count);
	}

}
