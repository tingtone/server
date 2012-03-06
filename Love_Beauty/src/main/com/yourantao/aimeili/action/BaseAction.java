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
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.util.MD5;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public abstract class BaseAction extends ActionSupport {
	private static Logger LOG = LoggerFactory.getLogger(BaseAction.class);
	/**
	 * 原始值为"text/x-json;charset=UTF-8"，为方便调试改为如下值：
	 */
	private static final String CONTENT_TYPE = "text;charset=UTF-8";
	private static final String HEADER = "Cache-Control";
	private static final String CACHE = "no-cache";
	private static final String ENCODE = "UTF-8";
	private static final String C1 = "(";
	private static final String C2 = ")";

	protected String sessionId;
	protected String url;
	protected static final int BUFFER_SIZE = 16 * 1024;
	protected static final SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	private String jsonpcallback = null;

	/**
	 * 获得request中Integer类型的参数
	 * 
	 * @param paraName
	 *            参数的名字
	 * @return 参数的值，未找到参数时返回null
	 */
	protected Integer getIntegerParameter(String paraName) {
		int ret = 0;
		try {
			ret = Integer.valueOf(getReqeust().getParameter(paraName));
		} catch (Exception e) {
			return null;
		}
		return ret;
	}
	
	/**
	 * 获得文件类型
	 * 
	 * @param fileName
	 * @return
	 */
	protected static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	/**
	 * 获得request中String类型的参数
	 * 
	 * @param paraName
	 *            参数的名字
	 * @return 参数的值，未找到参数时返回null
	 */
	protected String getStringParameter(String paraName) {
		String ret = null;
		try {
			ret = String.valueOf(getReqeust().getParameter(paraName));
		} catch (Exception e) {
			return null;
		}
		return ret;
	}

	protected void responseFlush() {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.getOutputStream().flush();
			response.getOutputStream().close();
			response.flushBuffer();
		} catch (IOException e) {
			LOG.error("response flush error!", e);
		}
	}

	/**
	 * 将对象转化为json，向表现层输出
	 * 
	 * @param jsonObject
	 *            要输出的对象
	 */
	protected void printObject(Object jsonObject) {
		JSONObject json = JSONObject.fromObject(jsonObject);
		if (jsonpcallback != null) {
			outputString(jsonpcallback + C1 + json.toString() + C2);
		} else {
			outputString(json.toString());
		}
	}

	/**
	 * 将对象数组转化为json，向表现层输出
	 * 
	 * @param jsonArray
	 *            要输出的对象数组
	 */
	protected void printArray(Object jsonArray) {
		JSONArray json = JSONArray.fromObject(jsonArray);
		if (jsonpcallback != null) {
			outputString(jsonpcallback + C1 + json.toString() + C2);
		} else {
			outputString(json.toString());
		}
	}

	private void outputString(String str) {
		PrintWriter out = null;
		try {
			out = getResponse().getWriter();
			out.print(str);
		} catch (IOException e) {
			LOG.error(e.getMessage(), e);
		}
	}

	protected HttpServletRequest getReqeust() {
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			request.setCharacterEncoding(ENCODE);
		} catch (UnsupportedEncodingException e) {
			LOG.error("request.setCharacterEncoding error! ", e);
		}
		return request;
	}

	protected HttpServletResponse getResponse() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding(ENCODE);
		response.setContentType(CONTENT_TYPE);
		response.setHeader(HEADER, CACHE);
		return response;
	}
	
	/**
	 * 获得图片信息，并更新或新增 return imgid
	 */
	protected int getImgAttribute(File imgfile, String fileName) {
		Image image = new Image();
		ApplicationContext ac = Config.getACInstant();
		ImageDAO imageDAO = ImageDAO.getFromApplicationContext(ac);

		String imgurl = fileName; // 保存的图片url
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
			image.setCreatTime(Timestamp.valueOf(dateFormat
							.format(new Date())));

			List<Image> list = imageDAO.findByImgMd5(imgurl_md5); // 用md5校验值查询是否有图片存在
			if (list.isEmpty()) {
				LOG.info("list is empty insert!");
				imageDAO.save(image);
				return image.getImgId();
				// 插入该图片信息
			} else {
				image.setImgId((Integer) list.get(0).getImgId());
				LOG.info("list is not empty update!");
				// imageDAO.getHibernateTemplate().update(image);
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
	protected static void copy(File src, File dst) {
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
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getJsonpcallback() {
		return jsonpcallback;
	}

	public void setJsonpcallback(String jsonpcallback) {
		this.jsonpcallback = jsonpcallback;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

}