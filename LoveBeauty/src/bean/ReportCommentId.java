package bean;

import java.sql.Timestamp;

/**
 * ReportCommentId entity. @author MyEclipse Persistence Tools
 */
public class ReportCommentId extends AbstractReportCommentId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ReportCommentId() {
	}

	/** full constructor */
	public ReportCommentId(Integer reportId, Integer userId, Short contentType,
			String commentContent, Timestamp addTime) {
		super(reportId, userId, contentType, commentContent, addTime);
	}

}
