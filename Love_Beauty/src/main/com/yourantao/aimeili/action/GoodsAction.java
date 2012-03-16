package main.com.yourantao.aimeili.action;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.bean.CategoryDAO;
import main.com.yourantao.aimeili.bean.Goods;
import main.com.yourantao.aimeili.bean.GoodsComment;
import main.com.yourantao.aimeili.bean.GoodsCommentDAO;
import main.com.yourantao.aimeili.bean.GoodsDAO;
import main.com.yourantao.aimeili.bean.GoodsImages;
import main.com.yourantao.aimeili.bean.GoodsImagesDAO;
import main.com.yourantao.aimeili.bean.GoodsMap;
import main.com.yourantao.aimeili.bean.GoodsMapDAO;
import main.com.yourantao.aimeili.bean.GoodsReal;
import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.Series;
import main.com.yourantao.aimeili.bean.SeriesDAO;
import main.com.yourantao.aimeili.bean.User;
import main.com.yourantao.aimeili.bean.UserDAO;
import main.com.yourantao.aimeili.bean.UserFavorite;
import main.com.yourantao.aimeili.bean.UserFavoriteDAO;
import main.com.yourantao.aimeili.bean.UserLogin;
import main.com.yourantao.aimeili.bean.UserLoginDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.util.RankGenerator;
import main.com.yourantao.aimeili.util.TransTool;
import main.com.yourantao.aimeili.vo.GoodsImageView;
import main.com.yourantao.aimeili.vo.GoodsSkinView;
import main.com.yourantao.aimeili.vo.GoodsView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import sun.security.action.GetIntegerAction;

@SuppressWarnings("serial")
public class GoodsAction extends BaseAction implements GoodsInterface,Constant{
	private static final Logger log = LoggerFactory.getLogger(GoodsAction.class);
	
	private File newGoods_thumb; // 上传文件1
	private File newGoods_image; // 上传文件1
	private String imageContentType;// 上传文件类型2
	private String imageFileName; // 上传文件名2
	private String thumbContentType;// 上传文件类型1
	private String thumbFileName; // 上传文件名1
	
	
	private GoodsDAO goodsDAO;
	private CategoryDAO categoryDAO;
	private ImageDAO imageDAO;
	private RankGenerator rankGenerator;
	private BrandDAO brandDAO;
	private SeriesDAO seriesDAO;
	private GoodsImagesDAO goodsImagesDAO;
	private GoodsMapDAO goodsMapDAO;
	private GoodsRealDAO goodsRealDAO;
	private UserDAO userDAO;
	private UserFavoriteDAO userFavoriteDAO;
	private UserLoginDAO userLoginDAO;
	private GoodsCommentDAO goodsCommentDAO;
	
	
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

