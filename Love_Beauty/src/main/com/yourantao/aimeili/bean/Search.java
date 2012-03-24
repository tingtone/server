package main.com.yourantao.aimeili.bean;

/**
 * Search entity. @author MyEclipse Persistence Tools
 */

public class Search implements java.io.Serializable {

	// Fields

	private Integer searchId;
	private String searchKeyword;
	private Integer searchImageId;
	private Long searchRank;

	// Constructors

	/** default constructor */
	public Search() {
	}

	/** full constructor */
	public Search(String searchKeyword, Integer searchImageId, Long searchRank) {
		this.searchKeyword = searchKeyword;
		this.searchImageId = searchImageId;
		this.searchRank = searchRank;
	}

	// Property accessors

	public Integer getSearchId() {
		return this.searchId;
	}

	public void setSearchId(Integer searchId) {
		this.searchId = searchId;
	}

	public String getSearchKeyword() {
		return this.searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public Integer getSearchImageId() {
		return this.searchImageId;
	}

	public void setSearchImageId(Integer searchImageId) {
		this.searchImageId = searchImageId;
	}

	public Long getSearchRank() {
		return this.searchRank;
	}

	public void setSearchRank(Long searchRank) {
		this.searchRank = searchRank;
	}

}