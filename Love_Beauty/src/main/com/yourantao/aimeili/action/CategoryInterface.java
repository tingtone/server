package main.com.yourantao.aimeili.action;

public interface CategoryInterface {
	/**
	 * 通过分类下子分类
	 */
	public String getSubCategories();
	
	/**
	 * 插入分类信息
	 * @return
	 */
	public String insertCategory();
	
	/**
	 * 更新分类信息
	 * @return
	 */
	public String updateCateroty();
}
