package main.com.yourantao.aimeili.action;

import java.io.File;
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

	/* for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListByFav()
	 */
	@Override
	public String getGoodsListByFav() {
		String msg="";
		String uuid=getRequest().getParameter("uuid");
		if(uuid==null){
			msg="{'msg':'没有设备号'}";
			printString(msg);
			return null;
		}
		List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
		Integer uid=userLogin.get(0).getUserId();
		if(uid==null || uid==0){
			msg="{'msg':'设备号未登记'}";
			printString(msg);
			return null;
		}
		List<UserFavorite> userfavlist=userFavoriteDAO.findByUserId(uid);
		if(userfavlist.size()==0){   //没有收藏
			msg="{'msg':'没有收藏商品'}";
			printString(msg);
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
				List<GoodsEfficacy> goodsEfficacyList=goodsEfficacyDAO.findByGoodsId(goods.getGoodsId());  //功效标签
				String efficacyName="";
				if (goodsEfficacyList.isEmpty()){
				}else{
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy.getEfficacyId());
						efficacyName+=efficacy.getEfficacyName()+"  ";
					}
				goodsView.setGoodsEfficacy(efficacyName);
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
		if (categoryId == null){
			printString("{'msg':'没有分类号'}");
			return null;
		}
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
			List<GoodsEfficacy> goodsEfficacyList=goodsEfficacyDAO.findByGoodsId(goods.getGoodsId());  //功效标签
			String efficacyName="";
			if (goodsEfficacyList.isEmpty()){
			}else{
				for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
					Efficacy efficacy = efficacyDAO.findById(goodsEfficacy.getEfficacyId());
					efficacyName+=efficacy.getEfficacyName()+"  ";
				}
			goodsView.setGoodsEfficacy(efficacyName);
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
		String goodsName = getRequest().getParameter("goodsName");
		String goodsScore = getRequest().getParameter("goodsScore");
		String goodsForskin = getRequest().getParameter("goodsForskin");
		String goodsNotforskin = getRequest().getParameter("goodsNotforskin");
		String goodsNoticeforskin = getRequest().getParameter("goodsNoticeforskin");
		String goodsAge = getRequest().getParameter("goodsAge");
		String goodsDescription = getRequest().getParameter("goodsDescription");
		String goodsSpecification = getRequest().getParameter("goodsSpecification");
		goods.setGoodsId(goodsId);
		String updateType = getRequest().getParameter("submit");
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
			if(getRequest().getParameter("category"+j)!=null && !getRequest().getParameter("category"+j).equals("0")){
				categoryId=getIntegerParameter("category"+j);
				break;
			}
		}
		goods.setBrandId(getIntegerParameter(BRAND_ID));
		goods.setSeriesId(getIntegerParameter(SERIES_ID));
		goods.setCategoryId(categoryId);
		goods.setGoodsAddTime(Timestamp.valueOf(dateFormat.format(new Date())));
		goods.setGoodsAge(getRequest().getParameter("goodsAge"));
		goods.setGoodsBuyCount(0);
		goods.setGoodsViewCount(0);
		goods.setGoodsDescription(getRequest().getParameter("goodsDescription"));
		goods.setGoodsForskin(getRequest().getParameter("goodsForskin"));
		goods.setGoodsLastUpdate(Timestamp.valueOf(dateFormat.format(new Date())));
		goods.setGoodsName(getRequest().getParameter("goodsName"));
		goods.setGoodsNotforskin(getRequest().getParameter("goodsNotforskin"));
		goods.setGoodsNoticeforskin(getRequest().getParameter("goodsNoticeforskin"));
		goods.setGoodsRank(0);   //暂时初始化为0，商品的排序规则较复杂，以后再做
		if(getRequest().getParameter("goodsScore")==null || getRequest().getParameter("goodsScore").equals("")){
			goods.setGoodsScore((float)0);
		}else{
			goods.setGoodsScore(Float.valueOf(getRequest().getParameter("goodsScore")));
		}
		
		goods.setGoodsSpecification(getRequest().getParameter("goodsSpecification"));
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
		String updateType = getRequest().getParameter("submit");
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
		if(getRequest().getParameter("sid")!=null &&!getRequest().getParameter("sid").equals("null") &&!getRequest().getParameter("sid").equals("0")){  //如果有系列号，按系列号取商品数据
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
		String skin=getRequest().getParameter("skin").substring(0,1);
		String isSensitive =getRequest().getParameter("skin").substring(1,2);
		if(skin==null || skin.equals("n")){
			msg="{'msg':'没有肤质结果'}";
			return null;
		}
		String skinName=TransTool.transSkinIdToName(skin);
		List<GoodsView> skinResult=new ArrayList<GoodsView>();
		List<GoodsView> notSkinResult=new ArrayList<GoodsView>();
		List<GoodsView> noticeSkinResult=new ArrayList<GoodsView>();
		List<Goods> goodslist=null;
		if(isSensitive.equals("0")){    //如果是不敏感的
			 goodslist=goodsDAO.findBySkin(skinName); //获取适合肤质，不适合，需要注意的
			 if(goodslist.isEmpty()){
					msg="{'msg':'无商品'}";
					printString(msg);
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
					List<GoodsEfficacy> goodsEfficacyList=goodsEfficacyDAO.findByGoodsId(goods.getGoodsId());  //功效标签
					String efficacyName="";
					if (goodsEfficacyList.isEmpty()){
					}else{
						for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
							Efficacy efficacy = efficacyDAO.findById(goodsEfficacy.getEfficacyId());
							efficacyName+=efficacy.getEfficacyName()+"  ";
						}
					goodsView.setGoodsEfficacy(efficacyName);
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
		}else{  //敏感性肌肤，则和前4选一是且的关系
			 goodslist=goodsDAO.findBySkinSensitive(skinName); //获取适合肤质，不适合，需要注意的
			 if(goodslist.isEmpty()){
					msg="{'msg':'无商品'}";
					printString(msg);
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
					List<GoodsEfficacy> goodsEfficacyList=goodsEfficacyDAO.findByGoodsId(goods.getGoodsId());  //功效标签
					String efficacyName="";
					if (goodsEfficacyList.isEmpty()){
					}else{
						for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
							Efficacy efficacy = efficacyDAO.findById(goodsEfficacy.getEfficacyId());
							efficacyName+=efficacy.getEfficacyName()+"  ";
						}
					goodsView.setGoodsEfficacy(efficacyName);
					}
					if(goods.getGoodsForskin().contains(skinName) && goods.getGoodsForskin().contains("敏感性")){ //适合肤质
						skinResult.add(goodsView);
					}
					if(goods.getGoodsNotforskin().contains(skinName)&& goods.getGoodsNotforskin().contains("敏感性")){
						notSkinResult.add(goodsView);
					}
					if(goods.getGoodsNoticeforskin().contains(skinName)&& goods.getGoodsNoticeforskin().contains("敏感性")){
						noticeSkinResult.add(goodsView);
					}
				}
		}
		if(goodslist.isEmpty()){
			msg="{'msg':'无商品'}";
			printString(msg);
			return null;
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
		String skin=getRequest().getParameter("skin").substring(0,1);
		String isSensitive =getRequest().getParameter("skin").substring(1,2);
		if(skin==null || skin.equals("n")){
			msg="{'msg':'没有肤质结果'}";
			return null;
		}
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null){
			msg="{'msg':'没有分类号'}";
			printString(msg);
			return null;
		}
		String skinName=TransTool.transSkinIdToName(skin);
		List<GoodsView> skinResult=new ArrayList<GoodsView>();
		List<GoodsView> notSkinResult=new ArrayList<GoodsView>();
		List<GoodsView> noticeSkinResult=new ArrayList<GoodsView>();
		List<Goods> goodslist=null;
		if(isSensitive.equals("0")){    //如果是不敏感的
			goodslist=goodsDAO.findBySkinAndCat(skinName,categoryId); //获取适合肤质，不适合，需要注意的
			if(goodslist.isEmpty()){
				msg="{'msg':'无商品'}";
				printString(msg);
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
				List<GoodsEfficacy> goodsEfficacyList=goodsEfficacyDAO.findByGoodsId(goods.getGoodsId());  //功效标签
				String efficacyName="";
				if (goodsEfficacyList.isEmpty()){
				}else{
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy.getEfficacyId());
						efficacyName+=efficacy.getEfficacyName()+"  ";
					}
				goodsView.setGoodsEfficacy(efficacyName);
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
		}else{   //是敏感的
			goodslist=goodsDAO.findBySkinAndCatSensitive(skinName,categoryId); //获取适合肤质，不适合，需要注意的(敏感性肌肤的)
			if(goodslist.isEmpty()){
				msg="{'msg':'无商品'}";
				printString(msg);
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
				List<GoodsEfficacy> goodsEfficacyList=goodsEfficacyDAO.findByGoodsId(goods.getGoodsId());  //功效标签
				String efficacyName="";
				if (goodsEfficacyList.isEmpty()){
				}else{
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy.getEfficacyId());
						efficacyName+=efficacy.getEfficacyName()+"  ";
					}
				goodsView.setGoodsEfficacy(efficacyName);
				}
				if(goods.getGoodsForskin().contains(skinName) && goods.getGoodsForskin().contains("敏感性")){ //适合肤质
					skinResult.add(goodsView);
				}
				if(goods.getGoodsNotforskin().contains(skinName)&& goods.getGoodsNotforskin().contains("敏感性")){
					notSkinResult.add(goodsView);
				}
				if(goods.getGoodsNoticeforskin().contains(skinName)&& goods.getGoodsNoticeforskin().contains("敏感性")){
					noticeSkinResult.add(goodsView);
				}
			}
		}
			
		GoodsSkinView result=new GoodsSkinView();
		result.setSkinResult(skinResult);
		result.setNotSkinResult(notSkinResult);
		result.setNoticeSkinResult(noticeSkinResult);
		printObject(result);
		return null;
	}

	/* for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListBySearch()
	 */
	@Override
	public String getGoodsListBySearch() {
		String uuid=getStringParameter(UUID);
		String keyword=getStringParameter("kw");
		String[] keywords=keyword.split(",|\\.|/|\\\\|=|-(|)|\\*|%|@|\\~|\\+|<|>|$|&|。| |，|！|、");   //按分隔符分割为多个词
		if(keywords==null || keywords[0].equals("null")){
			printString("{'msg':'没有搜索关键词'}");
			return null;
		}
		List<GoodsView> goodsViews=new ArrayList<GoodsView>();    //返回的结果
		List<Integer> goodsId=new ArrayList<Integer>();		//返回结果的GID
		List<Integer> goodsId1=new ArrayList<Integer>(); 	//品牌结果
		List<Integer> goodsId2=new ArrayList<Integer>();	//分类结果
		List<Integer> goodsId3=new ArrayList<Integer>();	//功效结果
		String hqlSearch="";
		for(int i=0;i<keywords.length;i++){   //多个关键词
			hqlSearch +=brandDAO.BRAND_NAME+"= '"+ keywords[i]+"' or "+brandDAO.BRAND_ALIAS+"='"+keywords[i]+"'";
			if(i!=keywords.length-1){
				hqlSearch += " or ";
			}
		}
			List<Brand> brands=brandDAO.findByBrandNameOrBrandAlias(hqlSearch);  //根据品牌名或者别名查找先
			if(!brands.isEmpty()){ //搜索的关键词是品牌
					Brand brand =brands.get(0);   //其实做多只能匹配一个品牌名
					int bid=brand.getBrandId();
					List<Goods> goodsList=goodsDAO.findByBrandId(bid);
					for (Goods goods : goodsList) {
						goodsId1.add(goods.getGoodsId());
					}
			
			}
			hqlSearch="";
			for(int i=0;i<keywords.length;i++){   //多个关键词
				hqlSearch +="categoryName='"+ keywords[i]+"'";
				if(i!=keywords.length-1){
					hqlSearch += " or ";
				}
			}
			List<Category> categorys= categoryDAO.findByCategoryNames(hqlSearch);
			if(!categorys.isEmpty()){    //搜索的关键词是分类词
				Category category =categorys.get(0);   //其实做多只能匹配一个品牌名
				int cid=category.getCategoryId();
				List<Goods> goodsList=goodsDAO.findByCategoryId(cid);
				for (Goods goods : goodsList) {
						goodsId2.add(goods.getGoodsId());
				}
			}
			
			
			hqlSearch="";
			for(int i=0;i<keywords.length;i++){   //多个关键词
				hqlSearch +="efficacyName='"+ keywords[i]+"'";
				if(i!=keywords.length-1){
					hqlSearch += " or ";
				}
			}
			List<Efficacy> efficacies= efficacyDAO.findByEfficacyNames(hqlSearch);
			if(!efficacies.isEmpty()){   //搜索的关键词是功效
				Efficacy category =efficacies.get(0);   //其实做多只能匹配一个品牌名
				int eid=category.getEfficacyId();
				List<GoodsEfficacy> goodsList=goodsEfficacyDAO.findByEfficacyId(eid);
				for (GoodsEfficacy goodsEfficacy : goodsList) {
						goodsId3.add(goodsEfficacy.getGoods().getGoodsId());
				}
			}
		
		/*因为是且的关系，所以在goodsId2里面包含的才继续加到goodsId3中,如果在品牌和分类相关的搜索中都包含，则加入到goodsId3中*/
			 
			if(!goodsId1.isEmpty()){   //优先品牌查询
				for (Integer Id1 : goodsId1) {
				if((goodsId2.contains(Id1) || goodsId2.isEmpty())  
						&& (goodsId3.contains(Id1) || goodsId3.isEmpty())){  //分类和功效都包含（没有数据也算包含）
					goodsId.add(Id1);
					}
				
				}
			}
			else if(!goodsId2.isEmpty()){  //其次是分类查询
				for (Integer Id2 : goodsId2) {
					if( (goodsId3.contains(Id2) || goodsId3.isEmpty())){  //功效包含（没有数据也算包含）
						goodsId.add(Id2);
						}
					}
				
			}else if(!goodsId3.isEmpty())  //再次是功效查询
			{
				goodsId=goodsId3;
			}else{           //全无数据，则进行关键词查找
				hqlSearch="";
				for(int i=0;i<keywords.length;i++){   //多个关键词
					hqlSearch +="goodsName like '%"+ keywords[i]+"%'";
					if(i!=keywords.length-1){
						hqlSearch += " or ";
					}
				}
				List<Goods> goodsList=goodsDAO.findBySearchKeyword(hqlSearch);
				for (Goods goods : goodsList) {
					goodsId.add(goods.getGoodsId());
				}
			}
			
			if(goodsId.isEmpty()){   //无商品
				printString("{'msg':'没有搜索到商品'}");
				return null;
			}
			
			for (int id : goodsId) {   //将GID转换为goodsView输出
				Goods goods=goodsDAO.findById(id);
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
				List<GoodsEfficacy> goodsEfficacyList=goodsEfficacyDAO.findByGoodsId(goods.getGoodsId());  //功效标签
				String efficacyName="";
				if (goodsEfficacyList.isEmpty()){
				}else{
					for (GoodsEfficacy goodsEfficacy : goodsEfficacyList) {
						Efficacy efficacy = efficacyDAO.findById(goodsEfficacy.getEfficacyId());
						efficacyName+=efficacy.getEfficacyName()+"  ";
					}
				goodsView.setGoodsEfficacy(efficacyName);
				}
					goodsViews.add(goodsView);
			} 
			
		printArray(goodsViews); 
		return null;
	}

	/*
	 * for client
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.GoodsInterface#getGoodsListByEfficacy()
	 */
	@Override
	public String getGoodsListByEfficacy() {
		
		Integer eid=getIntegerParameter("eid");
		if(eid==null||eid==0){
			printString("{'msg':'没有输入功效号'}");
			return null;
		}
		Efficacy efficacy= efficacyDAO.findById(eid);
		if(efficacy==null){
			printString("{'msg':'没有找到功效'}");
			return null;
		}
		List<GoodsView> goodsViews=new ArrayList<GoodsView>();    //返回的结果
		List<GoodsEfficacy> goodsList=goodsEfficacyDAO.findByEfficacyId(eid);
		if(goodsList.isEmpty()){
			printString("{'msg':'没有商品'}");
			return null;
		}
		for (GoodsEfficacy goodsEfficacy : goodsList) {
			Goods goods=goodsEfficacy.getGoods();
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
			String efficacyName="";
			efficacyName+=efficacy.getEfficacyName()+"  ";
			goodsView.setGoodsEfficacy(efficacyName);
			goodsViews.add(goodsView);
		}
		printArray(goodsViews);
		return null;
	}

}
