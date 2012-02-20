package main.com.yourantao.aimeili.bean;

/**
 * ReportComment entity. @author MyEclipse Persistence Tools
 */

public class ReportComment implements java.io.Serializable {

	// Fields

	private ReportCommentId id;

	// Constructors

	/** default constructor */
	public ReportComment() {
	}

	/** full constructor */
	public ReportComment(ReportCommentId id) {
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