package main.com.yourantao.aimeili.action;

import java.io.File;

public interface GoodsInterface {
	
	/**
	 * 更新商品详情
	 */
	public String updateGoods();
	
	/**
	 * 我的护肤品中获得适合，不适合和需要注意的商品列表
	 */
	public String getGoodsListBySkin();
	
	/**
	 * 根据分类获得适合，不适合和需要注意的商品列表
	 * @return
	 */
	public String getGoodsListBySkinAndCat();
	/**
	 * 获得真实商品的评论
	 */
	public String getRealGoodsComment();
	/**
	 * 通过分类获得商品列表
	 * 
	 * @return
	 */
	public String getGoodsListByCat();
	
	/**
	 * 通过功效获得商品列表
	 * 
	 * @return
	 */
	public String getGoodsListByEfficacy();
	
	/**
	 * 通过品牌获得商品列表
	 * 
	 * @return
	 */
	public String getGoodsListByBrand();
	
	/**
	 * 获得收藏商品列表
	 * @return
	 */
	public String getGoodsListByFav();
	
	/**
	 * 根据搜索词获得商品列表
	 * @return
	 * 简单算法: 1.高频词为，品牌名OR分类名OR功效明
	 * 			2.遇到 ,.+-`~!\/;:。，、！等字符则做分词处理
	 *  		3.分词后的逻辑为，若有多个词都为品牌名  分类名  或者 功效名，则是或的关系处理；若一个词是品牌名，但另一个词是分类名或者功效名，则是且的关系
	 *  		4.当搜索词不是高频词时，则按标题中的内容进行比对
	 *  		5.全无则返回没有搜索到商品
	 */
	public String getGoodsListBySearch();
	
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
	
	/**
	 * 获得商品的新的评测
	 */
	public String getGoodsExperience();
	
	
	
	
	
	public void setNewGoods_thumbContentType(String thumbContentType);

	public void setNewGoods_thumbFileName(String thumbFileName);

	public void setNewGoods_thumb(File newtopic_thumb);

	public void setNewGoods_imageContentType(String imageContentType);

	public void setNewGoods_imageFileName(String imageFileName);

	public void setNewGoods_image(File newtopic_image);
}
