package bean;

import java.sql.Timestamp;

/**
 * Diary entity. @author MyEclipse Persistence Tools
 */
public class Diary extends AbstractDiary implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Diary() {
	}

	/** full constructor */
	public Diary(Integer userId, Short diaryPrivacy, String diaryTags,
			String diaryImages, String diaryTitle, Short contentType,
			String diaryContent, Integer diaryRank, Timestamp addTime) {
		super(userId, diaryPrivacy, diaryTags, diaryImages, diaryTitle,
				contentType, diaryContent, diaryRank, addTime);
	}

}
