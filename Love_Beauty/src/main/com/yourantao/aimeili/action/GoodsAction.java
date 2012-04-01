package main.com.yourantao.aimeili.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.bean.Category;
import main.com.yourantao.aimeili.bean.CategoryDAO;
import main.com.yourantao.aimeili.bean.Efficacy;
import main.com.yourantao.aimeili.bean.EfficacyDAO;
import main.com.yourantao.aimeili.bean.Goods;
import main.com.yourantao.aimeili.bean.GoodsComment;
import main.com.yourantao.aimeili.bean.GoodsCommentDAO;
import main.com.yourantao.aimeili.bean.GoodsDAO;
import main.com.yourantao.aimeili.bean.GoodsEfficacy;
import main.com.yourantao.aimeili.bean.GoodsEfficacyDAO;
import main.com.yourantao.aimeili.bean.GoodsExperience;
import main.com.yourantao.aimeili.bean.GoodsExperienceDAO;
import main.com.yourantao.aimeili.bean.GoodsImages;
import main.com.yourantao.aimeili.bean.GoodsImagesDAO;
import main.com.yourantao.aimeili.bean.GoodsMap;
import main.com.yourantao.aimeili.bean.GoodsMapDAO;
import main.com.yourantao.aimeili.bean.GoodsReal;
import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.Provider;
import main.com.yourantao.aimeili.bean.ProviderDAO;
import main.com.yourantao.aimeili.bean.RankingGoods;
import main.com.yourantao.aimeili.bean.RankingGoodsDAO;
import main.com.yourantao.aimeili.bean.Series;
import main.com.yourantao.aimeili.bean.SeriesDAO;
import main.com.yourantao.aimeili.bean.UserDAO;
import main.com.yourantao.aimeili.bean.UserFavorite;
import main.com.yourantao.aimeili.bean.UserFavoriteDAO;
import main.com.yourantao.aimeili.bean.UserLogin;
import main.com.yourantao.aimeili.bean.UserLoginDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.log.GetGoodsListLog;
import main.com.yourantao.aimeili.util.CompareTool;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.util.PHPSerializer;
import main.com.yourantao.aimeili.util.RankGenerator;
import main.com.yourantao.aimeili.util.TransTool;
import main.com.yourantao.aimeili.vo.GoodsImageView;
import main.com.yourantao.aimeili.vo.GoodsRealComparePriceView;
import main.com.yourantao.aimeili.vo.GoodsSkinView;
import main.com.yourantao.aimeili.vo.GoodsView;
import main.com.yourantao.aimeili.vo.GoodsViewWithRanking;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class GoodsAction extends BaseAction implements GoodsInterface, Constant {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsAction.class);
	private static Log getGoodsListLogger = LogFactory.getLog("GetGoodsList"); /*获得商品列表记录*/

	private short GOODS_EDITORCONFIRM_CORRECT=6;
	private short GOODS_NOCONFIRM=3;
	private short GOODS_EDITORCONFIRM_DELETE=4;
	
	private File newGoods_thumb; // 上传文件1
	private File newGoods_image; // 上传文件1
	private String imageContentType;// 上传文件类型2
	private String imageFileName; // 上传文件名2
	private String thumbContentType;// 上传文件类型1
	private String thumbFileName; // 上传文件名1

	private GoodsDAO goodsDAO;
	private CategoryDAO categoryDAO;
	private BrandDAO brandDAO;
	private SeriesDAO seriesDAO;
	private GoodsImagesDAO goodsImagesDAO;
	private GoodsMapDAO goodsMapDAO;
	private GoodsRealDAO goodsRealDAO;
	private UserDAO userDAO;
	private UserFavoriteDAO userFavoriteDAO;
	private GoodsCommentDAO goodsCommentDAO;
	private EfficacyDAO efficacyDAO;
	private GoodsEfficacyDAO goodsEfficacyDAO;
	private GoodsExperienceDAO goodsExperienceDAO;
	private RankingGoodsDAO rankingGoodsDAO;
	private ImageDAO imageDAO;
	private ProviderDAO providerDAO;

	// struts

	public void setNewGoods_thumbContentType(String thumbContentType) {
		System.out.println("thumbContentType : " + thumbContentType);
		this.thumbContentType = thumbContentType;
	}

	public void setNewGoods_thumbFileName(String thumbFileName) {
		System.out.println("thumbFileName : " + thumbFileName);
		this.thumbFileName = thumbFileName;
	}

	public void setNewGoods_thumb(File newtopic_thumb) {
		this.newGoods_thumb = newtopic_thumb;
	}

	public void setNewGoods_imageContentType(String imageContentType) {
		System.out.println("imageContentType : " + imageContentType);
		this.imageContentType = imageContentType;
	}

	public void setNewGoods_imageFileName(String imageFileName) {
		System.out.println("imageFileName : " + imageFileName);
		this.imageFileName = imageFileName;
	}

	public void setNewGoods_image(File newtopic_image) {
		this.newGoods_image = newtopic_image;
	}

	// spring

	public void setRankGenerator(RankGenerator rankGenerator) {
		this.rankGenerator = rankGenerator;
	}

	public ProviderDAO getProviderDAO() {
		return providerDAO;
	}

	public void setProviderDAO(ProviderDAO providerDAO) {
		this.providerDAO = providerDAO;
	}

	public RankingGoodsDAO getRankingGoodsDAO() {
		return rankingGoodsDAO;
	}

	public void setRankingGoodsDAO(RankingGoodsDAO rankingGoodsDAO) {
		this.rankingGoodsDAO = rankingGoodsDAO;
	}

	public GoodsExperienceDAO getGoodsExperienceDAO() {
		return goodsExperienceDAO;
	}

	public void setGoodsExperienceDAO(GoodsExperienceDAO goodsExperienceDAO) {
		this.goodsExperienceDAO = goodsExperienceDAO;
	}

	public GoodsEfficacyDAO getGoodsEfficacyDAO() {
		return goodsEfficacyDAO;
	}

	public void setGoodsEfficacyDAO(GoodsEfficacyDAO goodsEfficacyDAO) {
		this.goodsEfficacyDAO = goodsEfficacyDAO;
	}

	public EfficacyDAO getEfficacyDAO() {
		return efficacyDAO;
	}

	public void setEfficacyDAO(EfficacyDAO efficacyDAO) {
		this.efficacyDAO = efficacyDAO;
	}

	public GoodsCommentDAO getGoodsCommentDAO() {
		return goodsCommentDAO;
	}

	public void setGoodsCommentDAO(GoodsCommentDAO goodsCommentDAO) {
		this.goodsCommentDAO = goodsCommentDAO;
	}

	public UserLoginDAO getUserLoginDAO() {
		return userLoginDAO;
	}

	public void setUserLoginDAO(UserLoginDAO userLoginDAO) {
		this.userLoginDAO = userLoginDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public UserFavoriteDAO getUserFavoriteDAO() {
		return userFavoriteDAO;
	}

	public void setUserFavoriteDAO(UserFavoriteDAO userFavoriteDAO) {
		this.userFavoriteDAO = userFavoriteDAO;
	}

	public GoodsRealDAO getGoodsRealDAO() {
		return goodsRealDAO;
	}

	public void setGoodsRealDAO(GoodsRealDAO goodsRealDAO) {
		this.goodsRealDAO = goodsRealDAO;
	}

	public GoodsMapDAO getGoodsMapDAO() {
		return goodsMapDAO;
	}

	public void setGoodsMapDAO(GoodsMapDAO goodsMapDAO) {
		this.goodsMapDAO = goodsMapDAO;
	}

	public GoodsImagesDAO getGoodsImagesDAO() {
		return goodsImagesDAO;
	}

	public void setGoodsImagesDAO(GoodsImagesDAO goodsImagesDAO) {
		this.goodsImagesDAO = goodsImagesDAO;
	}

	public BrandDAO getBrandDAO() {
		return brandDAO;
	}

	public void setBrandDAO(BrandDAO brandDAO) {
		this.brandDAO = brandDAO;
	}

	public SeriesDAO getSeriesDAO() {
		return seriesDAO;
	}

	public void setSeriesDAO(SeriesDAO seriesDAO) {
		this.seriesDAO = seriesDAO;
	}

	public GoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(GoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public RankGenerator getRankGenerator() {
		return rankGenerator;
	}

	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	public ImageDAO getImageDAO() {
		return imageDAO;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListByFav()
	 */
	@Override
	public String getGoodsListByFav() {
		String msg = "";
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			msg = "{'msg':'没有设备号'}";
			printString(msg);
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		Integer uid = userLogin.get(0).getUserId();
		if (uid == null || uid == 0) {
			msg = "{'msg':'设备号未登记'}";
			printString(msg);
			return null;
		}
		List<UserFavorite> userfavlist = userFavoriteDAO.findByUserId(uid);
		if (userfavlist.size() == 0) { // 没有收藏
			msg = "{'msg':'没有收藏商品'}";
			printString(msg);
			return null;
		} else { // 有收藏，取得相应商品
			List<GoodsView> result = new ArrayList<GoodsView>();

			for (UserFavorite userFavorite : userfavlist) {
				Goods goods = goodsDAO.findById(userFavorite.getRelatedId());
				GoodsView goodsView = new GoodsView();
				goodsView.setGoodsId(goods.getGoodsId());
				goodsView.setGoodsAge(goods.getGoodsAge());
				goodsView.setGoodsDescription(goods.getGoodsDescription());
				goodsView.setGoodsForskin(goods.getGoodsForskin());
				goodsView.setGoodsName(goods.getGoodsName());
				goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
				goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
				goodsView.setGoodsScore(goods.getGoodsScore());
				goodsView.setGoodsSpecification(goods.getGoodsSpecification());
				goodsView.setGoodsStatus(goods.getGoodsStatus());
				Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
				if (thumb != null) {
					if (thumb.getImgType() == 1) {
						goodsView.setGoodsThumb(Config
								.get(Config.BASE_IMAGEURL)
								+ thumb.getImgUrl());
					} else {
						goodsView.setGoodsThumb(thumb.getImgUrl());
					}
				} else {
					goodsView.setGoodsThumb("");
				}
				if (goods.getBrandId() != null) {
					Brand brand = brandDAO.findById(goods.getBrandId());
					goodsView.setGoodsBrandName(brand.getBrandName());
				}
				if (goods.getSeriesId() != null) {
					if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
						goodsView.setGoodsSeriesName("无");
					} else {
						Series series = seriesDAO.findById(goods.getSeriesId());
						goodsView.setGoodsSeriesName(series.getSeriesName());
					}
				}
				List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
						.findByGoods(goods); // 功效标签
				String efficacyName = "";
				if (goodsEfficacyList.isEmpty()) {
				} else {
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
								.getEfficacyId());
						efficacyName += efficacy.getEfficacyName() + "  ";
					}
					goodsView.setGoodsEfficacy(efficacyName);
				}
				result.add(goodsView);
			}
			printArray(result);
			
			/*日志记录*/
			GetGoodsListLog getGoodsListLog = new GetGoodsListLog(uuid, getRequest());
			getGoodsListLog.setFrom(GetGoodsListLog.FAVORITE);
			getGoodsListLog.setFromMsg(uid+"");//收藏的fromId实际上是uid
			getGoodsListLogger.debug(getGoodsListLog);
			
			return null;
		}
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsList()
	 */
	@Override
	public String getGoodsListByCat() {
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null) {
			printString("{'msg':'没有分类号'}");
			return null;
		}
		List<Goods> goodsList = goodsDAO.findByCategoryId(categoryId);
		List<GoodsView> result = new ArrayList<GoodsView>();
		for (Goods goods : goodsList) {
			GoodsView goodsView = new GoodsView();
			goodsView.setGoodsId(goods.getGoodsId());
			goodsView.setGoodsAge(goods.getGoodsAge());
			goodsView.setGoodsDescription(goods.getGoodsDescription());
			goodsView.setGoodsForskin(goods.getGoodsForskin());
			goodsView.setGoodsName(goods.getGoodsName());
			goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
			goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
			goodsView.setGoodsScore(goods.getGoodsScore());
			goodsView.setGoodsSpecification(goods.getGoodsSpecification());
			goodsView.setGoodsStatus(goods.getGoodsStatus());
			Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
			if (thumb != null) {
				if (thumb.getImgType() == 1) {
					goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL)
							+ thumb.getImgUrl());
				} else {
					goodsView.setGoodsThumb(thumb.getImgUrl());
				}
			} else {
				goodsView.setGoodsThumb("");
			}
			if (goods.getBrandId() != null) {
				Brand brand = brandDAO.findById(goods.getBrandId());
				goodsView.setGoodsBrandName(brand.getBrandName());
			}
			if (goods.getSeriesId() != null) {
				if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				} else {
					Series series = seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
					.findByGoods(goods); // 功效标签
			String efficacyName = "";
			if (goodsEfficacyList.isEmpty()) {
			} else {
				for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
					Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
							.getEfficacyId());
					efficacyName += efficacy.getEfficacyName() + "  ";
				}
				goodsView.setGoodsEfficacy(efficacyName);
			}
			result.add(goodsView);
		}
		printArray(result);
		
		
		return null;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#updateGoods()
	 */
	@Override
	public String updateGoods() {
		/* 用spring新加的bean后，dao会自动持久化，不用在重新初始化 */
		// ApplicationContext ac = Config.getACInstant();
		// TopicGoodsDAO topicGoodsDAO = TopicGoodsDAO
		// .getFromApplicationContext(ac);
		// TopicDAO topicDAO = TopicDAO.getFromApplicationContext(ac);
		Integer goodsId = getIntegerParameter(GOODS_ID);
		Goods goods = goodsDAO.findById(goodsId);
		String goodsName = getRequest().getParameter("goodsName");
		String goodsScore = getRequest().getParameter("goodsScore");
		String goodsForskin = getRequest().getParameter("goodsForskin");
		String goodsNotforskin = getRequest().getParameter("goodsNotforskin");
		String goodsNoticeforskin = getRequest().getParameter(
				"goodsNoticeforskin");
		String goodsAge = getRequest().getParameter("goodsAge");
		String goodsDescription = getRequest().getParameter("goodsDescription");
		String goodsSpecification = getRequest().getParameter(
				"goodsSpecification");
		goods.setGoodsId(goodsId);
		String updateType = getRequest().getParameter("submit");
		if (updateType.equals("更新")) { // 需要对每个进行更新
			if (thumbFileName != null && !thumbFileName.equals("")) { // 上传缩略图，并存储
				String FileName = MD5.md5(thumbFileName)
						+ getExtention(thumbFileName);
				File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(newGoods_thumb, FileName, 1);
				goods.setGoodsThumbId(imageid);
				copy(newGoods_thumb, thumbFile);
			}
			goods.setGoodsName(goodsName);
			goods.setGoodsScore(Float.parseFloat(goodsScore));
			goods.setGoodsForskin(goodsForskin);
			goods.setGoodsNotforskin(goodsNotforskin);
			goods.setGoodsNoticeforskin(goodsNoticeforskin);
			goods.setGoodsAge(goodsAge);
			goods.setGoodsDescription(goodsDescription);
			goods.setGoodsLastUpdate(Timestamp.valueOf(dateTimeFormat
					.format(new Date()))); // 更新时间设置为当前更新时间
			goods.setGoodsSpecification(goodsSpecification);
			goods.setGoodsStatus((short) 6); // 6表示已经审核
			goodsDAO.merge(goods);
			return SUCCESS;
		} else if (updateType.equals("删除")) { // 删除
			goodsDAO.delete(goodsDAO.findById(goodsId));
			return "back_goods";
		} else if (updateType.equals("对应真实商品")) { // 查看对应商品
			return "real_goods";
		} else if (updateType.equals("商品细节图")) { // 商品细节图的增删改查
			return "goods_images";
		}
		return ERROR;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#insertGoods()
	 */
	@Override
	public String insertGoods() {
		Goods goods = new Goods();
		Integer categoryId = 0;
		for (int j = 4; j > 0; j--) {
			if (getRequest().getParameter("category" + j) != null
					&& !getRequest().getParameter("category" + j).equals("0")) {
				categoryId = getIntegerParameter("category" + j);
				break;
			}
		}
		goods.setBrandId(getIntegerParameter(BRAND_ID));
		goods.setSeriesId(getIntegerParameter(SERIES_ID));
		goods.setCategoryId(categoryId);
		goods.setGoodsAddTime(Timestamp.valueOf(dateTimeFormat
				.format(new Date())));
		goods.setGoodsAge(getRequest().getParameter("goodsAge"));
		goods.setGoodsBuyCount(0);
		goods.setGoodsViewCount(0);
		goods
				.setGoodsDescription(getRequest().getParameter(
						"goodsDescription"));
		goods.setGoodsForskin(getRequest().getParameter("goodsForskin"));
		goods.setGoodsLastUpdate(Timestamp.valueOf(dateTimeFormat
				.format(new Date())));
		goods.setGoodsName(getRequest().getParameter("goodsName"));
		goods.setGoodsNotforskin(getRequest().getParameter("goodsNotforskin"));
		goods.setGoodsNoticeforskin(getRequest().getParameter(
				"goodsNoticeforskin"));
		goods.setGoodsRank(0); // 暂时初始化为0，商品的排序规则较复杂，以后再做
		if (getRequest().getParameter("goodsScore") == null
				|| getRequest().getParameter("goodsScore").equals("")) {
			goods.setGoodsScore((float) 0);
		} else {
			goods.setGoodsScore(Float.valueOf(getRequest().getParameter(
					"goodsScore")));
		}

		goods.setGoodsSpecification(getRequest().getParameter(
				"goodsSpecification"));
		goods.setGoodsStatus((short) 3);

		if (thumbFileName != null && !thumbFileName.equals("")) { // 上传缩略图，并存储
			// String FileName =thumbFileName+ new Date().getTime() +
			// getExtention(thumbFileName);
			String FileName = MD5.md5(thumbFileName)
					+ getExtention(thumbFileName); // MD5加密;
			File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
					+ FileName);
			int imageid = getImgAttribute(newGoods_thumb, FileName, 1);
			goods.setGoodsThumbId(imageid);
			copy(newGoods_thumb, thumbFile);
		} else {
			goods.setGoodsThumbId(0); // 非空字段默认值为0
		}

		goodsDAO.save(goods);

		return SUCCESS;
	}

	/*
	 * for client and Editor (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsImage()
	 */
	@Override
	public String getGoodsImages() {
		Integer goods_id = getIntegerParameter(GOODS_ID);
		if (goods_id == null) {
			printString("{'msg':'没有商品号'}");
			return null;
		}
		List<GoodsImages> goodsimages = goodsImagesDAO.findByGoodsId(goods_id);
		List<GoodsImageView> result = new ArrayList<GoodsImageView>();
		for (GoodsImages goodsImages : goodsimages) {
			Image image = imageDAO.findById(goodsImages.getImgId());
			GoodsImageView goodsImageView = new GoodsImageView();
			goodsImageView.setId(goodsImages.getId());
			goodsImageView.setImageId(image.getImgId());
			if (image.getImgType() == 1) {
				goodsImageView.setImageURL(Config.get(Config.BASE_IMAGEURL)
						+ image.getImgUrl());
			} else {
				goodsImageView.setImageURL(image.getImgUrl());
			}
			result.add(goodsImageView);
		}
		printArray(result);

		return null;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#GoodsImages()
	 */
	@Override
	public String updateGoodsImages() {
		String updateType = getRequest().getParameter("submit");
		if (updateType.equals("更新")) { // 更新图片
			GoodsImages goodsImages = goodsImagesDAO
					.findById(getIntegerParameter("id"));
			if (imageFileName != null && !imageFileName.equals("")) { // 上传缩略图，并存储
				String FileName = MD5.md5(imageFileName)
						+ getExtention(imageFileName);
				File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(newGoods_image, FileName, 1);
				goodsImages.setImgId(imageid); // 只更新对应号码就行
				copy(newGoods_image, thumbFile);
			}
			return SUCCESS;
		} else if (updateType.equals("删除")) {
			GoodsImages goodsImages = goodsImagesDAO
					.findById(getIntegerParameter("id"));
			goodsImagesDAO.delete(goodsImages);
			return SUCCESS;
		} else if (updateType.equals("新增对应图片")) {
			GoodsImages goodsImages = new GoodsImages();
			goodsImages.setGoodsId(getIntegerParameter(GOODS_ID));
			if (imageFileName != null && !imageFileName.equals("")) { // 上传缩略图，并存储
				String FileName = MD5.md5(imageFileName)
						+ getExtention(imageFileName);
				File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(newGoods_image, FileName, 1);
				goodsImages.setImgId(imageid); // 只更新对应号码就行
				copy(newGoods_image, thumbFile);
			}
			goodsImagesDAO.save(goodsImages);
			return SUCCESS;
		}
		return null;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsMapList()
	 */
	@Override
	public String getGoodsMapList() {
		int goodsId = getIntegerParameter(GOODS_ID);
		List<GoodsMap> GoodsMapList = goodsMapDAO.findByGoodsId(goodsId);
		List<GoodsReal> result = new ArrayList<GoodsReal>();
		for (GoodsMap goodsMap : GoodsMapList) {
			GoodsReal goodsReal = goodsRealDAO.findById(goodsMap
					.getGoodsRealId());
			result.add(goodsReal);
		}
		printArray(result);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#GetGoodsRealListByMap()
	 */
	@Override
	public String GetGoodsRealListByMap() {
		Integer goodsId = getIntegerParameter(GOODS_ID);
		if (goodsId == null || goodsId == 0) {
			printString("{'msg':'没有商品id'}");
			return null;
		}
		List<GoodsMap> GoodsMapList = goodsMapDAO.findByGoodsId(goodsId);
		List<GoodsRealComparePriceView> result = new ArrayList<GoodsRealComparePriceView>();
		for (GoodsMap goodsMap : GoodsMapList) {
			GoodsReal goodsReal = goodsRealDAO.findById(goodsMap
					.getGoodsRealId());

			GoodsRealComparePriceView goodsRealComparePriceView = new GoodsRealComparePriceView();

			Provider provider = providerDAO.findById(goodsReal.getProviderId());
			goodsRealComparePriceView.setProviderId(goodsReal.getProviderId());
			goodsRealComparePriceView.setProviderName(provider
					.getProviderName());
			goodsRealComparePriceView.setDescription(provider
					.getProviderDeliver());

			goodsRealComparePriceView.setGoodsContent(goodsReal
					.getGoodsContent());
			goodsRealComparePriceView.setGoodsName(goodsReal.getGoodsName());
			goodsRealComparePriceView.setGoodsPrice(goodsReal.getGoodsPrice());
			goodsRealComparePriceView
					.setGoodsRealId(goodsReal.getGoodsRealId());
			result.add(goodsRealComparePriceView);
		}
		printArray(result);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#GetGoodsRealListBySeries
	 * ()
	 */
	@Override
	public String GetGoodsRealListBySeries() {
		List<GoodsReal> result = null;
		if (getRequest().getParameter("sid") != null
				&& !getRequest().getParameter("sid").equals("null")
				&& !getRequest().getParameter("sid").equals("0")) { // 如果有系列号，按系列号取商品数据
			int sid = getIntegerParameter("sid");
			Series series = seriesDAO.findById(sid);
			result = goodsRealDAO.findBySeriesName(series.getSeriesName());
		} else { // 按品牌取商品
			int bid = getIntegerParameter("bid");
			Brand brand = brandDAO.findById(bid);
			result = goodsRealDAO
					.findGoodsRealByBrandName(brand.getBrandName());
		}
		printArray(result);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListBySkin()
	 */
	@Override
	public String getGoodsListBySkin() {
		String msg = "";
		String skin = getRequest().getParameter("skin").substring(0, 1);
		String isSensitive = getRequest().getParameter("skin").substring(1, 2);
		if (skin == null || skin.equals("n")) {
			msg = "{'msg':'没有肤质结果'}";
			return null;
		}
		String skinName = TransTool.transSkinIdToName(skin);
		List<GoodsView> skinResult = new ArrayList<GoodsView>();
		List<GoodsView> notSkinResult = new ArrayList<GoodsView>();
		List<GoodsView> noticeSkinResult = new ArrayList<GoodsView>();
		List<Goods> goodslist = null;
		if (isSensitive.equals("0")) { // 如果是不敏感的
			goodslist = goodsDAO.findBySkin(skinName); // 获取适合肤质，不适合，需要注意的
			if (goodslist.isEmpty()) {
				msg = "{'msg':'无商品'}";
				printString(msg);
				return null;
			}
			for (Goods goods : goodslist) {
				GoodsView goodsView = new GoodsView();
				goodsView.setGoodsId(goods.getGoodsId());
				goodsView.setGoodsAge(goods.getGoodsAge());
				goodsView.setGoodsDescription(goods.getGoodsDescription());
				goodsView.setGoodsForskin(goods.getGoodsForskin());
				goodsView.setGoodsName(goods.getGoodsName());
				goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
				goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
				goodsView.setGoodsScore(goods.getGoodsScore());
				goodsView.setGoodsSpecification(goods.getGoodsSpecification());
				goodsView.setGoodsStatus(goods.getGoodsStatus());
				Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
				if (thumb != null) {
					if (thumb.getImgType() == 1) {
						goodsView.setGoodsThumb(Config
								.get(Config.BASE_IMAGEURL)
								+ thumb.getImgUrl());
					} else {
						goodsView.setGoodsThumb(thumb.getImgUrl());
					}
				} else {
					goodsView.setGoodsThumb("");
				}
				if (goods.getBrandId() != null) {
					Brand brand = brandDAO.findById(goods.getBrandId());
					goodsView.setGoodsBrandName(brand.getBrandName());
				}
				if (goods.getSeriesId() != null) {
					if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
						goodsView.setGoodsSeriesName("无");
					} else {
						Series series = seriesDAO.findById(goods.getSeriesId());
						goodsView.setGoodsSeriesName(series.getSeriesName());
					}
				}
				List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
						.findByGoods(goods); // 功效标签
				String efficacyName = "";
				if (goodsEfficacyList.isEmpty()) {
				} else {
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
								.getEfficacyId());
						efficacyName += efficacy.getEfficacyName() + "  ";
					}
					goodsView.setGoodsEfficacy(efficacyName);
				}
				if (goods.getGoodsForskin().contains(skinName)) { // 适合肤质
					skinResult.add(goodsView);
				}
				if (goods.getGoodsNotforskin().contains(skinName)) {
					notSkinResult.add(goodsView);
				}
				if (goods.getGoodsNoticeforskin().contains(skinName)) {
					noticeSkinResult.add(goodsView);
				}
			}
		} else { // 敏感性肌肤，则和前4选一是且的关系
			goodslist = goodsDAO.findBySkinSensitive(skinName); // 获取适合肤质，不适合，需要注意的
			if (goodslist.isEmpty()) {
				msg = "{'msg':'无商品'}";
				printString(msg);
				return null;
			}
			for (Goods goods : goodslist) {
				GoodsView goodsView = new GoodsView();
				goodsView.setGoodsId(goods.getGoodsId());
				goodsView.setGoodsAge(goods.getGoodsAge());
				goodsView.setGoodsDescription(goods.getGoodsDescription());
				goodsView.setGoodsForskin(goods.getGoodsForskin());
				goodsView.setGoodsName(goods.getGoodsName());
				goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
				goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
				goodsView.setGoodsScore(goods.getGoodsScore());
				goodsView.setGoodsSpecification(goods.getGoodsSpecification());
				goodsView.setGoodsStatus(goods.getGoodsStatus());
				Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
				if (thumb != null) {
					if (thumb.getImgType() == 1) {
						goodsView.setGoodsThumb(Config
								.get(Config.BASE_IMAGEURL)
								+ thumb.getImgUrl());
					} else {
						goodsView.setGoodsThumb(thumb.getImgUrl());
					}
				} else {
					goodsView.setGoodsThumb("");
				}
				if (goods.getBrandId() != null) {
					Brand brand = brandDAO.findById(goods.getBrandId());
					goodsView.setGoodsBrandName(brand.getBrandName());
				}
				if (goods.getSeriesId() != null) {
					if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
						goodsView.setGoodsSeriesName("无");
					} else {
						Series series = seriesDAO.findById(goods.getSeriesId());
						goodsView.setGoodsSeriesName(series.getSeriesName());
					}
				}
				List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
						.findByGoods(goods); // 功效标签
				String efficacyName = "";
				if (goodsEfficacyList.isEmpty()) {
				} else {
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
								.getEfficacyId());
						efficacyName += efficacy.getEfficacyName() + "  ";
					}
					goodsView.setGoodsEfficacy(efficacyName);
				}
				if (goods.getGoodsForskin().contains(skinName)
						&& goods.getGoodsForskin().contains("敏感性")) { // 适合肤质
					skinResult.add(goodsView);
				}
				if (goods.getGoodsNotforskin().contains(skinName)
						&& goods.getGoodsNotforskin().contains("敏感性")) {
					notSkinResult.add(goodsView);
				}
				if (goods.getGoodsNoticeforskin().contains(skinName)
						&& goods.getGoodsNoticeforskin().contains("敏感性")) {
					noticeSkinResult.add(goodsView);
				}
			}
		}
		if (goodslist.isEmpty()) {
			msg = "{'msg':'无商品'}";
			printString(msg);
			return null;
		}
		GoodsSkinView result = new GoodsSkinView();
		result.setSkinResult(skinResult);
		result.setNotSkinResult(notSkinResult);
		result.setNoticeSkinResult(noticeSkinResult);
		printObject(result);
		return null;
	}

	/*
	 * forClient and Editor (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsRealComment()
	 */
	@Override
	public String getGoodsRealComment() {
		int grid = getIntegerParameter(GOODS_REAL_ID);
		List<GoodsComment> goodsComments = goodsCommentDAO
				.findByGoodsRealId(grid);
		printArray(goodsComments);
		return null;
	}

	/*
	 * for Client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListBySkinAndCat
	 * ()
	 */
	@Override
	public String getGoodsListBySkinAndCat() {
		String msg = "";
		String uuid=getStringParameter(UUID);
		if (uuid == null) {
			msg = "{'msg':'没有设备号'}";
			printString(msg);
			return null;
		}
		String skin = getRequest().getParameter("skin").substring(0, 1);
		String isSensitive = getRequest().getParameter("skin").substring(1, 2);
		if (skin == null || skin.equals("n")) {
			msg = "{'msg':'没有肤质结果'}";
			return null;
		}
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null) {
			msg = "{'msg':'没有分类号'}";
			printString(msg);
			return null;
		}
		String skinName = TransTool.transSkinIdToName(skin);
		List<GoodsView> skinResult = new ArrayList<GoodsView>();
		List<GoodsView> notSkinResult = new ArrayList<GoodsView>();
		List<GoodsView> noticeSkinResult = new ArrayList<GoodsView>();
		List<Goods> goodslist = null;
		if (isSensitive.equals("0")) { // 如果是不敏感的
			goodslist = goodsDAO.findBySkinAndCat(skinName, categoryId); // 获取适合肤质，不适合，需要注意的
			if (goodslist.isEmpty()) {
				msg = "{'msg':'无商品'}";
				printString(msg);
				return null;
			}
			for (Goods goods : goodslist) {
				GoodsView goodsView = new GoodsView();
				goodsView.setGoodsId(goods.getGoodsId());
				goodsView.setGoodsAge(goods.getGoodsAge());
				goodsView.setGoodsDescription(goods.getGoodsDescription());
				goodsView.setGoodsForskin(goods.getGoodsForskin());
				goodsView.setGoodsName(goods.getGoodsName());
				goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
				goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
				goodsView.setGoodsScore(goods.getGoodsScore());
				goodsView.setGoodsSpecification(goods.getGoodsSpecification());
				goodsView.setGoodsStatus(goods.getGoodsStatus());
				Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
				if (thumb != null) {
					if (thumb.getImgType() == 1) {
						goodsView.setGoodsThumb(Config
								.get(Config.BASE_IMAGEURL)
								+ thumb.getImgUrl());
					} else {
						goodsView.setGoodsThumb(thumb.getImgUrl());
					}
				} else {
					goodsView.setGoodsThumb("");
				}
				if (goods.getBrandId() != null) {
					Brand brand = brandDAO.findById(goods.getBrandId());
					goodsView.setGoodsBrandName(brand.getBrandName());
				}
				if (goods.getSeriesId() != null) {
					if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
						goodsView.setGoodsSeriesName("无");
					} else {
						Series series = seriesDAO.findById(goods.getSeriesId());
						goodsView.setGoodsSeriesName(series.getSeriesName());
					}
				}
				List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
						.findByGoods(goods); // 功效标签
				String efficacyName = "";
				if (goodsEfficacyList.isEmpty()) {
				} else {
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
								.getEfficacyId());
						efficacyName += efficacy.getEfficacyName() + "  ";
					}
					goodsView.setGoodsEfficacy(efficacyName);
				}
				if (goods.getGoodsForskin().contains(skinName)) { // 适合肤质
					skinResult.add(goodsView);
				}
				if (goods.getGoodsNotforskin().contains(skinName)) {
					notSkinResult.add(goodsView);
				}
				if (goods.getGoodsNoticeforskin().contains(skinName)) {
					noticeSkinResult.add(goodsView);
				}
			}
		} else { // 是敏感的
			goodslist = goodsDAO
					.findBySkinAndCatSensitive(skinName, categoryId); // 获取适合肤质，不适合，需要注意的(敏感性肌肤的)
			if (goodslist.isEmpty()) {
				msg = "{'msg':'无商品'}";
				printString(msg);
				return null;
			}
			for (Goods goods : goodslist) {
				GoodsView goodsView = new GoodsView();
				goodsView.setGoodsId(goods.getGoodsId());
				goodsView.setGoodsAge(goods.getGoodsAge());
				goodsView.setGoodsDescription(goods.getGoodsDescription());
				goodsView.setGoodsForskin(goods.getGoodsForskin());
				goodsView.setGoodsName(goods.getGoodsName());
				goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
				goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
				goodsView.setGoodsScore(goods.getGoodsScore());
				goodsView.setGoodsSpecification(goods.getGoodsSpecification());
				goodsView.setGoodsStatus(goods.getGoodsStatus());
				Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
				if (thumb != null) {
					if (thumb.getImgType() == 1) {
						goodsView.setGoodsThumb(Config
								.get(Config.BASE_IMAGEURL)
								+ thumb.getImgUrl());
					} else {
						goodsView.setGoodsThumb(thumb.getImgUrl());
					}
				} else {
					goodsView.setGoodsThumb("");
				}
				if (goods.getBrandId() != null) {
					Brand brand = brandDAO.findById(goods.getBrandId());
					goodsView.setGoodsBrandName(brand.getBrandName());
				}
				if (goods.getSeriesId() != null) {
					if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
						goodsView.setGoodsSeriesName("无");
					} else {
						Series series = seriesDAO.findById(goods.getSeriesId());
						goodsView.setGoodsSeriesName(series.getSeriesName());
					}
				}
				List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
						.findByGoods(goods); // 功效标签
				String efficacyName = "";
				if (goodsEfficacyList.isEmpty()) {
				} else {
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
								.getEfficacyId());
						efficacyName += efficacy.getEfficacyName() + "  ";
					}
					goodsView.setGoodsEfficacy(efficacyName);
				}
				if (goods.getGoodsForskin().contains(skinName)
						&& goods.getGoodsForskin().contains("敏感性")) { // 适合肤质
					skinResult.add(goodsView);
				}
				if (goods.getGoodsNotforskin().contains(skinName)
						&& goods.getGoodsNotforskin().contains("敏感性")) {
					notSkinResult.add(goodsView);
				}
				if (goods.getGoodsNoticeforskin().contains(skinName)
						&& goods.getGoodsNoticeforskin().contains("敏感性")) {
					noticeSkinResult.add(goodsView);
				}
			}
		}

		GoodsSkinView result = new GoodsSkinView();
		result.setSkinResult(skinResult);
		result.setNotSkinResult(notSkinResult);
		result.setNoticeSkinResult(noticeSkinResult);
		printObject(result);
		
		
		/*日志记录*/
		GetGoodsListLog getGoodsListLog = new GetGoodsListLog(uuid, getRequest());
		getGoodsListLog.setFrom(GetGoodsListLog.CATEGORY);
		getGoodsListLog.setFromMsg(categoryId+"");
		getGoodsListLogger.debug(getGoodsListLog);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListBySearch()
	 */
	@Override
	public String getGoodsListBySearch() {
		String uuid = getStringParameter(UUID);
		String keyword = getStringParameter("kw");
		String[] keywords = keyword
				.split(",|\\.|/|\\\\|=|-(|)|\\*|%|@|\\~|\\+|<|>|$|&|。| |，|！|、"); // 按分隔符分割为多个词
		if (keywords == null || keywords[0].equals("null")) {
			printString("{'msg':'没有搜索关键词'}");
			return null;
		}
		List<GoodsView> goodsViews = new ArrayList<GoodsView>(); // 返回的结果
		List<Integer> goodsId = new ArrayList<Integer>(); // 返回结果的GID
		List<Integer> goodsId1 = new ArrayList<Integer>(); // 品牌结果
		List<Integer> goodsId2 = new ArrayList<Integer>(); // 分类结果
		List<Integer> goodsId3 = new ArrayList<Integer>(); // 功效结果
		String hqlSearch = "";
		for (int i = 0; i < keywords.length; i++) { // 多个关键词
			hqlSearch += brandDAO.BRAND_NAME + "= '" + keywords[i] + "' or "
					+ brandDAO.BRAND_ALIAS + "='" + keywords[i] + "'";
			if (i != keywords.length - 1) {
				hqlSearch += " or ";
			}
		}
		List<Brand> brands = brandDAO.findByBrandNameOrBrandAlias(hqlSearch); // 根据品牌名或者别名查找先
		if (!brands.isEmpty()) { // 搜索的关键词是品牌
			Brand brand = brands.get(0); // 其实做多只能匹配一个品牌名
			int bid = brand.getBrandId();
			List<Goods> goodsList = goodsDAO.findByBrandId(bid);
			for (Goods goods : goodsList) {
				goodsId1.add(goods.getGoodsId());
			}

		}
		hqlSearch = "";
		for (int i = 0; i < keywords.length; i++) { // 多个关键词
			hqlSearch += "categoryName='" + keywords[i] + "'";
			if (i != keywords.length - 1) {
				hqlSearch += " or ";
			}
		}
		List<Category> categorys = categoryDAO.findByCategoryNames(hqlSearch);
		if (!categorys.isEmpty()) { // 搜索的关键词是分类词
			Category category = categorys.get(0); // 其实做多只能匹配一个品牌名
			int cid = category.getCategoryId();
			List<Goods> goodsList = goodsDAO.findByCategoryId(cid);
			for (Goods goods : goodsList) {
				goodsId2.add(goods.getGoodsId());
			}
		}

		hqlSearch = "";
		for (int i = 0; i < keywords.length; i++) { // 多个关键词
			hqlSearch += "efficacyName='" + keywords[i] + "'";
			if (i != keywords.length - 1) {
				hqlSearch += " or ";
			}
		}
		List<Efficacy> efficacies = efficacyDAO.findByEfficacyNames(hqlSearch);
		if (!efficacies.isEmpty()) { // 搜索的关键词是功效
			Efficacy category = efficacies.get(0); // 其实做多只能匹配一个品牌名
			int eid = category.getEfficacyId();
			List<GoodsEfficacy> goodsList = goodsEfficacyDAO
					.findByEfficacyId(eid);
			for (GoodsEfficacy goodsEfficacy : goodsList) {
				goodsId3.add(goodsEfficacy.getGoods().getGoodsId());
			}
		}

		/*
		 * 因为是且的关系，所以在goodsId2里面包含的才继续加到goodsId3中,如果在品牌和分类相关的搜索中都包含，则加入到goodsId3中
		 */

		if (!goodsId1.isEmpty()) { // 优先品牌查询
			for (Integer Id1 : goodsId1) {
				if ((goodsId2.contains(Id1) || goodsId2.isEmpty())
						&& (goodsId3.contains(Id1) || goodsId3.isEmpty())) { // 分类和功效都包含（没有数据也算包含）
					goodsId.add(Id1);
				}

			}
		} else if (!goodsId2.isEmpty()) { // 其次是分类查询
			for (Integer Id2 : goodsId2) {
				if ((goodsId3.contains(Id2) || goodsId3.isEmpty())) { // 功效包含（没有数据也算包含）
					goodsId.add(Id2);
				}
			}

		} else if (!goodsId3.isEmpty()) // 再次是功效查询
		{
			goodsId = goodsId3;
		} else { // 全无数据，则进行关键词查找
			hqlSearch = "";
			for (int i = 0; i < keywords.length; i++) { // 多个关键词
				hqlSearch += "goodsName like '%" + keywords[i] + "%'";
				if (i != keywords.length - 1) {
					hqlSearch += " or ";
				}
			}
			List<Goods> goodsList = goodsDAO.findBySearchKeyword(hqlSearch);
			for (Goods goods : goodsList) {
				goodsId.add(goods.getGoodsId());
			}
		}

		if (goodsId.isEmpty()) { // 无商品
			printString("{'msg':'没有搜索到商品'}");
			return null;
		}

		for (int id : goodsId) { // 将GID转换为goodsView输出
			Goods goods = goodsDAO.findById(id);
			GoodsView goodsView = new GoodsView();
			goodsView.setGoodsId(goods.getGoodsId());
			goodsView.setGoodsAge(goods.getGoodsAge());
			goodsView.setGoodsDescription(goods.getGoodsDescription());
			goodsView.setGoodsForskin(goods.getGoodsForskin());
			goodsView.setGoodsName(goods.getGoodsName());
			goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
			goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
			goodsView.setGoodsScore(goods.getGoodsScore());
			goodsView.setGoodsSpecification(goods.getGoodsSpecification());
			goodsView.setGoodsStatus(goods.getGoodsStatus());
			Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
			if (thumb != null) {
				if (thumb.getImgType() == 1) {
					goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL)
							+ thumb.getImgUrl());
				} else {
					goodsView.setGoodsThumb(thumb.getImgUrl());
				}
			} else {
				goodsView.setGoodsThumb("");
			}
			if (goods.getBrandId() != null) {
				Brand brand = brandDAO.findById(goods.getBrandId());
				goodsView.setGoodsBrandName(brand.getBrandName());
			}
			if (goods.getSeriesId() != null) {
				if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				} else {
					Series series = seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
					.findByGoods(goods); // 功效标签
			String efficacyName = "";
			if (goodsEfficacyList.isEmpty()) {
			} else {
				for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
					Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
							.getEfficacyId());
					efficacyName += efficacy.getEfficacyName() + "  ";
				}
				goodsView.setGoodsEfficacy(efficacyName);
			}
			goodsViews.add(goodsView);
		}

		printArray(goodsViews);
		
		
		/*日志记录*/
		GetGoodsListLog getGoodsListLog = new GetGoodsListLog(uuid, getRequest());
		getGoodsListLog.setFrom(GetGoodsListLog.SEARCH);
		getGoodsListLog.setFromMsg(keyword);
		getGoodsListLogger.debug(getGoodsListLog);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListByEfficacy()
	 */
	@Override
	public String getGoodsListByEfficacy() {
		String uuid = getStringParameter(UUID);
		Integer eid = getIntegerParameter("eid");
		if (eid == null || eid == 0) {
			printString("{'msg':'没有输入功效号'}");
			return null;
		}
		Efficacy efficacy = efficacyDAO.findById(eid);
		if (efficacy == null) {
			printString("{'msg':'没有找到功效'}");
			return null;
		}
		List<GoodsView> goodsViews = new ArrayList<GoodsView>(); // 返回的结果
		List<GoodsEfficacy> goodsList = goodsEfficacyDAO.findByEfficacyId(eid);
		if (goodsList.isEmpty()) {
			printString("{'msg':'没有商品'}");
			return null;
		}
		for (GoodsEfficacy goodsEfficacy : goodsList) {
			Goods goods = goodsEfficacy.getGoods();
			GoodsView goodsView = new GoodsView();
			goodsView.setGoodsId(goods.getGoodsId());
			goodsView.setGoodsAge(goods.getGoodsAge());
			goodsView.setGoodsDescription(goods.getGoodsDescription());
			goodsView.setGoodsForskin(goods.getGoodsForskin());
			goodsView.setGoodsName(goods.getGoodsName());
			goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
			goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
			goodsView.setGoodsScore(goods.getGoodsScore());
			goodsView.setGoodsSpecification(goods.getGoodsSpecification());
			goodsView.setGoodsStatus(goods.getGoodsStatus());
			Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
			if (thumb != null) {
				if (thumb.getImgType() == 1) {
					goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL)
							+ thumb.getImgUrl());
				} else {
					goodsView.setGoodsThumb(thumb.getImgUrl());
				}
			} else {
				goodsView.setGoodsThumb("");
			}
			if (goods.getBrandId() != null) {
				Brand brand = brandDAO.findById(goods.getBrandId());
				goodsView.setGoodsBrandName(brand.getBrandName());
			}
			if (goods.getSeriesId() != null) {
				if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				} else {
					Series series = seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			String efficacyName = "";
			efficacyName += efficacy.getEfficacyName() + "  ";
			goodsView.setGoodsEfficacy(efficacyName);
			goodsViews.add(goodsView);
		}
		printArray(goodsViews);
		
		/*日志记录*/
		GetGoodsListLog getGoodsListLog = new GetGoodsListLog(uuid, getRequest());
		getGoodsListLog.setFrom(GetGoodsListLog.EFFICASY);
		getGoodsListLog.setFromMsg(eid+"");
		getGoodsListLogger.debug(getGoodsListLog);
		return null;
	}

	/*
	 * for client  and Editor
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListByBrand()
	 */
	@Override
	public String getGoodsListByBrand() {
		String uuid = getStringParameter(UUID);
		Integer bid = getIntegerParameter("bid");
		if (bid == null || bid == 0) {
			printString("{'msg':'没有输入品牌号'}");
			return null;
		}
		Brand brand = brandDAO.findById(bid);
		if (brand == null) {
			printString("{'msg':'没有找到品牌'}");
			return null;
		}
		List<GoodsView> goodsViews = new ArrayList<GoodsView>(); // 返回的结果
		List<Goods> goodsList = goodsDAO.findByBrandId(bid);
		if (goodsList.isEmpty()) {
			printString("{'msg':'没有商品'}");
			return null;
		}
		for (Goods goods : goodsList) {
			GoodsView goodsView = new GoodsView();
			goodsView.setGoodsId(goods.getGoodsId());
			goodsView.setGoodsAge(goods.getGoodsAge());
			goodsView.setGoodsDescription(goods.getGoodsDescription());
			goodsView.setGoodsForskin(goods.getGoodsForskin());
			goodsView.setGoodsName(goods.getGoodsName());
			goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
			goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
			goodsView.setGoodsScore(goods.getGoodsScore());
			goodsView.setGoodsSpecification(goods.getGoodsSpecification());
			goodsView.setGoodsStatus(goods.getGoodsStatus());
			Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
			if (thumb != null) {
				if (thumb.getImgType() == 1) {
					goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL)
							+ thumb.getImgUrl());
				} else {
					goodsView.setGoodsThumb(thumb.getImgUrl());
				}
			} else {
				goodsView.setGoodsThumb("");
			}
			goodsView.setGoodsBrandName(brand.getBrandName());
			if (goods.getSeriesId() != null) {
				if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				} else {
					Series series = seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
					.findByGoods(goods); // 功效标签
			String efficacyName = "";
			if (goodsEfficacyList.isEmpty()) {
			} else {
				for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
					Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
							.getEfficacyId());
					efficacyName += efficacy.getEfficacyName() + "  ";
				}
				goodsView.setGoodsEfficacy(efficacyName);
			}
			goodsViews.add(goodsView);
		}

		printArray(goodsViews);
		
		
		/*日志记录*/
		GetGoodsListLog getGoodsListLog = new GetGoodsListLog(uuid, getRequest());
		getGoodsListLog.setFrom(GetGoodsListLog.EFFICASY);
		getGoodsListLog.setFromMsg(bid+"");
		getGoodsListLogger.debug(getGoodsListLog);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsExperience()
	 */
	@Override
	public String getGoodsExperience() {
		Integer gid = getIntegerParameter(GOODS_ID);
		if (gid == null || gid == 0) {
			printString("{'msg':'没有输入商品号'}");
			return null;
		}

		Goods goods = goodsDAO.findById(gid);
		if (goods == null) {
			printString("{'msg':'没有该商品'}");
			return null;
		}
		List<GoodsExperience> goodsExperiences = goodsExperienceDAO.findByGoodsId(gid);
		if(goodsExperiences.isEmpty()){
			printString("{'msg':'此商品暂无心得评测'}");
			return null;
		}
		printArray(goodsExperiences);
		return null;
	}

	/*
	 * for client (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListByRanking()
	 */
	@Override
	public String getGoodsListByRanking() {
		String msg = "";
		String uuid = getStringParameter(UUID);
		Integer rankingId = getIntegerParameter(RANKING_ID);
		if (rankingId == null) {
			msg = "{'msg':'没有排行榜ID'}";
			printString(msg);
			return null;
		}
		List<RankingGoods> goodsList = rankingGoodsDAO
				.findByRankingId(rankingId);
		if (goodsList.isEmpty()) {
			msg = "{'msg':'暂无排行商品'}";
			printString(msg);
			return null;
		}
		List<GoodsView> goodsViews = new ArrayList<GoodsView>(); // 返回的结果
		for (RankingGoods rankingGoods : goodsList) {
			Goods goods = rankingGoods.getGoods();
			GoodsView goodsView = new GoodsView();
			goodsView.setGoodsId(goods.getGoodsId());
			goodsView.setGoodsAge(goods.getGoodsAge());
			goodsView.setGoodsDescription(goods.getGoodsDescription());
			goodsView.setGoodsForskin(goods.getGoodsForskin());
			goodsView.setGoodsName(goods.getGoodsName());
			goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
			goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
			goodsView.setGoodsScore(goods.getGoodsScore());
			goodsView.setGoodsSpecification(goods.getGoodsSpecification());
			goodsView.setGoodsStatus(goods.getGoodsStatus());
			Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
			if (thumb != null) {
				if (thumb.getImgType() == 1) {
					goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL)
							+ thumb.getImgUrl());
				} else {
					goodsView.setGoodsThumb(thumb.getImgUrl());
				}
			} else {
				goodsView.setGoodsThumb("");
			}
			if (goods.getBrandId() != null) {
				Brand brand = brandDAO.findById(goods.getBrandId());
				goodsView.setGoodsBrandName(brand.getBrandName());
			}
			if (goods.getSeriesId() != null) {
				if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				} else {
					Series series = seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
					.findByGoods(goods); // 功效标签
			String efficacyName = "";
			if (goodsEfficacyList.isEmpty()) {
			} else {
				for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
					Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
							.getEfficacyId());
					efficacyName += efficacy.getEfficacyName() + "  ";
				}
				goodsView.setGoodsEfficacy(efficacyName);
			}
			goodsViews.add(goodsView);

		}
		printArray(goodsViews);
		
		/*日志记录*/
		GetGoodsListLog getGoodsListLog = new GetGoodsListLog(uuid, getRequest());
		getGoodsListLog.setFrom(GetGoodsListLog.RANKING);
		getGoodsListLog.setFromMsg(rankingId+"");
		getGoodsListLogger.debug(getGoodsListLog);
		return null;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListByRanking0()
	 */
	@Override
	public String getGoodsListByRanking0() {
		String msg = "";
		Integer rankingId = getIntegerParameter(RANKING_ID);
		if (rankingId == null) {
			msg = "{'msg':'没有排行榜ID'}";
			printString(msg);
			return null;
		}
		List<RankingGoods> goodsList = rankingGoodsDAO
				.findByRankingId(rankingId);
		if (goodsList.isEmpty()) {
			msg = "{'msg':'暂无排行商品'}";
			printString(msg);
			return null;
		}
		List<GoodsViewWithRanking> goodsViewWithRankings = new ArrayList<GoodsViewWithRanking>(); // 返回的结果
		for (RankingGoods rankingGoods : goodsList) {
			Goods goods = rankingGoods.getGoods();
			GoodsView goodsView = new GoodsView();
			goodsView.setGoodsId(goods.getGoodsId());
			goodsView.setGoodsAge(goods.getGoodsAge());
			goodsView.setGoodsDescription(goods.getGoodsDescription());
			goodsView.setGoodsForskin(goods.getGoodsForskin());
			goodsView.setGoodsName(goods.getGoodsName());
			goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
			goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
			goodsView.setGoodsScore(goods.getGoodsScore());
			goodsView.setGoodsSpecification(goods.getGoodsSpecification());
			goodsView.setGoodsStatus(goods.getGoodsStatus());
			Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
			if (thumb != null) {
				if (thumb.getImgType() == 1) {
					goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL)
							+ thumb.getImgUrl());
				} else {
					goodsView.setGoodsThumb(thumb.getImgUrl());
				}
			} else {
				goodsView.setGoodsThumb("");
			}
			if (goods.getBrandId() != null) {
				Brand brand = brandDAO.findById(goods.getBrandId());
				goodsView.setGoodsBrandName(brand.getBrandName());
			}
			if (goods.getSeriesId() != null) {
				if (goods.getSeriesId() == 0) { // 对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				} else {
					Series series = seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			List<GoodsEfficacy> goodsEfficacyList = goodsEfficacyDAO
					.findByGoods(goods); // 功效标签
			String efficacyName = "";
			if (goodsEfficacyList.isEmpty()) {
			} else {
				for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
					Efficacy efficacy = efficacyDAO.findById(goodsEfficacy
							.getEfficacyId());
					efficacyName += efficacy.getEfficacyName() + "  ";
				}
				goodsView.setGoodsEfficacy(efficacyName);
			}
			GoodsViewWithRanking goodsViewWithRanking = new GoodsViewWithRanking();
			goodsViewWithRanking.setRanking_id(rankingGoods.getId());
			goodsViewWithRanking.setGoodsView(goodsView);
			goodsViewWithRankings.add(goodsViewWithRanking);
		}
		printArray(goodsViewWithRankings);
		return null;
	}
	
	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#updateGoods2realGoods()
	 */
	@Override
	public String updateGoods2realGoods() {
		Integer goodsId = getIntegerParameter(GOODS_ID);
		Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		String updateType = getStringParameter("submit");

		if (updateType.equals("确认")) { // 小编确认
			GoodsReal goodsReal = goodsRealDAO.findById(goodsRealId);
			goodsReal.setGoodsStatus(GOODS_EDITORCONFIRM_CORRECT); // 小编确认过的设置为6
			return SUCCESS;
		} else if (updateType.equals("删除")) { // 删除
			List<GoodsMap> goodsMaps = goodsMapDAO.findByGoodsIdAndGoodsRealId(
					goodsId, goodsRealId);
			goodsMapDAO.delete(goodsMaps.get(0));

			GoodsReal goodsReal = goodsRealDAO.findById(goodsRealId);
			goodsReal.setGoodsStatus(GOODS_EDITORCONFIRM_DELETE); // 小编删除过的设置为4
			return SUCCESS;
		} else if (updateType.equals("添加")) { // 添加对应真实商品
			GoodsMap goodsMap = new GoodsMap();
			goodsMap.setGoodsId(goodsId);
			goodsMap.setGoodsRealId(goodsRealId);
			goodsMapDAO.save(goodsMap);

			GoodsReal goodsReal = goodsRealDAO.findById(goodsRealId);
			goodsReal.setGoodsStatus(GOODS_EDITORCONFIRM_CORRECT); // 小编添加的直接设置为6
			return SUCCESS;
		} else if (updateType.equals("程序更新真实商品")) { // 更新真实商品,即更新goodsMap表
			Goods goods = goodsDAO.findById(goodsId);
			String goodsName = goods.getGoodsName();
			Brand brand = brandDAO.findById(goods.getBrandId());   //品牌
			List<GoodsReal> goodsReals = goodsRealDAO
					.findByBrandIdAndCategoryId(goods.getBrandId(), goods
							.getCategoryId()); // 先通过品牌ID和分类ID筛选过滤
			for (GoodsReal goodsReal : goodsReals) {
				/*小编处理的，是都可见的*/
//				 if(goodsReal.getGoodsStatus()!=3 &&
//				 goodsReal.getGoodsStatus()!=6){ //商品状态不是3或6则不给显示
//				 continue;
//				 }
				String goodsRealName = goodsReal.getGoodsName();
				/* 字符串匹配筛选过滤 */

				String goodsName_compare=goodsName.replaceAll("(?i)"+brand.getBrandName(), "");  //(?i)代表忽略大小写
				goodsName_compare=goodsName_compare.replaceAll("(?i)"+brand.getBrandAlias(), "");    //除去商品名称中的商品名称和别名
				String goodsRealName_compare=goodsRealName.replaceAll("(?i)"+brand.getBrandName(), "");
				goodsRealName_compare=goodsRealName_compare.replaceAll("(?i)"+brand.getBrandAlias(), "");//除去商品名称中的商品名称和别名
				double similarity = CompareTool.stringSimilarity(goodsName_compare,    //字符串匹配结果
						goodsRealName_compare);
						double similarity1 = CompareTool.stringSimilarity(goodsName,   //原，不去掉品牌名的字符串匹配结果
								goodsRealName);
				if (similarity > 0.76) { // 相似度取值
					List<GoodsMap> goodsMaps = goodsMapDAO
							.findByGoodsIdAndGoodsRealId(goodsId, goodsReal
									.getGoodsRealId()); // 通过商品和真实商品 id
														// 获得goodsMap
					if (goodsMaps.isEmpty()) { // 如果没有则插入该goodsMap
						GoodsMap goodsMap = new GoodsMap();
						goodsMap.setGoodsId(goodsId);
						goodsMap.setGoodsRealId(goodsReal.getGoodsRealId());
						goodsMapDAO.save(goodsMap);
					}
				}
			}
			return SUCCESS;
		}
		return ERROR;
	}


	/*
	 * for Programmer (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.GoodsInterface#copyGoodsReal2Goods()
	 */
	@Override
	public String copyGoodsReal2Goods() {
		Integer providerId = getIntegerParameter(PROVIDER_ID);
		List<GoodsReal> goodsReals = goodsRealDAO.findByProviderId(providerId);
		for (GoodsReal goodsReal : goodsReals) {
			if (goodsReal.getCategoryId() == 0) { // 分类ID号无法对应的，代表不是护肤类得，这期先不上线
				continue;
			}
			Goods goods = new Goods();
			URL url;
			InputStream is = null;
			FileOutputStream out = null;
			try {
				/* 将图片的url存入自己的图片数据库，但是图片不保存，imgType设置为0，代表外站来源 */
				url = new URL(goodsReal.getGoodsThumb());
				URLConnection uc = url.openConnection();
				is = uc.getInputStream();
				File file = new File("D:/testImg");
				out = new FileOutputStream(file);
				int i = 0;
				while ((i = is.read()) != -1) {
					out.write(i);
				}

				int imageid = getImgAttribute(file, goodsReal.getGoodsThumb(),
						0); // 只需要取到image不需要本地存储
				goods.setGoodsThumbId(imageid);// 保存缩略图URL

				goods.setBrandId(goodsReal.getBrandId());
				goods.setCategoryId(goodsReal.getCategoryId());
				goods.setGoodsAddTime(Timestamp.valueOf(dateTimeFormat
						.format(new Date())));
				goods.setGoodsAge(goodsReal.getGoodsAge());
				goods.setGoodsBuyCount(goodsReal.getGoodsBuyCount()); // 购买数量，初始值应该是0
				goods.setGoodsDescription(goodsReal.getGoodsDescription());
				goods.setGoodsForskin(goodsReal.getGoodsForskin());
				goods.setGoodsLastUpdate(Timestamp.valueOf(dateTimeFormat
						.format(new Date())));
				goods.setGoodsName(goodsReal.getGoodsName());
				goods.setGoodsNotforskin(goodsReal.getGoodsNotforskin());
				goods.setGoodsNoticeforskin(goodsReal.getGoodsNoticeforskin());
				goods.setGoodsRank(0); // 排序值，暂无，以后需修改
				goods.setGoodsScore(goodsReal.getGoodsScore());
				goods.setGoodsSpecification(goodsReal.getGoodsSpecification());
				goods.setGoodsStatus((short) 3);
				goods.setSeriesId(0); // 系列id 暂时设置为0
				goods.setGoodsViewCount(goodsReal.getGoodsViewCount()); // 访问数量，初始值应该是0\
				goodsDAO.save(goods);

				/* 保存详情图对应关系 */
				int goodsId = goods.getGoodsId();
				List<String> fileNames = (List<String>) PHPSerializer
						.unserialize(goodsReal.getGoodsImages().getBytes()); // 反序列化goodsreal中的商品详情图到goodsImage中
				for (String fileName : fileNames) {
					GoodsImages goodsImages = new GoodsImages();
					goodsImages.setGoodsId(goodsId);
					/* 将图片的url存入自己的图片数据库，但是图片不保存，imgType设置为0，代表外站来源 */
					url = new URL(goodsReal.getGoodsThumb());
					uc = url.openConnection();
					is = uc.getInputStream();
					file = new File("D:/testImg");
					out = new FileOutputStream(file);
					i = 0;
					while ((i = is.read()) != -1) {
						out.write(i);
					}
					imageid = getImgAttribute(file, fileName, 0); // 只需要取到image不需要本地存储
					goodsImages.setImgId(imageid);
					goodsImagesDAO.save(goodsImages);
				}
				is.close();
				out.close();
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}


	/*
	 * for Programmer
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#updateGoodsMap()
	 */
	@Override
	public String updateGoodsMap() {
		List<Goods> goodsList = goodsDAO.findAll();
		for (Goods goods : goodsList) {
			String goodsName = goods.getGoodsName();
			Brand brand = brandDAO.findById(goods.getBrandId());   //品牌
			List<GoodsReal> goodsReals = goodsRealDAO
					.findByBrandIdAndCategoryId(goods.getBrandId(), goods
							.getCategoryId()); // 先通过品牌ID和分类ID筛选过滤
			for (GoodsReal goodsReal : goodsReals) {
				 if(goodsReal.getGoodsStatus()!=GOODS_NOCONFIRM &&
				 goodsReal.getGoodsStatus()!=GOODS_EDITORCONFIRM_CORRECT){ //商品状态不是3或6则不给显示
				 continue;
				 }
				String goodsRealName = goodsReal.getGoodsName();
				/* 字符串匹配筛选过滤 */
				String goodsName_compare=goodsName.replaceAll("(?i)"+brand.getBrandName(), "");
				goodsName_compare=goodsName_compare.replaceAll("(?i)"+brand.getBrandAlias(), "");    //除去商品名称中的商品名称和别名
				String goodsRealName_compare=goodsRealName.replaceAll("(?i)"+brand.getBrandName(), "");
				goodsRealName_compare=goodsRealName_compare.replaceAll("(?i)"+brand.getBrandAlias(), "");//除去商品名称中的商品名称和别名
				double similarity = CompareTool.stringSimilarity(goodsName_compare,goodsRealName_compare);
				if (similarity > 0.76) { // 相似度取值
					List<GoodsMap> goodsMaps = goodsMapDAO
							.findByGoodsIdAndGoodsRealId(goods.getGoodsId(), goodsReal
									.getGoodsRealId()); // 通过商品和真实商品 id
														// 获得goodsMap
					if (goodsMaps.isEmpty()) { // 如果没有则插入该goodsMap
						GoodsMap goodsMap = new GoodsMap();
						goodsMap.setGoodsId(goods.getGoodsId());
						goodsMap.setGoodsRealId(goodsReal.getGoodsRealId());
						goodsMapDAO.save(goodsMap);
					}
				}
			}
		}
		
		return null;
	}

	/*
	 * for Programmer
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#updateGoodsMap()
	 */
	@Override
	public String updateGoodsExperience() {
		List<GoodsExperience> goodsExperiences=goodsExperienceDAO.findAll();
		List<Goods> goodsList=goodsDAO.findAll();
		String lastGoodsName="";
		int lastGoodsId=0;
		for (GoodsExperience goodsExperience : goodsExperiences) {
			String goodsExperienceName=goodsExperience.getGoodsName();
			if(lastGoodsName.equals(goodsExperienceName)){
				goodsExperience.setGoodsId(lastGoodsId);
				continue;
			}
			int i=0;
			double maxSimilarity=0;
			int index=0;
			for (Goods goods : goodsList) {
				String goodsName=goods.getGoodsName();
				double similarity = CompareTool.stringSimilarity(goodsExperienceName,goodsName);
				if(similarity>maxSimilarity){
					maxSimilarity=similarity;
					index=i;
					if(similarity==1){
						break;
					}
				}
				i++;
			}
//			倩碧润肤露——带押嘴
//			Clinique 倩碧特效润肤露(带押嘴68LE)
			
			lastGoodsName=goodsExperienceName;  //因为心得评测中的重复值很多，所以要记录上一次的，减少操作
			if(maxSimilarity<0.5){
				lastGoodsId=0;
				goodsExperience.setGoodsId(0);
			}else{
				lastGoodsId=goodsList.get(index).getGoodsId();
				goodsExperience.setGoodsId(goodsList.get(index).getGoodsId());
			}
			
			System.out.println("index:"+index+"  maxSimilarity:"+maxSimilarity+"  goodsId:"+lastGoodsId);
		}
		return SUCCESS;
	}
	
	/*
	 * for Programmer
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#updateGoodsExperienceDetail()
	 */
	@Override
	public String updateGoodsExperienceDetail() {
		List<GoodsExperience> goodsExperiences = goodsExperienceDAO.findAll();
		
//		/*清除所有的<br/>标签*/
//		for (GoodsExperience goodsExperience : goodsExperiences) {
//			String goodsExperienceDetail = goodsExperience
//			.getExperienceDetail();
//			
//			goodsExperienceDetail=goodsExperienceDetail.replace("<br/>", "");
//			goodsExperience.setExperienceDetail(goodsExperienceDetail);
//		}
		
		for (GoodsExperience goodsExperience : goodsExperiences) {
			String goodsExperienceDetail = goodsExperience
					.getExperienceDetail();
			java.util.regex.Pattern p_html;
			java.util.regex.Matcher m_html;
			p_html = java.util.regex.Pattern.compile("<[^>]+>",
					java.util.regex.Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(goodsExperienceDetail);
			List<String> list=new ArrayList<String>();     // list存储转换过的<img>标签，用于防止相同图片都添加<br/>标签
			while (m_html.find()) {
				String imgTag = m_html.group();
				if(!list.contains(imgTag)){
					goodsExperienceDetail=goodsExperienceDetail.replace(imgTag, "<br/>" + imgTag
							+ "<br/>");
					list.add(imgTag);
				}
			}
			goodsExperience.setExperienceDetail(goodsExperienceDetail);
		}
		return null;
	}
	
	/*
	 * for Programmer
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#updateGoodsMap()
	 */
	@Override
	public String insertNoMapGoodsReal() {
		List<GoodsReal> goodsReals = goodsRealDAO.findAll();
		for (GoodsReal goodsReal : goodsReals) {
			List<GoodsMap> goodsMaps=goodsMapDAO.findByGoodsRealId(goodsReal.getGoodsRealId());
			if(goodsMaps.isEmpty() && goodsReal.getCategoryId()!=0){ //不在goodsMap中的内容需要添加到goods表中
				Goods goods = new Goods();
				URL url;
				InputStream is = null;
				FileOutputStream out = null;
				try {
					/* 将图片的url存入自己的图片数据库，但是图片不保存，imgType设置为0，代表外站来源 */
					url = new URL(goodsReal.getGoodsThumb());
					URLConnection uc = url.openConnection();
					is = uc.getInputStream();
					File file = new File("D:/testImg");
					out = new FileOutputStream(file);
					int i = 0;
					while ((i = is.read()) != -1) {
						out.write(i);
					}

					int imageid = getImgAttribute(file, goodsReal.getGoodsThumb(),
							0); // 只需要取到image不需要本地存储
					goods.setGoodsThumbId(imageid);// 保存缩略图URL

					goods.setBrandId(goodsReal.getBrandId());
					goods.setCategoryId(goodsReal.getCategoryId());
					goods.setGoodsAddTime(Timestamp.valueOf(dateTimeFormat
							.format(new Date())));
					goods.setGoodsAge(goodsReal.getGoodsAge());
					goods.setGoodsBuyCount(goodsReal.getGoodsBuyCount()); // 购买数量，初始值应该是0
					goods.setGoodsDescription(goodsReal.getGoodsDescription());
					goods.setGoodsForskin(goodsReal.getGoodsForskin());
					goods.setGoodsLastUpdate(Timestamp.valueOf(dateTimeFormat
							.format(new Date())));
					goods.setGoodsName(goodsReal.getGoodsName());
					goods.setGoodsNotforskin(goodsReal.getGoodsNotforskin());
					goods.setGoodsNoticeforskin(goodsReal.getGoodsNoticeforskin());
					goods.setGoodsRank(0); // 排序值，暂无，以后需修改
					goods.setGoodsScore(goodsReal.getGoodsScore());
					goods.setGoodsSpecification(goodsReal.getGoodsSpecification());
					goods.setGoodsStatus((short) 3);
					goods.setSeriesId(0); // 系列id 暂时设置为0
					goods.setGoodsViewCount(goodsReal.getGoodsViewCount()); // 访问数量，初始值应该是0\
					goodsDAO.save(goods);

					/* 保存详情图对应关系 */
					int goodsId = goods.getGoodsId();
					List<String> fileNames = (List<String>) PHPSerializer
							.unserialize(goodsReal.getGoodsImages().getBytes()); // 反序列化goodsreal中的商品详情图到goodsImage中
					for (String fileName : fileNames) {
						GoodsImages goodsImages = new GoodsImages();
						goodsImages.setGoodsId(goodsId);
						/* 将图片的url存入自己的图片数据库，但是图片不保存，imgType设置为0，代表外站来源 */
						url = new URL(goodsReal.getGoodsThumb());
						uc = url.openConnection();
						is = uc.getInputStream();
						file = new File("D:/testImg");
						out = new FileOutputStream(file);
						i = 0;
						while ((i = is.read()) != -1) {
							out.write(i);
						}
						imageid = getImgAttribute(file, fileName, 0); // 只需要取到image不需要本地存储
						goodsImages.setImgId(imageid);
						goodsImagesDAO.save(goodsImages);
					}
					is.close();
					out.close();
				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	/*
	 * for Programmer
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#updateGoodsExperienceDetail()
	 */
	@Override
	public String deleteRepeatGoods() {
		List<Goods> goodsList=goodsDAO.findByRepeatGoods();
		for (Goods goods : goodsList) {
			int goodsId=goods.getGoodsId();
			
			/*删除对应功效*/
			List<GoodsEfficacy> goodsEfficacies=goodsEfficacyDAO.findByGoods(goods);
			for (GoodsEfficacy goodsEfficacy : goodsEfficacies) {
				goodsEfficacyDAO.delete(goodsEfficacy);
			}
			/*删除对应心得*/
			List<GoodsExperience> goodsExperiences=goodsExperienceDAO.findByGoodsId(goodsId);
			for (GoodsExperience goodsExperience : goodsExperiences) {
				goodsExperienceDAO.delete(goodsExperience);
			}
			/*删除goodsMap*/
			List<GoodsMap> goodsMaps=goodsMapDAO.findByGoodsId(goodsId);
			for (GoodsMap goodsMap : goodsMaps) {
				goodsMapDAO.delete(goodsMap);
			}
			/*删除对应goods_images*/
			List<GoodsImages> goodsImages=goodsImagesDAO.findByGoodsId(goodsId);
			for (GoodsImages goodsImage : goodsImages) {
				goodsImagesDAO.delete(goodsImage);
			}
			
			goodsDAO.delete(goods);
		}
		return null;
	}
}
