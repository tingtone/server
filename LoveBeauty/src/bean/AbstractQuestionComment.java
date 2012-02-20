package bean;

/**
 * AbstractQuestionComment entity provides the base persistence definition of
 * the QuestionComment entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractQuestionComment implements java.io.Serializable {

	// Fields

	private QuestionCommentId id;

	// Constructors

	/** default constructor */
	public AbstractQuestionComment() {
	}

	/** full constructor */
	public AbstractQuestionComment(QuestionCommentId id) {
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