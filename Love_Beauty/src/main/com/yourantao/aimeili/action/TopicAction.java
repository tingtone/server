package main.com.yourantao.aimeili.action;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.Topic;
import main.com.yourantao.aimeili.bean.TopicDAO;
import main.com.yourantao.aimeili.bean.TopicGoodsDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.util.RankGenerator;
import main.com.yourantao.aimeili.util.StringTool;
import main.com.yourantao.aimeili.vo.TopicView;

import org.apache.struts2.convention.StringTools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

/**
 * 专题相关action
 * 
 * @author mac 创建时间： 2012-2-29 下午05:25:19 修改时间：2012-2-29 下午05:25:19 具体描述： TODO
 */
@SuppressWarnings("serial")
public class TopicAction extends BaseAction implements Constant, TopicInterface {
	private static final Logger log = LoggerFactory
			.getLogger(TopicAction.class);

	private File newtopic_thumb; // 上传文件1
	private File newtopic_image; // 上传文件1
	private String imageContentType;// 上传文件类型2
	private String imageFileName; // 上传文件名2
	private String thumbContentType;// 上传文件类型1
	private String thumbFileName; // 上传文件名1

	private TopicDAO topicDAO;
	private TopicGoodsDAO topicGoodsDAO;
	private ImageDAO imageDAO;
	private RankGenerator rankGenerator;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.TopicInterface#getTopicsOfCategory()
	 */
	@Override
	public String getTopicsOfCategory() {
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null)
			return null;

		List<TopicView> result = new ArrayList<TopicView>();
		List<Topic> topics = topicDAO.findByCategoryId(categoryId);

		for (Topic topic : topics) {
			TopicView topicView = new TopicView();
			Image image = imageDAO.findById(topic.getTopicImagesId()); // 大图
			Image thumb = imageDAO.findById(topic.getTopicThumbId()); // 缩略图
			topicView.setTopicId(topic.getTopicId());
			topicView.setTopicKeywords(topic.getTopicKeywords());
			topicView.setTopicName(topic.getTopicName());
			if (thumb != null) {
				topicView.setTopicThumb(BASE_IMAGEURL + thumb.getImgUrl());
			} else {
				topicView.setTopicThumb("");
			}
			if (image != null) {
				topicView.setTopicImages(BASE_IMAGEURL + image.getImgUrl());
			} else {
				topicView.setTopicImages("");
			}
			result.add(topicView);
		}
		printArray(result);

		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.TopicInterface#getTopicGoods()
	 */
	public String getTopicGoods() {
		Integer topicId = getIntegerParameter(TOPIC_ID);
		if (topicId == null)
			return null;
		List goods = topicGoodsDAO.findByTopicId(topicId);
		printArray(goods);

		return null;
	}

	/*
	 * 交换
	 */
	public String exchange(int topicId1, int topicId2) {

		Topic topic1 = topicDAO.findById(topicId1);
		Topic topic2 = topicDAO.findById(topicId2);
		Long rank = topic1.getTopicRank();
		topic1.setTopicRank(topic2.getTopicRank());
		topic2.setTopicRank(rank);

		return null;
	}

