package main.com.yourantao.aimeili.action;

import java.io.File;

public interface GoodsInterface {
	
	/**
	 * 更新商品详情
	 */
	public String updateGoods();
	
	/**
	 * 获得商品列表
	 * @return
	 */
	public String getGoodsList();
	
	/**
	 * 添加商品
	 * @return
	 */
	public String insertGoods();
	
	/**
	 * 获得商品详情图
	 * @return
	 */
	public String getGoodsImages();
	
	/**
	 * 更新商品详情图
	 * @return
	 */
	public String updateGoodsImages();
	
	/**
	 * 获得商品对应关系的真实商品
	 * @return
	 */
	public String getGoodsMapList();
	
	/**
	 * 通过品牌或者系列获得真实商品
	 * @return
	 */
	public String GetRealGoodsListBySeries();
	
	public void setNewGoods_thumbContentType(String thumbContentType);

	public void setNewGoods_thumbFileName(String thumbFileName);

	public void setNewGoods_thumb(File newtopic_thumb);

	public void setNewGoods_imageContentType(String imageContentType);

	public void setNewGoods_imageFileName(String imageFileName);

	public void setNewGoods_image(File newtopic_image);
}
