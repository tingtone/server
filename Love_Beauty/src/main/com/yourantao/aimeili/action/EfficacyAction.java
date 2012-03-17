package main.com.yourantao.aimeili.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import main.com.yourantao.aimeili.bean.Category;
import main.com.yourantao.aimeili.bean.Efficacy;
import main.com.yourantao.aimeili.bean.EfficacyDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.vo.EfficacyView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class EfficacyAction extends BaseAction implements EfficacyInterface,
		Constant {
	private static final Logger log = LoggerFactory
			.getLogger(EfficacyAction.class);
	private EfficacyDAO efficacyDAO;
	private ImageDAO imageDAO;
	private File efficacy_image; // 上传文件1
	private String imageContentType;// 上传文件类型1
	private String imageFileName; // 上传文件名1

	private File newEfficacy_image; // 上传文件2
	private String newImageContentType;// 上传文件类型2
	private String newImageFileName; // 上传文件名2

	public ImageDAO getImageDAO() {
		return imageDAO;
	}

	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	public EfficacyDAO getEfficacyDAO() {
		return efficacyDAO;
	}

	public void setEfficacyDAO(EfficacyDAO efficacyDAO) {
		this.efficacyDAO = efficacyDAO;
	}

	public File getEfficacy_image() {
		return efficacy_image;
	}

	public void setEfficacy_image(File efficacyImage) {
		efficacy_image = efficacyImage;
	}

	public String getEfficacy_imageContentType() {
		return imageContentType;
	}

	public void setEfficacy_imageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getEfficacy_imageFileName() {
		return imageFileName;
	}

	public void setEfficacy_imageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public File getNewEfficacy_image() {
		return newEfficacy_image;
	}

	public void setNewEfficacy_image(File newEfficacyImage) {
		newEfficacy_image = newEfficacyImage;
	}

	public String getNewEfficacy_imageContentType() {
		return newImageContentType;
	}

	public void setNewEfficacy_imageContentType(String newImageContentType) {
		this.newImageContentType = newImageContentType;
	}

	public String getNewEfficacy_imageFileName() {
		return newImageFileName;
	}

	public void setNewEfficacy_imageFileName(String newImageFileName) {
		this.newImageFileName = newImageFileName;
	}

	/*
	 * for Client and Editor (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.EfficacyInterface#getEfficacy()
	 */
	@Override
	public String getEfficacy() {
		List<EfficacyView> efficacyViews = new ArrayList<EfficacyView>();
		List<Efficacy> efficacies = efficacyDAO.findAll();
		for (Efficacy efficacy : efficacies) {
			EfficacyView efficacyView = new EfficacyView();
			efficacyView.setEfficacyId(efficacy.getEfficacyId());
			efficacyView.setEfficacyName(efficacy.getEfficacyName());
			if (efficacy.getEfficacyImageId() != 0) // 图片非空
			{
				Image image = imageDAO.findById(efficacy.getEfficacyImageId());
				efficacyView.setEfficacyImageUrl(Config
						.get(Config.BASE_IMAGEURL)
						+ image.getImgUrl());
			}
			efficacyViews.add(efficacyView);
		}
		printArray(efficacyViews);
		return null;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.EfficacyInterface#updateORinsertEfficacy
	 * ()
	 */
	@Override
	public String updateORinsertEfficacy() {
		Integer efficacy_id = getIntegerParameter(EFFICACY_ID);
		String updateType = getRequest().getParameter("submit");
		if (updateType.equals("添加")) { // 添加新分类
			Efficacy efficacy = new Efficacy();
			efficacy.setEfficacyName(getRequest().getParameter(
					"newEfficacy_name"));
			efficacy.setEfficacyRank((long) 0); // 分类的排序待定！！
			if (newImageFileName != null && !newImageFileName.equals("")) { // 上传图片，并存储
				String FileName = MD5.md5(newImageFileName)
						+ getExtention(newImageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(newEfficacy_image, FileName);
				efficacy.setEfficacyImageId(imageid);
				copy(newEfficacy_image, imageFile);
			}
			efficacyDAO.save(efficacy);
			return SUCCESS;
		} else if (updateType.equals("更新")) { // 需要对每个进行更新
			Efficacy efficacy = efficacyDAO.findById(efficacy_id);
			if (imageFileName != null && !imageFileName.equals("")) { // 上传大图，并存储
				// String FileName =imageFileName+ new Date().getTime() +
				// getExtention(imageFileName);
				String FileName = MD5.md5(imageFileName)
						+ getExtention(imageFileName);
				File imageFile = new File(Config.get(Config.BASE_IMAGESTORAGE)
						+ FileName);
				int imageid = getImgAttribute(efficacy_image, FileName);
				efficacy.setEfficacyImageId(imageid);
				copy(efficacy_image, imageFile);
			}
			efficacy.setEfficacyName(getRequest().getParameter("efficacy_name"));
			return SUCCESS;
		}
		return ERROR;
	}

	/*
	 * for Editor (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.EfficacyInterface#getEfficacyDetail()
	 */
	@Override
	public String getEfficacyDetail() {
		int eid = getIntegerParameter(EFFICACY_ID);
		Efficacy efficacy = efficacyDAO.findById(eid);
		EfficacyView efficacyView = new EfficacyView();
		efficacyView.setEfficacyId(efficacy.getEfficacyId());
		efficacyView.setEfficacyName(efficacy.getEfficacyName());
		if (efficacy.getEfficacyImageId() != 0) // 图片非空
		{
			Image image = imageDAO.findById(efficacy.getEfficacyImageId());
			efficacyView.setEfficacyImageUrl(Config.get(Config.BASE_IMAGEURL)
					+ image.getImgUrl());
		}

		printObject(efficacyView);
		return null;
	}
}
