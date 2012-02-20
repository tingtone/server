package bean;

import java.sql.Timestamp;

/**
 * Question entity. @author MyEclipse Persistence Tools
 */
public class Question extends AbstractQuestion implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Question() {
	}

	/** full constructor */
	public Question(Integer userId, String questionTitle, Short contentType,
			String questionContent, Integer questionCoin,
			Integer questionCoinRemain, Integer questionRank, Timestamp addTime) {
		super(userId, questionTitle, contentType, questionContent,
				questionCoin, questionCoinRemain, questionRank, addTime);
	}

}
