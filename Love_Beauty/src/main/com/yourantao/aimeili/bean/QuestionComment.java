package main.com.yourantao.aimeili.bean;

/**
 * QuestionComment entity. @author MyEclipse Persistence Tools
 */

public class QuestionComment implements java.io.Serializable {

	// Fields

	private QuestionCommentId id;

	// Constructors

	/** default constructor */
	public QuestionComment() {
	}

	/** full constructor */
	public QuestionComment(QuestionCommentId id) {
		this.id = id;
	}

	// Property accessors

	public QuestionCommentId getId() {
		return this.id;
	}

	public void setId(QuestionCommentId id) {
		this.id = id;
	}

}