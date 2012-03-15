package main.com.yourantao.aimeili.action;

import java.io.File;

public interface EfficacyInterface {

	/**
	 * 获得功效列表
	 * @return
	 */
	public String getEfficacy();
	
	/**
	 * 更新或新增功效
	 * @return
	 */
	public String updateORinsertEfficacy();
	
	/**
	 * 获得功效详情
	 * @return
	 */
	public String getEfficacyDetail();
	
	
	public void setEfficacy_image(File efficacyImage);


	public void setEfficacy_imageContentType(String imageContentType);


	public void setEfficacy_imageFileName(String imageFileName);


	public void setNewEfficacy_image(File newefficacyImage);


	public void setNewEfficacy_imageContentType(String newImageContentType);


	public void setNewEfficacy_imageFileName(String newImageFileName);
}
