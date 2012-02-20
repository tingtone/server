package bean;

/**
 * AbstractReportComment entity provides the base persistence definition of the
 * ReportComment entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractReportComment implements java.io.Serializable {

	// Fields

	private ReportCommentId id;

	// Constructors

	/** default constructor */
	public AbstractReportComment() {
	}

	/** full constructor */
	public AbstractReportComment(ReportCommentId id) {
		this.id = id;
	}

	// Property accessors

	public ReportCommentId getId() {
		return this.id;
	}

	public void setId(ReportCommentId id) {
		this.id = id;
	}

}