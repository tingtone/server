package bean;

/**
 * Keyword entity. @author MyEclipse Persistence Tools
 */
public class Keyword extends AbstractKeyword implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Keyword() {
	}

	/** full constructor */
	public Keyword(String keyword, Integer keywordCount, Integer keywordRank) {
		super(keyword, keywordCount, keywordRank);
	}

}
