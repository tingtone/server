package bean;

import java.sql.Timestamp;

/**
 * Feedback entity. @author MyEclipse Persistence Tools
 */
public class Feedback extends AbstractFeedback implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Feedback() {
	}

	/** full constructor */
	public Feedback(Integer userId, String content, Timestamp addTime,
			Short read) {
		super(userId, content, addTime, read);
	}

}
