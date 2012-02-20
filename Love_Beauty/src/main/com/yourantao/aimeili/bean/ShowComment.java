package main.com.yourantao.aimeili.bean;

/**
 * ShowComment entity. @author MyEclipse Persistence Tools
 */

public class ShowComment implements java.io.Serializable {

	// Fields

	private ShowCommentId id;

	// Constructors

	/** default constructor */
	public ShowComment() {
	}

	/** full constructor */
	public ShowComment(ShowCommentId id) {
		this.id = id;
	}

	// Property accessors

	public ShowCommentId getId() {
		return this.id;
	}

	public void setId(ShowCommentId id) {
		this.id = id;
	}

}