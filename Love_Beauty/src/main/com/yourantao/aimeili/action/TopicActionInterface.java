package main.com.yourantao.aimeili.action;

import java.io.File;

import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.TopicDAO;

public interface TopicActionInterface {

	/**
	 * 通过大分类ID号获得专题详细信息
	 */
	public abstract String getTopicsOfCategory();

	/**
	 * 通过tid获得相应商品信息
	 * 
	 * @return
	 */
	public abstract String getTopicGoods();

	/**
	 * 更新专题信息，包括更新具体信息，更新图片，更新位置，和删除 通过action访问
	 * 
	 * @return
	 */
	public abstract String updateTopic();

	/**
	 * 新增专题 通过action访问
	 * 
	 * @return
	 */
	public abstract String insertTopic();

	public abstract void setTopicDAO(TopicDAO topicDAO);

	public abstract TopicDAO getTopicDAO();

	public abstract void setImageDAO(ImageDAO imageDAO);

	public abstract ImageDAO getImageDAO();

	public abstract void setNewtopic_thumbContentType(String thumbContentType);

	public abstract void setNewtopic_thumbFileName(String thumbFileName);

	public abstract void setNewtopic_thumb(File newtopic_thumb);

	public abstract void setNewtopic_imageContentType(String imageContentType);

	public abstract void setNewtopic_imageFileName(String imageFileName);

	public abstract void setNewtopic_image(File newtopic_image);

	public abstract String getImageFileName();

}