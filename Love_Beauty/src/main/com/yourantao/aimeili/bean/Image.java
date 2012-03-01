package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * Image entity. @author MyEclipse Persistence Tools
 */

public class Image implements java.io.Serializable {

	// Fields

	private Integer imgId;
	private String imgUrl;
	private Long imgCrc;
	private Integer imgWidth;
	private Integer imgHeight;
	private Long imgSize;
	private Integer imgType;
	private Timestamp creatTime;

	// Constructors

	/** default constructor */
	public Image() {
	}

	/** minimal constructor */
	public Image(Integer imgWidth, Integer imgHeight, Long imgSize) {
		this.imgWidth = imgWidth;
		this.imgHeight = imgHeight;
		this.imgSize = imgSize;
	}

	/** full constructor */
	public Image(String imgUrl, Long imgCrc, Integer imgWidth,
			Integer imgHeight, Long imgSize, Integer imgType,
			Timestamp creatTime) {
		this.imgUrl = imgUrl;
		this.imgCrc = imgCrc;
		this.imgWidth = imgWidth;
		this.imgHeight = imgHeight;
		this.imgSize = imgSize;
		this.imgType = imgType;
		this.creatTime = creatTime;
	}

	// Property accessors

	public Integer getImgId() {
		return this.imgId;
	}

	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}

	public String getImgUrl() {
		return this.imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Long getImgCrc() {
		return this.imgCrc;
	}

	public void setImgCrc(Long imgCrc) {
		this.imgCrc = imgCrc;
	}

	public Integer getImgWidth() {
		return this.imgWidth;
	}

	public void setImgWidth(Integer imgWidth) {
		this.imgWidth = imgWidth;
	}

	public Integer getImgHeight() {
		return this.imgHeight;
	}

	public void setImgHeight(Integer imgHeight) {
		this.imgHeight = imgHeight;
	}

	public Long getImgSize() {
		return this.imgSize;
	}

	public void setImgSize(Long imgSize) {
		this.imgSize = imgSize;
	}

	public Integer getImgType() {
		return this.imgType;
	}

	public void setImgType(Integer imgType) {
		this.imgType = imgType;
	}

	public Timestamp getCreatTime() {
		return this.creatTime;
	}

	public void setCreatTime(Timestamp creatTime) {
		this.creatTime = creatTime;
	}

}