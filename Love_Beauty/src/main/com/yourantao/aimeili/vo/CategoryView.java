package main.com.yourantao.aimeili.vo;

/**
 * 分类展现页
 * 
 * @author mac
 * 创建时间： 2012-3-7 下午02:36:02
 * 修改时间：2012-3-7 下午02:36:02
 * 具体描述： TODO
 */
public class CategoryView {

	private Integer categoryId;
	private String categoryName;
	private String categoryImageName;
	private String categoryDescription;
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryImageName() {
		return categoryImageName;
	}
	public void setCategoryImageName(String categoryImageName) {
		this.categoryImageName = categoryImageName;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	
	
}
