package bean;

import java.sql.Timestamp;

/**
 * Topic entity. @author MyEclipse Persistence Tools
 */
public class Topic extends AbstractTopic implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Topic() {
	}

	/** full constructor */
	public Topic(String topicName, Integer categoryId, String topicKeywords,
			String topicImages, Integer topicRank, Timestamp addTime) {
		super(topicName, categoryId, topicKeywords, topicImages, topicRank,
				addTime);
	}

}
