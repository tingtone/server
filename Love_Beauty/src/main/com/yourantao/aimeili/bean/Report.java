package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * Report entity. @author MyEclipse Persistence Tools
 */

public class Report implements java.io.Serializable {

	// Fields

	private Integer reportId;
	private Integer userId;
	private String reportTags;
	private String reportImages;
	private String reportTitle;
	private Short contentType;
	private String reportContent;
	private Integer reportRank;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public Report() {
	}

	/** full constructor */
	public Report(Integer userId, String reportTags, String reportImages,
			String reportTitle, Short contentType, String reportContent,
			Integer reportRank, Timestamp addTime) {
		this.userId = userId;
		this.reportTags = reportTags;
		this.reportImages = reportImages;
		this.reportTitle = reportTitle;
		this.contentType = contentType;
		this.reportContent = reportContent;
		this.reportRank = reportRank;
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

	public String getReportTags() {
		return this.reportTags;
	}

	public void setReportTags(String reportTags) {
		this.reportTags = reportTags;
	}

	public String getReportImages() {
		return this.reportImages;
	}

	public void setReportImages(String reportImages) {
		this.reportImages = reportImages;
	}

	public String getReportTitle() {
		return this.reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public Short getContentType() {
		return this.contentType;
	}

	public void setContentType(Short contentType) {
		this.contentType = contentType;
	}

	public String getReportContent() {
		return this.reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Integer getReportRank() {
		return this.reportRank;
	}

	public void setReportRank(Integer reportRank) {
		this.reportRank = reportRank;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

}