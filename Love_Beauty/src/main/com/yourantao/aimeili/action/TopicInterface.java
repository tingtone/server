package main.com.yourantao.aimeili.action;

public interface TopicInterface {

	/**
	 * 通过大分类ID号获得专题详细信息
	 */
	public String getTopicsOfCategory();

	/**
	 * 获得某个专题下的所有商品
	 */
	public String getTopicGoods();

	/**
	 * 交换给定的两个专题的位置
	 * 
	 * @return
	 */
	public abstract String exchange();

	/**
	 * 将某个专题置顶
	 */
	public abstract String top();

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

}