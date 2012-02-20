package bean;

import java.sql.Timestamp;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */
public class Order extends AbstractOrder implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** full constructor */
	public Order(Integer userId, String orderNum, Integer addressId,
			Float postage, String paymentType, String deliverType,
			String deliverTime, Short invoice, Timestamp addTime, Short finish,
			Integer providerId, String relatedNum, Short handled,
			Timestamp handledTime) {
		super(userId, orderNum, addressId, postage, paymentType, deliverType,
				deliverTime, invoice, addTime, finish, providerId, relatedNum,
				handled, handledTime);
	}

}
