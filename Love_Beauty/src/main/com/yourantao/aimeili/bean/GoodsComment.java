package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * GoodsComment entity. @author MyEclipse Persistence Tools
 */

public class GoodsComment implements java.io.Serializable {

	// Fields

	private Integer commentId;
	private Integer goodsRealId;
	private String commentator;
	private String commentContent;
	private Short commentLevel;
	private Integer commentRank;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public GoodsComment() {
	}

	/** full constructor */
	public GoodsComment(Integer goodsRealId, String commentator,
			String commentContent, Short commentLevel, Integer commentRank,
			Timestamp addTime) {
		this.goodsRealId = goodsRealId;
		this.commentator = commentator;
		this.commentContent = commentContent;
		this.commentLevel = commentLevel;
		this.commentRank = commentRank;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public Integer getGoodsRealId() {
		return this.goodsRealId;
	}

	public void setGoodsRealId(Integer goodsRealId) {
		this.goodsRealId = goodsRealId;
	}

	public String getCommentator() {
		return this.commentator;
	}

	public void setCommentator(String commentator) {
		this.commentator = commentator;
	}

	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Short getCommentLevel() {
		return this.commentLevel;
	}

	public void setCommentLevel(Short commentLevel) {
		this.commentLevel = commentLevel;
	}

	public Integer getCommentRank() {
		return this.commentRank;
	}

	public void setCommentRank(Integer commentRank) {
		this.commentRank = commentRank;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

}