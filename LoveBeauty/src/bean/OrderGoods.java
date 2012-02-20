package bean;

/**
 * OrderGoods entity. @author MyEclipse Persistence Tools
 */
public class OrderGoods extends AbstractOrderGoods implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public OrderGoods() {
	}

	/** full constructor */
	public OrderGoods(Integer orderId, Integer goodsId, Integer count) {
		super(orderId, goodsId, count);
	}

}
