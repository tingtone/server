package main.com.yourantao.aimeili.action;

import java.io.File;

public interface BrandInterface {

	/**
	 * 获得品牌list
	 */
	public String getBrands();
	
	/**
	 * 获得系列list
	 */
	public String getSeries();
	
	/**
	 * 更新或增加品牌
	 * @return
	 */
	public String updateORinsertBrand();
	
	/**
	 * 获得品牌详情
	 * @return
	 */
	public String getBrandDetail();
	
	public void setBrand_image(File brandImage);


	public void setBrand_imageContentType(String imageContentType);


	public void setBrand_imageFileName(String imageFileName);


	public void setNewBrand_image(File newbrandImage);


	public void setNewBrand_imageContentType(String newImageContentType);


	public void setNewBrand_imageFileName(String newImageFileName);
}
