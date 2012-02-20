package bean;

import java.sql.Timestamp;

/**
 * Show entity. @author MyEclipse Persistence Tools
 */
public class Show extends AbstractShow implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Show() {
	}

	/** full constructor */
	public Show(Integer userId, Short showType, String showTags,
			String showImages, String showTitle, Short contentType,
			String showContent, Integer showRank, Timestamp addTime) {
		super(userId, showType, showTags, showImages, showTitle, contentType,
				showContent, showRank, addTime);
	}

}
