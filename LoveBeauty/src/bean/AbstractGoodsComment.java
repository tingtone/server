package bean;

import java.sql.Timestamp;

/**
 * AbstractGoodsComment entity provides the base persistence definition of the
 * GoodsComment entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractGoodsComment implements java.io.Serializable {

	// Fields

	private Integer commentId;
	private Integer goodsId;
	private String commentator;
	private String commentContent;
	private Short commentLevel;
	private Integer commentRank;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public AbstractGoodsComment() {
	}

	/** full constructor */
	public AbstractGoodsComment(Integer goodsId, String commentator,
			String commentContent, Short commentLevel, Integer commentRank,
			Timestamp addTime) {
		this.goodsId = goodsId;
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

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
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