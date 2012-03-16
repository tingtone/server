package main.com.yourantao.aimeili.action;

import java.io.File;

import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.RankingDAO;

public interface RankingInterface {

	public abstract ImageDAO getImageDAO();

	public abstract void setImageDAO(ImageDAO imageDAO);

	public abstract RankingDAO getRankingDAO();

	public abstract void setRankingDAO(RankingDAO rankingDAO);

	public abstract File getRanking_image();

	public abstract void setRanking_image(File rankingImage);

	public abstract String getRanking_imageContentType();

	public abstract void setRanking_imageContentType(String imageContentType);

	public abstract String getRanking_imageFileName();

	public abstract void setRanking_imageFileName(String imageFileName);

	public abstract File getNewRanking_image();

	public abstract void setNewRanking_image(File newRankingImage);

	public abstract String getNewRanking_imageContentType();

	public abstract void setNewRanking_imageContentType(
			String newImageContentType);

	public abstract String getNewRanking_imageFileName();

	public abstract void setNewRanking_imageFileName(String newImageFileName);

	/**
	 * 获得所有排行榜列表
	 * @return
	 */
	public abstract String getRanking();

	/**
	 * 更新排行榜
	 * @return
	 */
	public abstract String updateRanking();
	
	/**
	 * 插入排行榜
	 * @return
	 */
	public abstract String insertRanking();

	/**
	 * 获得排行榜细节信息
	 * @return
	 */
	public abstract String getRankingDetail();
	/**
	 * 获得排行榜商品
	 * @return
	 */
	public abstract String getRankingGoods();
	
	/**
	 * 更新排行榜商品
	 * @return
	 */
	public abstract String updateRankingGoods();
	
	/**
	 * 增加排行榜商品
	 * @return
	 */
	public abstract String insertRankingGoods();

}