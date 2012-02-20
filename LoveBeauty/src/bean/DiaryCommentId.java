package bean;

import java.sql.Timestamp;

/**
 * DiaryCommentId entity. @author MyEclipse Persistence Tools
 */
public class DiaryCommentId extends AbstractDiaryCommentId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public DiaryCommentId() {
	}

	/** full constructor */
	public DiaryCommentId(Integer diaryId, Integer userId, Short contentType,
			String commentContent, Timestamp addTime) {
		super(diaryId, userId, contentType, commentContent, addTime);
	}

}
