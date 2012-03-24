package main.com.yourantao.aimeili.vo;

/**
 * 搜索关键词展示类
 * 
 * @author mac
 * 创建时间： 2012-3-14 下午01:52:50
 * 修改时间：2012-3-14 下午01:52:50
 * 具体描述： TODO
 */
public class SearchView {
	private Integer searchId;
	private String searchKeyword;
	private String searchImageUrl;
	public Integer getSearchId() {
		return searchId;
	}
	public void setSearchId(Integer searchId) {
		this.searchId = searchId;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchImageUrl() {
		return searchImageUrl;
	}
	public void setSearchImageUrl(String searchImageUrl) {
		this.searchImageUrl = searchImageUrl;
	}
	
}
