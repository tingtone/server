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
import main.com.yourantao.aimeili.vo.TopicView;

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
	private static final Logger LOG = LoggerFactory
			.getLogger(TopicAction.class);
	private static final int BUFFER_SIZE = 16 * 1024;
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

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
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.TopicInterface#exchange()
	 */
	public String exchange() {
		Integer topicId1 = getIntegerParameter(TOPIC_ID1);
		Integer topicId2 = getIntegerParameter(TOPIC_ID2);
		if (topicId1 == null || topicId2 == null)
			return null;

		Topic topic1 = topicDAO.findById(topicId1);
		Topic topic2 = topicDAO.findById(topicId2);
		Long rank = topic1.getTopicRank();
		topic1.setTopicRank(topic2.getTopicRank());
		topic2.setTopicRank(rank);

		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.TopicInterface#top()
	 */
	public String top() {
		Integer topicId = getIntegerParameter(TOPIC_ID);
		if (topicId == null)
			return null;

		Topic topic = topicDAO.findById(topicId);
		topic.setTopicRank(rankGenerator.generateRank());

		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.TopicInterface#updateTopic()
	 */
	public String updateTopic() {
		Topic topic = new Topic();
		ApplicationContext ac = Config.getACInstant();
		TopicGoodsDAO topicGoodsDAO = TopicGoodsDAO
				.getFromApplicationContext(ac);
		TopicDAO topicDAO = TopicDAO.getFromApplicationContext(ac);
		Integer topicId = getIntegerParameter(TOPIC_ID);
		topic.setTopicId(topicId);
		topic.setTopicName(getReqeust().getParameter(TOPIC_NAME));
		topic.setTopicKeywords(getReqeust().getParameter(TOPIC_KEYWORDS));

		String topicName = getReqeust().getParameter("topic_name");
		String topicKerwords = getReqeust().getParameter("topic_keywords");
		String updateType = getReqeust().getParameter("submit");
		getReqeust().getAttribute("newtopic_thumb");
		if (updateType.equals("前移")) {

		} else if (updateType.equals("后移")) {

		} else if (updateType.equals("更新")) { // 需要对每个进行更新
			if (thumbFileName != null && !thumbFileName.equals("")) { // 上传缩略图，并存储
				// String FileName =thumbFileName+ new Date().getTime() +
				// getExtention(thumbFileName);
				String FileName = MD5.md5(thumbFileName)
						+ getExtention(thumbFileName);
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
				File imageFile = new File(BASE_IMAGESTORAGE + FileName);
				int imageid = getImgAttribute(newtopic_image, FileName);
				topic.setTopicImagesId(imageid);
				copy(newtopic_image, imageFile);
			}
			topicDAO.updateTopic(topic);
			return SUCCESS;
		} else if (updateType.equals("删除")) { // 删除
			topicDAO.delete(topicDAO.findById(topicId));
			return SUCCESS;
		} else if (updateType.equals("对应商品")) { // 查看对应商品

			return "topic_goods";
		}

		topic.setTopicId(topicId);

		List goods = topicGoodsDAO.findByTopicId(topicId);
		printArray(goods);

		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.TopicInterface#insertTopic()
	 */
	public String insertTopic() {

		Topic topic = new Topic();
		ApplicationContext ac = Config.getACInstant();
		TopicDAO topicDAO = TopicDAO.getFromApplicationContext(ac);

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
			File imageFile = new File(BASE_IMAGESTORAGE + FileName);
			int imageid = getImgAttribute(newtopic_image, FileName);
			topic.setTopicImagesId(imageid);
			copy(newtopic_image, imageFile);
		}
		topicDAO.save(topic);

		return SUCCESS;

	}

	/*
	 * 获得图片信息，并更新或新增 return imgid
	 */
	private int getImgAttribute(File imgfile, String fileName) {
		Image image = new Image();
		ApplicationContext ac = Config.getACInstant();
		ImageDAO imageDAO = ImageDAO.getFromApplicationContext(ac);

		String imgurl = BASE_IMAGEURL + fileName; // 保存的图片url
		// byte[] bytes= imgurl.getBytes(); //对长的url进行crc32编码
		// CRC32 crc32 = new CRC32();
		// crc32.update(bytes);
		String imgurl_md5 = MD5.md5(imgurl); // MD5加密

		try {
			BufferedImage buff = ImageIO.read(imgfile);
			image.setImgHeight(buff.getHeight());
			image.setImgSize(imgfile.length());
			image.setImgWidth(buff.getWidth());
			image.setImgMd5(imgurl_md5);
			image.setImgType(1); // 1代表是编辑给的图片
			image.setImgUrl(imgurl);
			image
					.setCreatTime(Timestamp.valueOf(dateFormat
							.format(new Date())));
			// System.out.println(sdFormat.format(new Date()));

			List<Image> list = imageDAO.findByImgMd5(imgurl_md5); // 用md5校验值查询是否有图片存在
			if (list.isEmpty()) {
				LOG.info("list is empty insert!");
				imageDAO.save(image);
				return image.getImgId();
				// 插入该图片信息
			} else {
				image.setImgId((Integer) list.get(0).getImgId());
				LOG.info("list is not empty update!");
				imageDAO.getHibernateTemplate().update(image);
				return image.getImgId();
				// 更新该图片信息
			}
			/* 保存入库 */
		} catch (FileNotFoundException e) {
			LOG.error("文件未能找到");
			e.printStackTrace();
		} catch (IOException e) {
			LOG.error("IO操作失败");
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 复制原文件到新文件
	 */
	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获得文件类型
	 * 
	 * @param fileName
	 * @return
	 */
	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
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

	public String getImageFileName() {
		return imageFileName;
	}

	public void setRankGenerator(RankGenerator rankGenerator) {
		this.rankGenerator = rankGenerator;
	}

	public RankGenerator getRankGenerator() {
		return rankGenerator;
	}

	public void setTopicGoodsDAO(TopicGoodsDAO topicGoodsDAO) {
		this.topicGoodsDAO = topicGoodsDAO;
	}

	public TopicGoodsDAO getTopicGoodsDAO() {
		return topicGoodsDAO;
	}

}
