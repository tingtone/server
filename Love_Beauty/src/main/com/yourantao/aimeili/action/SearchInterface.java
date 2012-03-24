package main.com.yourantao.aimeili.action;

import java.io.File;

import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.SearchDAO;

public interface SearchInterface {

	public abstract ImageDAO getImageDAO();

	public abstract void setImageDAO(ImageDAO imageDAO);

	public abstract SearchDAO getSearchDAO();

	public abstract void setSearchDAO(SearchDAO searchDAO);

	public abstract File getSearch_image();

	public abstract void setSearch_image(File searchImage);

	public abstract String getSearch_imageContentType();

	public abstract void setSearch_imageContentType(String imageContentType);

	public abstract String getSearch_imageFileName();

	public abstract void setSearch_imageFileName(String imageFileName);

	public abstract File getNewSearch_image();

	public abstract void setNewSearch_image(File newSearchImage);

	public abstract String getNewSearch_imageContentType();

	public abstract void setNewSearch_imageContentType(
			String newImageContentType);

	public abstract String getNewSearch_imageFileName();

	public abstract void setNewSearch_imageFileName(String newImageFileName);

	/**
	 * 获得搜索列表
	 * @return
	 */
	public abstract String getSearch();

	/**
	 * 更新或者增加搜索
	 * @return
	 */
	public abstract String updateORinsertSearch();

	/**
	 * 获得搜索细节页
	 * @return
	 */
	public abstract String getSearchDetail();

}