	/*
	 * 置顶
	 */
	public void top(int topicId) {

		Topic topic = topicDAO.findById(topicId);
		topic.setTopicRank(rankGenerator.generateRank());

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.TopicInterface#updateTopic()
	 */
	public String updateTopic() {
		Topic topic = new Topic();
		Integer topicId = getIntegerParameter(TOPIC_ID);
		topic.setTopicId(topicId);
		topic.setTopicName(getReqeust().getParameter(TOPIC_NAME));
		topic.setTopicKeywords(getReqeust().getParameter(TOPIC_KEYWORDS));

		String updateType = getReqeust().getParameter("submit");
		getReqeust().getAttribute("newtopic_thumb");
		if (updateType.equals("置顶")) {
			top(getIntegerParameter(TOPIC_ID));
			return "back";
		} else if (updateType.equals("后移")) {
			exchange(getIntegerParameter(TOPIC_ID),
					getIntegerParameter(TOPICEXCHANGE_ID));
			return "back";
		} else if (updateType.equals("更新")) { // 需要对每个进行更新
			if (thumbFileName != null && !thumbFileName.equals("")) { // 上传缩略图，并存储
				// String FileName =thumbFileName+ new Date().getTime() +
				// getExtention(thumbFileName);
				String FileName = MD5.md5(thumbFileName)
						+ getExtention(thumbFileName);
				FileName=StringTool.filterWord(FileName);
				File thumbFile = new File(BASE_IMAGESTORAGE + FileName);
				int imageid = getImgAttribute(newtopic_thumb, FileName);
				topic.setTopicThumbId(imageid);
				copy(newtopic_thumb, thumbFile);
			}
			if (imageFileName != null && !imageFileName.equals("")) { // 上传大图，并存储
				// String FileName =imageFileName+ new Date().getTime() +
				// getExtention(imageFileName);
				String FileName = MD5.md5(imageFileName)
						+ getExtention(imageFileName);
				FileName=StringTool.filterWord(FileName);
				File imageFile = new File(BASE_IMAGESTORAGE + FileName);
				int imageid = getImgAttribute(newtopic_image, FileName);
				topic.setTopicImagesId(imageid);
				copy(newtopic_image, imageFile);
			}
			topicDAO.updateTopic(topic);
			return SUCCESS;
		} else if (updateType.equals("删除")) { // 删除
			topicDAO.delete(topicDAO.findById(topicId));
			return "back";
		} else if (updateType.equals("对应商品")) { // 查看对应商品
			return "topic_goods";
		}
		return ERROR;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.TopicInterface#insertTopic()
	 */
	public String insertTopic() {

		Topic topic = new Topic();
		topic.setTopicName(getReqeust().getParameter(TOPIC_NAME));
		topic.setTopicKeywords(getReqeust().getParameter(TOPIC_KEYWORDS));
		topic.setCategoryId(getIntegerParameter(CATEGORY_ID));
		topic.setAddTime(Timestamp.valueOf(dateFormat.format(new Date())));
		topic.setTopicRank(rankGenerator.generateRank());
		if (thumbFileName != null && !thumbFileName.equals("")) { // 上传缩略图，并存储
			// String FileName =thumbFileName+ new Date().getTime() +
			// getExtention(thumbFileName);
			String FileName = MD5.md5(thumbFileName)
					+ getExtention(thumbFileName); // MD5加密;
			FileName=StringTool.filterWord(FileName);
			File thumbFile = new File(BASE_IMAGESTORAGE + FileName);
			int imageid = getImgAttribute(newtopic_thumb, FileName);
			topic.setTopicThumbId(imageid);
			copy(newtopic_thumb, thumbFile);
		}
		if (imageFileName != null && !imageFileName.equals("")) { // 上传大图，并存储
			// String FileName =imageFileName+ new Date().getTime() +
			// getExtention(imageFileName);
			String FileName = MD5.md5(imageFileName)
					+ getExtention(thumbFileName);
			FileName=StringTool.filterWord(FileName);
			File imageFile = new File(BASE_IMAGESTORAGE + FileName);
			int imageid = getImgAttribute(newtopic_image, FileName);
			topic.setTopicImagesId(imageid);
			copy(newtopic_image, imageFile);
		}
		topicDAO.save(topic);

		return SUCCESS;

	}

	// structs

	public void setNewtopic_thumbContentType(String thumbContentType) {
		System.out.println("thumbContentType : " + thumbContentType);
		this.thumbContentType = thumbContentType;
	}

	public void setNewtopic_thumbFileName(String thumbFileName) {
		System.out.println("thumbFileName : " + thumbFileName);
		this.thumbFileName = thumbFileName;
	}

	public void setNewtopic_thumb(File newtopic_thumb) {
		this.newtopic_thumb = newtopic_thumb;
	}

	public void setNewtopic_imageContentType(String imageContentType) {
		System.out.println("imageContentType : " + imageContentType);
		this.imageContentType = imageContentType;
	}

	public void setNewtopic_imageFileName(String imageFileName) {
		System.out.println("imageFileName : " + imageFileName);
		this.imageFileName = imageFileName;
	}

	public void setNewtopic_image(File newtopic_image) {
		this.newtopic_image = newtopic_image;
	}

	// spring

	public void setRankGenerator(RankGenerator rankGenerator) {
		this.rankGenerator = rankGenerator;
	}

	public RankGenerator getRankGenerator() {
		return rankGenerator;
	}

	public void setTopicDAO(TopicDAO topicDAO) {
		this.topicDAO = topicDAO;
	}

	public TopicDAO getTopicDAO() {
		return topicDAO;
	}

	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	public ImageDAO getImageDAO() {
		return imageDAO;
	}

	public void setTopicGoodsDAO(TopicGoodsDAO topicGoodsDAO) {
		this.topicGoodsDAO = topicGoodsDAO;
	}

	public TopicGoodsDAO getTopicGoodsDAO() {
		return topicGoodsDAO;
	}

}
