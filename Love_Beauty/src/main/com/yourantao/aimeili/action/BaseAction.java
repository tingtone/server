package main.com.yourantao.aimeili.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public abstract class BaseAction extends ActionSupport {
	private static Logger log = LoggerFactory.getLogger(BaseAction.class);
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
	
	private String jsonpcallback = null;
	private HttpServletResponse response;
	private HttpServletRequest request;

	public BaseAction() {
		response = ServletActionContext.getResponse();
		response.setCharacterEncoding(ENCODE);
		response.setContentType(CONTENT_TYPE);
		response.setHeader(HEADER, CACHE);
		
		request = ServletActionContext.getRequest();
		try {
			request.setCharacterEncoding(ENCODE);
		} catch (UnsupportedEncodingException e) {
			log.error("request.setCharacterEncoding error! ", e);
		}
	}

	/**
	 * 获得request中Integer类型的参数
	 * @param paraName 参数的名字
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

	protected void responseFlush() {
		try {
			response.getOutputStream().flush();
			response.getOutputStream().close();
			response.flushBuffer();
		} catch (IOException e) {
			log.error("response flush error!", e);
		}
	}
	
	/**
	 * 将对象转化为json，向表现层输出
	 * @param jsonObject 要输出的对象
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
	 * @param jsonArray 要输出的对象数组
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
			out = response.getWriter();
			out.print(str);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}
	}

	protected HttpServletRequest getReqeust() {
		return request;
	}

	protected HttpServletResponse getResponse() {
		return response;
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