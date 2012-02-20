package bean;

import java.sql.Timestamp;

/**
 * Report entity. @author MyEclipse Persistence Tools
 */
public class Report extends AbstractReport implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Report() {
	}

	/** full constructor */
	public Report(Integer userId, String reportTags, String reportImages,
			String reportTitle, Short contentType, String reportContent,
			Integer reportRank, Timestamp addTime) {
		super(userId, reportTags, reportImages, reportTitle, contentType,
				reportContent, reportRank, addTime);
	}

}
