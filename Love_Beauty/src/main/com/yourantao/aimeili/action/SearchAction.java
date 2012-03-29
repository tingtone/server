package main.com.yourantao.aimeili.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import main.com.yourantao.aimeili.bean.Search;
import main.com.yourantao.aimeili.bean.SearchDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.vo.SearchView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class SearchAction extends BaseAction implements 
		Constant, SearchInterface {
	private static final Logger log = LoggerFactory
			.getLogger(SearchAction.class);
	private SearchDAO searchDAO;

	private File search_image; // 上传文件1
	private String imageContentType;// 上传文件类型1
	private String imageFileName; // 上传文件名1

	private File newSearch_image; // 上传文件2
	private String newImageContentType;// 上传文件类型2
	private String newImageFileName; // 上传文件名2

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getImageDAO()
	 */
	public ImageDAO getImageDAO() {
		return imageDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#setImageDAO(main.com.yourantao.aimeili.bean.ImageDAO)
	 */
	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getSearchDAO()
	 */
	public SearchDAO getSearchDAO() {
		return searchDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#setSearchDAO(main.com.yourantao.aimeili.bean.SearchDAO)
	 */
	public void setSearchDAO(SearchDAO searchDAO) {
		this.searchDAO = searchDAO;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getSearch_image()
	 */
	public File getSearch_image() {
		return search_image;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#setSearch_image(java.io.File)
	 */
	public void setSearch_image(File searchImage) {
		search_image = searchImage;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getSearch_imageContentType()
	 */
	public String getSearch_imageContentType() {
		return imageContentType;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#setSearch_imageContentType(java.lang.String)
	 */
	public void setSearch_imageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getSearch_imageFileName()
	 */
	public String getSearch_imageFileName() {
		return imageFileName;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#setSearch_imageFileName(java.lang.String)
	 */
	public void setSearch_imageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getNewSearch_image()
	 */
	public File getNewSearch_image() {
		return newSearch_image;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#setNewSearch_image(java.io.File)
	 */
	public void setNewSearch_image(File newSearchImage) {
		newSearch_image = newSearchImage;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getNewSearch_imageContentType()
	 */
	public String getNewSearch_imageContentType() {
		return newImageContentType;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#setNewSearch_imageContentType(java.lang.String)
	 */
	public void setNewSearch_imageContentType(String newImageContentType) {
		this.newImageContentType = newImageContentType;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getNewSearch_imageFileName()
	 */
	public String getNewSearch_imageFileName() {
		return newImageFileName;
	}

	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.SearchInterface#setNewSearch_imageFileName(java.lang.String)
	 */
	public void setNewSearch_imageFileName(String newImageFileName) {
		this.newImageFileName = newImageFileName;
	}

	/*
	 * for Client and Editor (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.SearchInterface#getSearch()
	 */
	@Override
	public String getSearch() {
		List<SearchView> searchViews = new ArrayList<SearchView>();
		List<Search> efficacies = searchDAO.findAll();
		for (Search search : efficacies) {
			SearchView searchView = new SearchView();
			searchView.setSearchId(search.getSearchId());
			searchView.setSearchKeyword(search.getSearchKeyword());
			if (search.getSearchImageId() != 0) // 图片非空
			{
				Image image = imageDAO.findById(search.getSearchImageId());
				searchView.setSearchImageUrl(Config
						.get(Config.BASE_IMAGEURL)
						+ image.getImgUrl());
			}
			searchViews.add(searchView);
		}
		printArray(searchViews);
		return null;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.SearchInterface#updateORinsertSearch
	 * ()
	 */
	@Override
	public String updateORinsertSearch() {
		Integer search_id = getIntegerParameter("search_id");
		String updateType = getRequest().getParameter("submit");
		if (updateType.equals("添加")) { // 添加新分类
			Search search = new Search();
			search.setSearchKeyword(getRequest().getParameter(
					"newSearch_name"));
			search.setSearchRank((long) 0); // 分类的排序待定！！
			if (newImageFileName != null && !newImageFileName.equals("")) { // 上传图片，并存储
				String FileName = MD5.md5(newImageFileName)
						+ getExtention(newImageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(newSearch_image, FileName,1);
				search.setSearchImageId(imageid);
				copy(newSearch_image, imageFile);
			}
			searchDAO.save(search);
			return SUCCESS;
		} else if (updateType.equals("更新")) { // 需要对每个进行更新
			Search search = searchDAO.findById(search_id);
			if (imageFileName != null && !imageFileName.equals("")) { // 上传大图，并存储
				// String FileName =imageFileName+ new Date().getTime() +
				// getExtention(imageFileName);
				String FileName = MD5.md5(imageFileName)
						+ getExtention(imageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(search_image, FileName,1);
				search.setSearchImageId(imageid);
				copy(search_image, imageFile);
			}
			search.setSearchKeyword(getRequest().getParameter("search_keyword"));
			return SUCCESS;
		}
		return ERROR;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.SearchInterface#getSearchDetail()
	 */
	@Override
	public String getSearchDetail() {
		int search_id = getIntegerParameter("search_id");
		Search search = searchDAO.findById(search_id);
		SearchView searchView = new SearchView();
		searchView.setSearchId(search.getSearchId());
		searchView.setSearchKeyword(search.getSearchKeyword());
		if (search.getSearchImageId() != 0) // 图片非空
		{
			Image image = imageDAO.findById(search.getSearchImageId());
			searchView.setSearchImageUrl(Config.get(Config.BASE_IMAGEURL)
					+ image.getImgUrl());
		}

		printObject(searchView);
		return null;
	}
}
