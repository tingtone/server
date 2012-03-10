package main.com.yourantao.aimeili.action;

import java.io.File;
import java.util.List;

import main.com.yourantao.aimeili.bean.Category;
import main.com.yourantao.aimeili.bean.CategoryDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.vo.CategoryView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class CategoryAction extends BaseAction implements CategoryInterface,Constant{
	
	private static final Logger log = LoggerFactory.getLogger(CategoryAction.class);
	private CategoryDAO categoryDAO;
	private ImageDAO imageDAO;
	private File category_image; // 上传文件1
	private String imageContentType;// 上传文件类型1
	private String imageFileName; // 上传文件名1
	
	private File newCategory_image; // 上传文件2
	private String newImageContentType;// 上传文件类型2
	private String newImageFileName; // 上传文件名2
	
	/**
	 * 通过分类下子分类
	 */
	@Override
	public String getSubCategories(){
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null)
			return null;

		List<Category> categories = categoryDAO.findByParentCatid(categoryId);

		for (Category category : categories) {
		}
		printArray(categories);

		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.CategoryInterface#insertCategory()
	 */
	@Override
	public String insertCategory() {
		// TODO Auto-generated method stub
		return null;
	}

/*
 * (non-Javadoc)
 * @see main.com.yourantao.aimeili.action.CategoryInterface#updateCateroty()
 */
	@Override
	public String updateORinsertCategory() {
		Integer category_id = getIntegerParameter(CATEGORY_ID);

		String updateType = getReqeust().getParameter("submit");
		if (updateType.equals("添加")) {   //添加新分类
			Category category = new Category();
			for(int j=3;j>0;j--){
				if(getReqeust().getParameter("category"+j)!=null && !getReqeust().getParameter("category"+j).equals("0")){//第三层的分类值不为空，则将该分类加入到第四层中,以此类推
					category.setCatLayer((short)j);
					category.setParentCatid(getIntegerParameter("category"+j));
					break;
				}
				if(j==1){
					return ERROR;    // 大类中没有东西，则返回错误
				}
			}
			
			category.setCategoryDescription(getReqeust().getParameter("newcategory_description"));
			category.setCategoryName(getReqeust().getParameter("newcategory_name"));
			category.setCategoryRank((long)0);         //分类的排序待定！！
			if (newImageFileName != null && !newImageFileName.equals("")) { // 上传图片，并存储
				String FileName = MD5.md5(newImageFileName)+ getExtention(newImageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE) + FileName);
				int imageid = getImgAttribute(newCategory_image, FileName);
				category.setCategoryImageId(imageid);
				copy(newCategory_image, imageFile);
			}
			categoryDAO.save(category);
			return SUCCESS;
		}  
		else if (updateType.equals("更新")) { // 需要对每个进行更新
			Category category = categoryDAO.findById(category_id);
			if (imageFileName != null && !imageFileName.equals("")) { // 上传大图，并存储
				// String FileName =imageFileName+ new Date().getTime() +
				// getExtention(imageFileName);
				String FileName = MD5.md5(imageFileName)+ getExtention(imageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE) + FileName);
				int imageid = getImgAttribute(category_image, FileName);
				category.setCategoryImageId(imageid);
				copy(category_image, imageFile);
			}
			category.setCategoryDescription(getReqeust().getParameter("category_description"));
			category.setCategoryName(getReqeust().getParameter("category_name"));
			return SUCCESS;
		} 
		return ERROR;
	}
	
	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.CategoryInterface#getCategoryDetail()
	 */
	@Override
	public String getCategoryDetail() {
		CategoryView result=new CategoryView();
		Integer category_id=getIntegerParameter(CATEGORY_ID);
		if(category_id!=0){
			Category category= categoryDAO.findById(category_id);
			if(category.getCategoryImageId()!=0)  //0是默认值，即无对应图片，需要添加
			{
				Image image = imageDAO.findById(category.getCategoryImageId());
				result.setCategoryImageName(Config.get(Config.BASE_IMAGEURL)+image.getImgUrl());
			}
			
			result.setCategoryDescription(category.getCategoryDescription());
			result.setCategoryId(category.getCategoryId());
			result.setCategoryName(category.getCategoryName());
			printObject(result);
		}
		return null;
	}
	
	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
	public ImageDAO getImageDAO() {
		return imageDAO;
	}
	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	public File getCategory_image() {
		return category_image;
	}

	public void setCategory_image(File categoryImage) {
		category_image = categoryImage;
	}

	public String getCategory_imageContentType() {
		return imageContentType;
	}

	public void setCategory_imageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getCategory_imageFileName() {
		return imageFileName;
	}

	public void setCategory_imageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public File getNewCategory_image() {
		return newCategory_image;
	}

	public void setNewCategory_image(File newCategoryImage) {
		newCategory_image = newCategoryImage;
	}

	public String getNewCategory_imageContentType() {
		return newImageContentType;
	}

	public void setNewCategory_imageContentType(String newImageContentType) {
		this.newImageContentType = newImageContentType;
	}

	public String getNewCategory_imageFileName() {
		return newImageFileName;
	}

	public void setNewCategory_imageFileName(String newImageFileName) {
		this.newImageFileName = newImageFileName;
	}
}
