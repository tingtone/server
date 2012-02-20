package bean;

/**
 * AbstractKeyword entity provides the base persistence definition of the
 * Keyword entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractKeyword implements java.io.Serializable {

	// Fields

	private Integer keywordId;
	private String keyword;
	private Integer keywordCount;
	private Integer keywordRank;

	// Constructors

	/** default constructor */
	public AbstractKeyword() {
	}

	/** full constructor */
	public AbstractKeyword(String keyword, Integer keywordCount,
			Integer keywordRank) {
		this.keyword = keyword;
		this.keywordCount = keywordCount;
		this.keywordRank = keywordRank;
	}

	// Property accessors

	public Integer getKeywordId() {
		return this.keywordId;
	}

	public void setKeywordId(Integer keywordId) {
		this.keywordId = keywordId;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getKeywordCount() {
		return this.keywordCount;
	}

	public void setKeywordCount(Integer keywordCount) {
		this.keywordCount = keywordCount;
	}

	public Integer getKeywordRank() {
		return this.keywordRank;
	}

	public void setKeywordRank(Integer keywordRank) {
		this.keywordRank = keywordRank;
	}

}