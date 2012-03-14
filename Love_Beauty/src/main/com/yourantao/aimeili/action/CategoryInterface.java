package main.com.yourantao.aimeili.action;

import java.io.File;

public interface CategoryInterface {
	/**
	 * 通过分类下子分类
	 */
	public String getSubCategories();
	
	
	/**
	 * 更新或插入分类信息
	 * @return
	 */
	public String updateORinsertCategory();
	
	/**
	 * 获得分类的详情信息
	 * @return
	 */
	public String getCategoryDetail();
	
	

	public void setCategory_image(File categoryImage);


	public void setCategory_imageContentType(String imageContentType);


	public void setCategory_imageFileName(String imageFileName);


	public void setNewCategory_image(File newCategoryImage);


	public void setNewCategory_imageContentType(String newImageContentType);


	public void setNewCategory_imageFileName(String newImageFileName);

}
