package bean;

import java.sql.Timestamp;

/**
 * CoinRecord entity. @author MyEclipse Persistence Tools
 */
public class CoinRecord extends AbstractCoinRecord implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public CoinRecord() {
	}

	/** full constructor */
	public CoinRecord(Integer userId, Short recordType, Integer relatedId,
			Integer variation, Timestamp addTime) {
		super(userId, recordType, relatedId, variation, addTime);
	}

}
