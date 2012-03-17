package main.com.yourantao.aimeili.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.SeriesDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.vo.BrandView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 品牌数据操作
 * 
 * @author mac 创建时间： 2012-3-6 下午04:46:30 修改时间：2012-3-6 下午04:46:30 具体描述： TODO
 */
@SuppressWarnings("serial")
public class BrandAction extends BaseAction implements Constant, BrandInterface {

	private static final Logger log = LoggerFactory
			.getLogger(CategoryAction.class);
	private BrandDAO brandDAO;
	private SeriesDAO seriesDAO;

	private File brand_image; // 上传文件1
	private String imageContentType;// 上传文件类型1
	private String imageFileName; // 上传文件名1

	private File newBrand_image; // 上传文件2
	private String newImageContentType;// 上传文件类型2
	private String newImageFileName; // 上传文件名2
	
	
	public File getBrand_image() {
		return brand_image;
	}

	public void setBrand_image(File brandImage) {
		brand_image = brandImage;
	}

	public String getBrand_imageContentType() {
		return imageContentType;
	}

	public void setBrand_imageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getBrand_imageFileName() {
		return imageFileName;
	}

	public void setBrand_imageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public File getNewBrand_image() {
		return newBrand_image;
	}

	public void setNewBrand_image(File newBrandImage) {
		newBrand_image = newBrandImage;
	}

	public String getNewBrand_imageContentType() {
		return newImageContentType;
	}

	public void setNewBrand_imageContentType(String newImageContentType) {
		this.newImageContentType = newImageContentType;
	}

	public String getNewBrand_imageFileName() {
		return newImageFileName;
	}

	public void setNewBrand_imageFileName(String newImageFileName) {
		this.newImageFileName = newImageFileName;
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.BrandInterface#getBrands()
	 */
	@Override
	public String getBrands() {
		List<BrandView> brandViews=new ArrayList<BrandView>();
		List<Brand> brandList = brandDAO.findAll(); // 无条件全部获得
		for (Brand brand : brandList) {
			BrandView brandView = new BrandView();
			brandView.setBrandName(brand.getBrandName());
			brandView.setBrandAlias(brand.getBrandAlias());
			brandView.setBrandId(brand.getBrandId());
			
			
			if (brand.getBrandImageId()!= 0) // 图片非空
			{
				Image image = imageDAO.findById(brand.getBrandImageId());
				brandView.setBrandImageUrl(Config
						.get(Config.BASE_IMAGEURL)
						+ image.getImgUrl());
			}
			brandViews.add(brandView);
		}
		printArray(brandViews);
		return null;
	}

	/* for Editor
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.BrandInterface#getSeries()
	 */
	@Override
	public String getSeries() {
		Integer brandId=getIntegerParameter(BRAND_ID);
		List seriesList = seriesDAO.findByBrandId(brandId);
		printArray(seriesList);
		return null;
	}
	
	/*
	 * for Editor
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.BrandInterface#updateORinsertBrand()
	 */
	@Override
	public String updateORinsertBrand() {
		Integer brand_id = getIntegerParameter(BRAND_ID);
		String updateType = getReqeust().getParameter("submit");
		if (updateType.equals("添加")) { // 添加新分类
			Brand brand = new Brand();
			brand.setBrandName(getReqeust().getParameter("newBrand_name"));
			brand.setBrandAlias(getReqeust().getParameter("newBrand_alias"));
			brand.setBrandDescription(getReqeust().getParameter("newBrand_description"));
			brand.setBrandRank((long) 0); // 分类的排序待定！！
			if (newImageFileName != null && !newImageFileName.equals("")) { // 上传图片，并存储
				String FileName = MD5.md5(newImageFileName)
						+ getExtention(newImageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(newBrand_image, FileName);
				brand.setBrandImageId(imageid);
				copy(newBrand_image, imageFile);
			}
			brandDAO.save(brand);
			return SUCCESS;
		} else if (updateType.equals("更新")) { // 需要对每个进行更新
			Brand brand = brandDAO.findById(brand_id);
			if (imageFileName != null && !imageFileName.equals("")) { // 上传大图，并存储
				// String FileName =imageFileName+ new Date().getTime() +
				// getExtention(imageFileName);
				String FileName = MD5.md5(imageFileName)
						+ getExtention(imageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(brand_image, FileName);
				brand.setBrandImageId(imageid);
				copy(brand_image, imageFile);
			}
			brand.setBrandDescription(getReqeust().getParameter("brand_description"));
			brand.setBrandName(getReqeust().getParameter("brand_name"));
			brand.setBrandAlias(getReqeust().getParameter("brand_alias"));
			return SUCCESS;
		}
		return ERROR;
	}
	
	/*
	 * forEditor
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.BrandInterface#getBrandDetail()
	 */
	@Override
	public String getBrandDetail() {
		int bid = getIntegerParameter(BRAND_ID);
		Brand brand = brandDAO.findById(bid);
		BrandView brandView = new BrandView();
		brandView.setBrandId(brand.getBrandId());
		brandView.setBrandAlias(brand.getBrandAlias());
		brandView.setBrandName(brand.getBrandName());
		if (brand.getBrandImageId() != 0) // 图片非空
		{
			Image image = imageDAO.findById(brand.getBrandImageId());
			brandView.setBrandImageUrl(Config.get(Config.BASE_IMAGEURL)
					+ image.getImgUrl());
		}
		printObject(brandView);
		return null;
	}
	
	// spring

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

	public ImageDAO getImageDAO() {
		return imageDAO;
	}

	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

}
