package bean;

/**
 * AbstractShowComment entity provides the base persistence definition of the
 * ShowComment entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractShowComment implements java.io.Serializable {

	// Fields

	private ShowCommentId id;

	// Constructors

	/** default constructor */
	public AbstractShowComment() {
	}

	/** full constructor */
	public AbstractShowComment(ShowCommentId id) {
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