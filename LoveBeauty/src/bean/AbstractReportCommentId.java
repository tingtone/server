package bean;

import java.sql.Timestamp;

/**
 * AbstractReportCommentId entity provides the base persistence definition of
 * the ReportCommentId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractReportCommentId implements java.io.Serializable {

	// Fields

	private Integer reportId;
	private Integer userId;
	private Short contentType;
	private String commentContent;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public AbstractReportCommentId() {
	}

	/** full constructor */
	public AbstractReportCommentId(Integer reportId, Integer userId,
			Short contentType, String commentContent, Timestamp addTime) {
		this.reportId = reportId;
		this.userId = userId;
		this.contentType = contentType;
		this.commentContent = commentContent;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getReportId() {
		return this.reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getContentType() {
		return this.contentType;
	}

	public void setContentType(Short contentType) {
		this.contentType = contentType;
	}

	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractReportCommentId))
			return false;
		AbstractReportCommentId castOther = (AbstractReportCommentId) other;

		return ((this.getReportId() == castOther.getReportId()) || (this
				.getReportId() != null
				&& castOther.getReportId() != null && this.getReportId()
				.equals(castOther.getReportId())))
				&& ((this.getUserId() == castOther.getUserId()) || (this
						.getUserId() != null
						&& castOther.getUserId() != null && this.getUserId()
						.equals(castOther.getUserId())))
				&& ((this.getContentType() == castOther.getContentType()) || (this
						.getContentType() != null
						&& castOther.getContentType() != null && this
						.getContentType().equals(castOther.getContentType())))
				&& ((this.getCommentContent() == castOther.getCommentContent()) || (this
						.getCommentContent() != null
						&& castOther.getCommentContent() != null && this
						.getCommentContent().equals(
								castOther.getCommentContent())))
				&& ((this.getAddTime() == castOther.getAddTime()) || (this
						.getAddTime() != null
						&& castOther.getAddTime() != null && this.getAddTime()
						.equals(castOther.getAddTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getReportId() == null ? 0 : this.getReportId().hashCode());
		result = 37 * result
				+ (getUserId() == null ? 0 : this.getUserId().hashCode());
		result = 37
				* result
				+ (getContentType() == null ? 0 : this.getContentType()
						.hashCode());
		result = 37
				* result
				+ (getCommentContent() == null ? 0 : this.getCommentContent()
						.hashCode());
		result = 37 * result
				+ (getAddTime() == null ? 0 : this.getAddTime().hashCode());
		return result;
	}

}