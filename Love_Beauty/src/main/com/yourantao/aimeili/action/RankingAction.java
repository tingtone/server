package main.com.yourantao.aimeili.action;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import main.com.yourantao.aimeili.bean.Goods;
import main.com.yourantao.aimeili.bean.GoodsDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.Ranking;
import main.com.yourantao.aimeili.bean.RankingDAO;
import main.com.yourantao.aimeili.bean.RankingGoods;
import main.com.yourantao.aimeili.bean.RankingGoodsDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.vo.RankingView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class RankingAction extends BaseAction implements Constant, RankingInterface {
	private static final Logger log = LoggerFactory
			.getLogger(RankingAction.class);
	private RankingDAO rankingDAO;
	private ImageDAO imageDAO;
	private RankingGoodsDAO rankingGoodsDAO;
	private GoodsDAO goodsDAO;
	private File ranking_image; // 上传文件1
	private String imageContentType;// 上传文件类型1
	private String imageFileName; // 上传文件名1

	private File newRanking_image; // 上传文件2
	private String newImageContentType;// 上传文件类型2
	private String newImageFileName; // 上传文件名2

	
	public GoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(GoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	public RankingGoodsDAO getRankingGoodsDAO() {
		return rankingGoodsDAO;
	}

	public void setRankingGoodsDAO(RankingGoodsDAO rankingGoodsDAO) {
		this.rankingGoodsDAO = rankingGoodsDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getImageDAO()
	 */
	public ImageDAO getImageDAO() {
		return imageDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#setImageDAO(main.com.yourantao.aimeili.bean.ImageDAO)
	 */
	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getRankingDAO()
	 */
	public RankingDAO getRankingDAO() {
		return rankingDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#setRankingDAO(main.com.yourantao.aimeili.bean.RankingDAO)
	 */
	public void setRankingDAO(RankingDAO rankingDAO) {
		this.rankingDAO = rankingDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getRanking_image()
	 */
	public File getRanking_image() {
		return ranking_image;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#setRanking_image(java.io.File)
	 */
	public void setRanking_image(File rankingImage) {
		ranking_image = rankingImage;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getRanking_imageContentType()
	 */
	public String getRanking_imageContentType() {
		return imageContentType;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#setRanking_imageContentType(java.lang.String)
	 */
	public void setRanking_imageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getRanking_imageFileName()
	 */
	public String getRanking_imageFileName() {
		return imageFileName;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#setRanking_imageFileName(java.lang.String)
	 */
	public void setRanking_imageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getNewRanking_image()
	 */
	public File getNewRanking_image() {
		return newRanking_image;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#setNewRanking_image(java.io.File)
	 */
	public void setNewRanking_image(File newRankingImage) {
		newRanking_image = newRankingImage;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getNewRanking_imageContentType()
	 */
	public String getNewRanking_imageContentType() {
		return newImageContentType;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#setNewRanking_imageContentType(java.lang.String)
	 */
	public void setNewRanking_imageContentType(String newImageContentType) {
		this.newImageContentType = newImageContentType;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getNewRanking_imageFileName()
	 */
	public String getNewRanking_imageFileName() {
		return newImageFileName;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#setNewRanking_imageFileName(java.lang.String)
	 */
	public void setNewRanking_imageFileName(String newImageFileName) {
		this.newImageFileName = newImageFileName;
	}

	/*
	 * for Client and Editor (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getRanking()
	 */
	@Override
	public String getRanking() {
		List<RankingView> rankingViews = new ArrayList<RankingView>();
		List<Ranking> rankings = rankingDAO.findAll();
		for (Ranking ranking : rankings) {
			RankingView rankingView = new RankingView();
			rankingView.setRankingId(ranking.getRankingId());
			rankingView.setRankingName(ranking.getRankingName());
			if (ranking.getRankingImageId() != 0) // 图片非空
			{
				Image image = imageDAO.findById(ranking.getRankingImageId());
				rankingView.setRankingImageUrl(Config.get(Config.BASE_IMAGEURL)
						+ image.getImgUrl());
			}
			rankingViews.add(rankingView);
		}
		printArray(rankingViews);
		return null;
	}

	/*
	 * for Editor (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#updateORinsertRanking()
	 */
	@Override
	public String updateRanking() {
		Integer ranking_id = getIntegerParameter(RANKING_ID);
		String updateType = getReqeust().getParameter("submit");
		if (updateType.equals("添加")) { // 添加新分类
			Ranking ranking = new Ranking();
			ranking.setRankingName(getReqeust().getParameter("newRanking_name"));
			ranking.setRankingRank((long) 0); // 分类的排序待定！！
			if (newImageFileName != null && !newImageFileName.equals("")) { // 上传图片，并存储
				String FileName = MD5.md5(newImageFileName)
						+ getExtention(newImageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(newRanking_image, FileName);
				ranking.setRankingImageId(imageid);
				copy(newRanking_image, imageFile);
			}
			rankingDAO.save(ranking);
			return SUCCESS;
		} else if (updateType.equals("更新")) { // 需要对每个进行更新
			Ranking ranking = rankingDAO.findById(ranking_id);
			if (imageFileName != null && !imageFileName.equals("")) { // 上传大图，并存储
				// String FileName =imageFileName+ new Date().getTime() +
				// getExtention(imageFileName);
				String FileName = MD5.md5(imageFileName)
						+ getExtention(imageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(ranking_image, FileName);
				ranking.setRankingImageId(imageid);
				copy(ranking_image, imageFile);
			}
			ranking.setRankingName(getReqeust().getParameter("ranking_name"));
			return SUCCESS;
		}else if(updateType.equals("对应商品"))
		{
			return "ranking_goods";
		}else if (updateType.equals("置顶")) {
			topRanking(getIntegerParameter(RANKING_ID));
			return "ranking";
		} else if (updateType.equals("后移")) {
			exchangeRanking(getIntegerParameter(RANKING_ID),
					getIntegerParameter("rid_exchange"));
			return "ranking";
		}else if (updateType.equals("删除")) { // 删除
			rankingDAO.delete(rankingDAO.findById(ranking_id));
			return "ranking";
		}
		return ERROR;
	}
	/*
	 * 交换排行榜
	 */
	public String exchangeRanking(int rankingId1, int rankingId2) {

		Ranking ranking1 = rankingDAO.findById(rankingId1);
		Ranking ranking2 = rankingDAO.findById(rankingId2);
		Long rank = ranking1.getRankingRank();
		ranking1.setRankingRank(ranking2.getRankingRank());
		ranking2.setRankingRank(rank);

		return null;
	}

	/*
	 * 置顶排行榜
	 */
	public void topRanking(int rankingId) {

		Ranking ranking = rankingDAO.findById(rankingId);
		ranking.setRankingRank(rankGenerator.generateRank());

	}
	
	/*
	 * 交换排行榜商品
	 */
	public String exchangeRankingGoods(int goodsId1, int goodsId2) {

		RankingGoods rankingGoods1 = rankingGoodsDAO.findById(goodsId1);
		RankingGoods rankingGoods2 = rankingGoodsDAO.findById(goodsId2);
		Long rank = rankingGoods1.getGoodsRank();
		rankingGoods1.setGoodsRank(rankingGoods2.getGoodsRank());
		rankingGoods2.setGoodsRank(rank);

		return null;
	}

	/*
	 * 置顶排行榜商品
	 */
	public void topRankingGoods(int goodsId) {
		RankingGoods rankingGoods = rankingGoodsDAO.findById(goodsId);
		rankingGoods.setGoodsRank(rankGenerator.generateRank());
	}

	/*
	 * for Editor (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getRankingDetail()
	 */
	@Override
	public String getRankingDetail() {
		int eid = getIntegerParameter(RANKING_ID);
		Ranking ranking = rankingDAO.findById(eid);
		RankingView rankingView = new RankingView();
		rankingView.setRankingId(ranking.getRankingId());
		rankingView.setRankingName(ranking.getRankingName());
		if (ranking.getRankingImageId() != 0) // 图片非空
		{
			Image image = imageDAO.findById(ranking.getRankingImageId());
			rankingView.setRankingImageUrl(Config.get(Config.BASE_IMAGEURL)
					+ image.getImgUrl());
		}

		printObject(rankingView);
		return null;
	}

	/*
	 * for Editor and Client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#getRankingGoods()
	 */
	@Override
	public String getRankingGoods() {
		String msg="";
		Integer rankingId = getIntegerParameter(RANKING_ID);
		if (rankingId == null){
			msg="{'msg':'没有排行榜ID'}";
			outputString(msg);
			return null;
		}
		List goods = rankingGoodsDAO.findByRankingId(rankingId);
		if(goods.size()==0){
			msg="{'msg':'暂无排行商品'}";
			outputString(msg);
			return null;
		}
		printArray(goods);
		return null;
	}

	/*
	 * for Editor
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#updateRankingGoods()
	 */
	@Override
	public String updateRankingGoods() {
		Integer id = getIntegerParameter("id");
		String updateType = getReqeust().getParameter("submit");
		if(updateType.equals("后移")){
			exchangeRankingGoods(getIntegerParameter("id"), getIntegerParameter("id_exchange"));
			return "ranking_goods";
		}else if(updateType.equals("删除")){
			rankingGoodsDAO.delete(rankingGoodsDAO.findById(id));
			return "ranking_goods";
		}else if(updateType.equals("置顶")){
			topRankingGoods(getIntegerParameter("id"));
			return "ranking_goods";
		}
		return ERROR;
	}

	/*
	 * for Editor
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#insertRanking()
	 */
	@Override
	public String insertRanking() {
		String msg="";
		Ranking ranking = new Ranking();
		String ranking_name=getReqeust().getParameter("ranking_name");
		if(ranking_name==null || ranking_name.equals("null") ||ranking_name.equals("")){
			msg="{'msg':'没有排行榜名'}";
			outputString(msg);
			return null;
		}
		List<Ranking> rankings=rankingDAO.findByRankingName(ranking_name);
		if(rankings.size()!=0){
			msg="{'msg':'重复的排行榜名'}";
			outputString(msg);
			return null;
		}
		ranking.setRankingName(ranking_name);
		ranking.setRankingRank(rankGenerator.generateRank());
		if (newImageFileName != null && !newImageFileName.equals("")) { // 上传图，并存储
			// String FileName =imageFileName+ new Date().getTime() +
			// getExtention(imageFileName);
			String FileName = MD5.md5(newImageFileName)
					+ getExtention(newImageFileName);
			File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE) + FileName);
			int imageid = getImgAttribute(newRanking_image, FileName);
			ranking.setRankingImageId(imageid);
			copy(newRanking_image, imageFile);
		}else{
			ranking.setRankingImageId(0);
		}
		rankingDAO.save(ranking);
		return SUCCESS;
	}

	/*
	 * for Editor
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.RankingInterface#insertRankingGoods()
	 */
	@Override
	public String insertRankingGoods() {
		String msg="";
		Integer rankingId=getIntegerParameter(RANKING_ID);
		if (rankingId == null){
			msg="{'msg':'没有排行榜ID'}";
			outputString(msg);
			return null;
		}
		Integer gid=getIntegerParameter(GOODS_ID);
		if (gid == null){
			msg="{'msg':'没有商品ID'}";
			outputString(msg);
			return null;
		}
		Goods goods=goodsDAO.findById(gid);
		if(goods==null){
			msg="{'msg':'该商品ID没有录入'}";
			outputString(msg);
			return null;
		}
		RankingGoods rankingGoods=new RankingGoods();
		rankingGoods.setAddTime(Timestamp.valueOf(dateFormat.format(new Date())));
		rankingGoods.setGoodsRank(rankGenerator.generateRank());
		rankingGoods.setRankingId(rankingId);
		rankingGoods.setGoods(goods);
		
		rankingGoodsDAO.save(rankingGoods);
		
		return SUCCESS;
	}
}
