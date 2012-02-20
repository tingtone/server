package bean;

import java.sql.Timestamp;

/**
 * AbstractShow entity provides the base persistence definition of the Show
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractShow implements java.io.Serializable {

	// Fields

	private Integer showId;
	private Integer userId;
	private Short showType;
	private String showTags;
	private String showImages;
	private String showTitle;
	private Short contentType;
	private String showContent;
	private Integer showRank;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public AbstractShow() {
	}

	/** full constructor */
	public AbstractShow(Integer userId, Short showType, String showTags,
			String showImages, String showTitle, Short contentType,
			String showContent, Integer showRank, Timestamp addTime) {
		this.userId = userId;
		this.showType = showType;
		this.showTags = showTags;
		this.showImages = showImages;
		this.showTitle = showTitle;
		this.contentType = contentType;
		this.showContent = showContent;
		this.showRank = showRank;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getShowId() {
		return this.showId;
	}

	public void setShowId(Integer showId) {
		this.showId = showId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getShowType() {
		return this.showType;
	}

	public void setShowType(Short showType) {
		this.showType = showType;
	}

	public String getShowTags() {
		return this.showTags;
	}

	public void setShowTags(String showTags) {
		this.showTags = showTags;
	}

	public String getShowImages() {
		return this.showImages;
	}

	public void setShowImages(String showImages) {
		this.showImages = showImages;
	}

	public String getShowTitle() {
		return this.showTitle;
	}

	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}

	public Short getContentType() {
		return this.contentType;
	}

	public void setContentType(Short contentType) {
		this.contentType = contentType;
	}

	public String getShowContent() {
		return this.showContent;
	}

	public void setShowContent(String showContent) {
		this.showContent = showContent;
	}

	public Integer getShowRank() {
		return this.showRank;
	}

	public void setShowRank(Integer showRank) {
		this.showRank = showRank;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

}