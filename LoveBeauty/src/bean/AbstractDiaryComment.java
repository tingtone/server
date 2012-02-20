package bean;

/**
 * AbstractDiaryComment entity provides the base persistence definition of the
 * DiaryComment entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDiaryComment implements java.io.Serializable {

	// Fields

	private DiaryCommentId id;

	// Constructors

	/** default constructor */
	public AbstractDiaryComment() {
	}

	/** full constructor */
	public AbstractDiaryComment(DiaryCommentId id) {
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