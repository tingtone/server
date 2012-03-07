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
	
	public void setNewtopic_thumbContentType(String thumbContentType);

	public void setNewtopic_thumbFileName(String thumbFileName);

	public void setNewtopic_thumb(File newtopic_thumb);

	public void setNewtopic_imageContentType(String imageContentType);

	public void setNewtopic_imageFileName(String imageFileName);

	public void setNewtopic_image(File newtopic_image);
}