	/* for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListByFav()
	 */
	@Override
	public String getGoodsListByFav() {
		String msg="";
		String uuid=getReqeust().getParameter("uuid");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			outputString(msg);
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		Integer uid=userLogin.get(0).getUserId();
		if(uid==null || uid==0){
			msg="{'msg':'设备号未登记'}";
			outputString(msg);
			return null;
		}
		List<UserFavorite> userfavlist=userFavoriteDAO.findByUserId(uid);
		if(userfavlist.size()==0){   //没有收藏
			msg="{'msg':'没有收藏商品'}";
			outputString(msg);
			return null;
		}else{                //有收藏，取得相应商品
			List<GoodsView> result=new ArrayList<GoodsView>();
				
			for (UserFavorite userFavorite : userfavlist) {
				Goods goods=goodsDAO.findById(userFavorite.getRelatedId());
				GoodsView goodsView=new GoodsView();
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
					goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL) + thumb.getImgUrl());
				} else {
					goodsView.setGoodsThumb("");
				}
				if (goods.getBrandId() != null) {
					Brand brand=brandDAO.findById(goods.getBrandId());
					goodsView.setGoodsBrandName(brand.getBrandName());
				} 
				if (goods.getSeriesId() != null) {  
					if(goods.getSeriesId()==0){    //对应系列号为0 代表没有对应系列
						goodsView.setGoodsSeriesName("无");
					}else{
						Series series=seriesDAO.findById(goods.getSeriesId());
						goodsView.setGoodsSeriesName(series.getSeriesName());
					}
				}
				result.add(goodsView);
			}
			printArray(result);
			return null;
		}
	}
	
	
	
	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsList()
	 */
	@Override
	public String getGoodsListByCat() {
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null)
			return null;
		List<Goods> goodsList = goodsDAO.findByCategoryId(categoryId);
		List<GoodsView> result=new ArrayList<GoodsView>();
		for (Goods goods : goodsList) {
			GoodsView goodsView=new GoodsView();
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
				goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL) + thumb.getImgUrl());
			} else {
				goodsView.setGoodsThumb("");
			}
			if (goods.getBrandId() != null) {
				Brand brand=brandDAO.findById(goods.getBrandId());
				goodsView.setGoodsBrandName(brand.getBrandName());
			} 
			if (goods.getSeriesId() != null) {  
				if(goods.getSeriesId()==0){    //对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				}else{
					Series series=seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			result.add(goodsView);
		}
		printArray(result);
		return null;
	}

	/**
	 * see interface
	 */
	@Override
	public String updateGoods() {
		/*用spring新加的bean后，dao会自动持久化，不用在重新初始化*/
//		ApplicationContext ac = Config.getACInstant();
//		TopicGoodsDAO topicGoodsDAO = TopicGoodsDAO
//				.getFromApplicationContext(ac);
//		TopicDAO topicDAO = TopicDAO.getFromApplicationContext(ac);
		Integer goodsId = getIntegerParameter(GOODS_ID);
		Goods goods=goodsDAO.findById(goodsId);
		String goodsName = getReqeust().getParameter("goodsName");
		String goodsScore = getReqeust().getParameter("goodsScore");
		String goodsForskin = getReqeust().getParameter("goodsForskin");
		String goodsNotforskin = getReqeust().getParameter("goodsNotforskin");
		String goodsNoticeforskin = getReqeust().getParameter("goodsNoticeforskin");
		String goodsAge = getReqeust().getParameter("goodsAge");
		String goodsDescription = getReqeust().getParameter("goodsDescription");
		String goodsSpecification = getReqeust().getParameter("goodsSpecification");
		goods.setGoodsId(goodsId);
		String updateType = getReqeust().getParameter("submit");
		if (updateType.equals("更新")) { // 需要对每个进行更新
			if (thumbFileName != null && !thumbFileName.equals("")) { // 上传缩略图，并存储
				String FileName = MD5.md5(thumbFileName)
						+ getExtention(thumbFileName);
				File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE) + FileName);
				int imageid = getImgAttribute(newGoods_thumb, FileName);
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
			goods.setGoodsLastUpdate(Timestamp.valueOf(dateFormat.format(new Date())));  //更新时间设置为当前更新时间
			goods.setGoodsSpecification(goodsSpecification);
			goods.setGoodsStatus((short)6);   //6表示已经审核
			goodsDAO.merge(goods);
			return SUCCESS;
		} else if (updateType.equals("删除")) { // 删除
			goodsDAO.delete(goodsDAO.findById(goodsId));
			return "back_goods";
		} else if (updateType.equals("对应真实商品")) { // 查看对应商品
			return "real_goods";
		}else if(updateType.equals("商品细节图")){  //商品细节图的增删改查
			return "goods_images";
		}
		return ERROR;
	}

	/* for Editor
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#insertGoods()
	 */
	@Override
	public String insertGoods() {
		Goods goods=new Goods();
		Integer categoryId=0;
		for(int j=4;j>0;j--){
			if(getReqeust().getParameter("category"+j)!=null && !getReqeust().getParameter("category"+j).equals("0")){
				categoryId=getIntegerParameter("category"+j);
				break;
			}
		}
		goods.setBrandId(getIntegerParameter(BRAND_ID));
		goods.setSeriesId(getIntegerParameter(SERIES_ID));
		goods.setCategoryId(categoryId);
		goods.setGoodsAddTime(Timestamp.valueOf(dateFormat.format(new Date())));
		goods.setGoodsAge(getReqeust().getParameter("goodsAge"));
		goods.setGoodsBuyCount(0);
		goods.setGoodsViewCount(0);
		goods.setGoodsDescription(getReqeust().getParameter("goodsDescription"));
		goods.setGoodsForskin(getReqeust().getParameter("goodsForskin"));
		goods.setGoodsLastUpdate(Timestamp.valueOf(dateFormat.format(new Date())));
		goods.setGoodsName(getReqeust().getParameter("goodsName"));
		goods.setGoodsNotforskin(getReqeust().getParameter("goodsNotforskin"));
		goods.setGoodsNoticeforskin(getReqeust().getParameter("goodsNoticeforskin"));
		goods.setGoodsRank(0);   //暂时初始化为0，商品的排序规则较复杂，以后再做
		if(getReqeust().getParameter("goodsScore")==null || getReqeust().getParameter("goodsScore").equals("")){
			goods.setGoodsScore((float)0);
		}else{
			goods.setGoodsScore(Float.valueOf(getReqeust().getParameter("goodsScore")));
		}
		
		goods.setGoodsSpecification(getReqeust().getParameter("goodsSpecification"));
		goods.setGoodsStatus((short)3);
		
		
		if (thumbFileName != null && !thumbFileName.equals("")) { // 上传缩略图，并存储
			// String FileName =thumbFileName+ new Date().getTime() +
			// getExtention(thumbFileName);
			String FileName = MD5.md5(thumbFileName)
					+ getExtention(thumbFileName); // MD5加密;
			File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE) + FileName);
			int imageid = getImgAttribute(newGoods_thumb, FileName);
			goods.setGoodsThumbId(imageid);
			copy(newGoods_thumb, thumbFile);
		}else{
			goods.setGoodsThumbId(0);    //非空字段默认值为0
		}
		
		goodsDAO.save(goods);

		return SUCCESS;
	}

	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsImage()
	 */
	@Override
	public String getGoodsImages() {
		Integer goods_id = getIntegerParameter(GOODS_ID);
		if (goods_id == null)
			return null;
		List<GoodsImages> goodsimages = goodsImagesDAO.findByGoodsId(goods_id);
		List<GoodsImageView> result=new ArrayList<GoodsImageView>();
		for (GoodsImages goodsImages : goodsimages) {
			Image image=imageDAO.findById(goodsImages.getImgId());
			GoodsImageView goodsImageView=new GoodsImageView();
			goodsImageView.setId(goodsImages.getId());
			goodsImageView.setImageId(image.getImgId());
			goodsImageView.setImageURL(Config.get(Config.BASE_IMAGEURL)+image.getImgUrl());
			result.add(goodsImageView);
		}
		printArray(result);

		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#GoodsImages()
	 */
	@Override
	public String updateGoodsImages() {
		String updateType = getReqeust().getParameter("submit");
		if (updateType.equals("更新")) { // 更新图片
			GoodsImages goodsImages=goodsImagesDAO.findById(getIntegerParameter("id"));
			if (imageFileName != null && !imageFileName.equals("")) { // 上传缩略图，并存储
				String FileName = MD5.md5(imageFileName)+ getExtention(imageFileName);
				File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE) + FileName);
				int imageid = getImgAttribute(newGoods_image, FileName);
				goodsImages.setImgId(imageid);    //只更新对应号码就行
				copy(newGoods_image, thumbFile);
			}
			return SUCCESS;
		}else if(updateType.equals("删除")){
			GoodsImages goodsImages=goodsImagesDAO.findById(getIntegerParameter("id"));
			goodsImagesDAO.delete(goodsImages);
			return SUCCESS;
		}
		else if(updateType.equals("新增对应图片")){
			GoodsImages goodsImages=new GoodsImages();
			goodsImages.setGoodsId(getIntegerParameter(GOODS_ID));
			if (imageFileName != null && !imageFileName.equals("")) { // 上传缩略图，并存储
				String FileName = MD5.md5(imageFileName)+ getExtention(imageFileName);
				File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE) + FileName);
				int imageid = getImgAttribute(newGoods_image, FileName);
				goodsImages.setImgId(imageid);    //只更新对应号码就行
				copy(newGoods_image, thumbFile);
			}
			goodsImagesDAO.save(goodsImages);
			return SUCCESS;
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsMapList()
	 */
	@Override
	public String getGoodsMapList() {
		int goodsId = getIntegerParameter(GOODS_ID);
		List<GoodsMap> GoodsMapList = goodsMapDAO.findByGoodsId(goodsId);
		List<GoodsReal> result=new ArrayList<GoodsReal>();
		for (GoodsMap goodsMap : GoodsMapList) {
			GoodsReal goodsReal=goodsRealDAO.findById(goodsMap.getGoodsRealId());
			result.add(goodsReal);
		}
		printArray(result);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#GetRealGoodsListBySeries()
	 */
	@Override
	public String GetRealGoodsListBySeries() {
		List<GoodsReal> result=null;
		if(getReqeust().getParameter("sid")!=null &&!getReqeust().getParameter("sid").equals("null") &&!getReqeust().getParameter("sid").equals("0")){  //如果有系列号，按系列号取商品数据
			int sid=getIntegerParameter("sid");
			Series series=seriesDAO.findById(sid);
			result=goodsRealDAO.findBySeriesName(series.getSeriesName());
		}else{   //按品牌取商品
			int bid=getIntegerParameter("bid");
			Brand brand=brandDAO.findById(bid);
			result=goodsRealDAO.findRealGoodsByBrandName(brand.getBrandName());
		}
		printArray(result);
		return null;
	}

	/*for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListBySkin()
	 */
	@Override
	public String getGoodsListBySkin() {
		String msg="";
		String skin=getReqeust().getParameter("skin");
		if(skin==null){
			msg="{'msg':'没有肤质结果'}";
			return null;
		}
		String skinName=TransTool.transSkin(skin);
		List<GoodsView> skinResult=new ArrayList<GoodsView>();
		List<GoodsView> notSkinResult=new ArrayList<GoodsView>();
		List<GoodsView> noticeSkinResult=new ArrayList<GoodsView>();
		List<Goods> goodslist=goodsDAO.findBySkin(skinName); //获取适合肤质，不适合，需要注意的
		for (Goods goods : goodslist) {
			GoodsView goodsView=new GoodsView();
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
				goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL) + thumb.getImgUrl());
			} else {
				goodsView.setGoodsThumb("");
			}
			if (goods.getBrandId() != null) {
				Brand brand=brandDAO.findById(goods.getBrandId());
				goodsView.setGoodsBrandName(brand.getBrandName());
			} 
			if (goods.getSeriesId() != null) {  
				if(goods.getSeriesId()==0){    //对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				}else{
					Series series=seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			if(goods.getGoodsForskin().contains(skinName)){ //适合肤质
				skinResult.add(goodsView);
			}
			if(goods.getGoodsNotforskin().contains(skinName)){
				notSkinResult.add(goodsView);
			}
			if(goods.getGoodsNoticeforskin().contains(skinName)){
				noticeSkinResult.add(goodsView);
			}
		}
		GoodsSkinView result=new GoodsSkinView();
		result.setSkinResult(skinResult);
		result.setNotSkinResult(notSkinResult);
		result.setNoticeSkinResult(noticeSkinResult);
		printObject(result);
		return null;
	}

	/*
	 * forClient and Editor
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getRealGoodsComment()
	 */
	@Override
	public String getRealGoodsComment() {
		int grid=getIntegerParameter(GOODS_REAL_ID);
		List<GoodsComment> goodsComments=goodsCommentDAO.findByGoodsRealId(grid);
		printArray(goodsComments);
		return null;
	}

	/*
	 * for Client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListBySkinAndCat()
	 */
	@Override
	public String getGoodsListBySkinAndCat() {
		String msg="";
		String skin=getReqeust().getParameter("skin");
		if(skin==null){
			msg="{'msg':'没有肤质结果'}";
			outputString(msg);
			return null;
		}
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null){
			msg="{'msg':'没有分类号'}";
			outputString(msg);
			return null;
		}
		String skinName=TransTool.transSkin(skin);
		List<GoodsView> skinResult=new ArrayList<GoodsView>();
		List<GoodsView> notSkinResult=new ArrayList<GoodsView>();
		List<GoodsView> noticeSkinResult=new ArrayList<GoodsView>();
		List<Goods> goodslist=goodsDAO.findBySkinAndCat(skinName,categoryId); //获取适合肤质，不适合，需要注意的
		if(goodslist.size()==0){
			msg="{'msg':'无商品'}";
			outputString(msg);
			return null;
		}
		
		for (Goods goods : goodslist) {
			GoodsView goodsView=new GoodsView();
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
				goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL) + thumb.getImgUrl());
			} else {
				goodsView.setGoodsThumb("");
			}
			if (goods.getBrandId() != null) {
				Brand brand=brandDAO.findById(goods.getBrandId());
				goodsView.setGoodsBrandName(brand.getBrandName());
			} 
			if (goods.getSeriesId() != null) {  
				if(goods.getSeriesId()==0){    //对应系列号为0 代表没有对应系列
					goodsView.setGoodsSeriesName("无");
				}else{
					Series series=seriesDAO.findById(goods.getSeriesId());
					goodsView.setGoodsSeriesName(series.getSeriesName());
				}
			}
			if(goods.getGoodsForskin().contains(skinName)){ //适合肤质
				skinResult.add(goodsView);
			}
			if(goods.getGoodsNotforskin().contains(skinName)){
				notSkinResult.add(goodsView);
			}
			if(goods.getGoodsNoticeforskin().contains(skinName)){
				noticeSkinResult.add(goodsView);
			}
		}
		GoodsSkinView result=new GoodsSkinView();
		result.setSkinResult(skinResult);
		result.setNotSkinResult(notSkinResult);
		result.setNoticeSkinResult(noticeSkinResult);
		printObject(result);
		return null;
	}
}
