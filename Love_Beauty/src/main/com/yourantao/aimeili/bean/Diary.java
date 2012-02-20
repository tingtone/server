package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * Diary entity. @author MyEclipse Persistence Tools
 */

public class Diary implements java.io.Serializable {

	// Fields

	private Integer diaryId;
	private Integer userId;
	private Short diaryPrivacy;
	private String diaryTags;
	private String diaryImages;
	private String diaryTitle;
	private Short contentType;
	private String diaryContent;
	private Integer diaryRank;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public Diary() {
	}

	/** full constructor */
	public Diary(Integer userId, Short diaryPrivacy, String diaryTags,
			String diaryImages, String diaryTitle, Short contentType,
			String diaryContent, Integer diaryRank, Timestamp addTime) {
		this.userId = userId;
		this.diaryPrivacy = diaryPrivacy;
		this.diaryTags = diaryTags;
		this.diaryImages = diaryImages;
		this.diaryTitle = diaryTitle;
		this.contentType = contentType;
		this.diaryContent = diaryContent;
		this.diaryRank = diaryRank;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getDiaryId() {
		return this.diaryId;
	}

	public void setDiaryId(Integer diaryId) {
		this.diaryId = diaryId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getDiaryPrivacy() {
		return this.diaryPrivacy;
	}

	public void setDiaryPrivacy(Short diaryPrivacy) {
		this.diaryPrivacy = diaryPrivacy;
	}

	public String getDiaryTags() {
		return this.diaryTags;
	}

	public void setDiaryTags(String diaryTags) {
		this.diaryTags = diaryTags;
	}

	public String getDiaryImages() {
		return this.diaryImages;
	}

	public void setDiaryImages(String diaryImages) {
		this.diaryImages = diaryImages;
	}

	public String getDiaryTitle() {
		return this.diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}

	public Short getContentType() {
		return this.contentType;
	}

	public void setContentType(Short contentType) {
		this.contentType = contentType;
	}

	public String getDiaryContent() {
		return this.diaryContent;
	}

	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}

	public Integer getDiaryRank() {
		return this.diaryRank;
	}

	public void setDiaryRank(Integer diaryRank) {
		this.diaryRank = diaryRank;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

}