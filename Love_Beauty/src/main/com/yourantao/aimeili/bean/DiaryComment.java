package main.com.yourantao.aimeili.bean;

/**
 * DiaryComment entity. @author MyEclipse Persistence Tools
 */

public class DiaryComment implements java.io.Serializable {

	// Fields

	private DiaryCommentId id;

	// Constructors

	/** default constructor */
	public DiaryComment() {
	}

	/** full constructor */
	public DiaryComment(DiaryCommentId id) {
		this.id = id;
	}

	// Property accessors

	public DiaryCommentId getId() {
		return this.id;
	}

	public void setId(DiaryCommentId id) {
		this.id = id;
	}

}