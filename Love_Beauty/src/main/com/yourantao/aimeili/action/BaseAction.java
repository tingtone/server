package main.com.yourantao.aimeili.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BaseAction extends ActionSupport {
	private static Logger log = LoggerFactory.getLogger(BaseAction.class);

	protected static final String encode = "UTF-8";
//	private static final String JSONCONTENTTYPE = "text/x-json;charset=UTF-8 ";
	private static final String JSONCONTENTTYPE = "text;charset=UTF-8 ";
	private static final String HEADER = "Cache-Control";
	private static final String CACHE = "no-cache";
	private String jsonpcallback = null;

	private static final String c1 = "(";
	private static final String c2 = ")";

	private HttpServletResponse response;
	// protected PrintWriter out;
	protected String sessionId;
	protected String url;
	protected Map<String, String> jsonMap = new HashMap<String, String>();

	// protected UserService service = new UserService();

	protected void responseFlush() {
		try {
			response.getOutputStream().flush();
			response.getOutputStream().close();
			response.flushBuffer();
		} catch (IOException e) {
			log.error("response flush error : " + e.getMessage());
		}
	}

	/**
	 * 打印json
	 * 
	 * @param str
	 */
	private void outputString(String str) {
		response = getResponse();
		response.setCharacterEncoding(encode);
		response.setContentType(JSONCONTENTTYPE);
		response.setHeader(HEADER, CACHE);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(str);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		} finally {
			out.flush();
			out.close();
		}
	}

	/**
	 * 打印json
	 * 
	 * @param jsonObject
	 */
	protected void printObject(Object jsonObject) {
		JSONObject json = JSONObject.fromObject(jsonObject);
		if (jsonpcallback != null) {
			outputString(jsonpcallback + c1 + json.toString() + c2);
		} else {
			outputString(json.toString());
		}
	}

	protected void printArray(Object jsonArray) {
		JSONArray json = JSONArray.fromObject(jsonArray);
		if (jsonpcallback != null) {
			outputString(jsonpcallback + c1 + json.toString() + c2);
		} else {
			outputString(json.toString());
		}
	}

	protected HttpServletRequest getReqeust() {
		return ServletActionContext.getRequest();
	}

	protected HttpServletResponse getResponse() {
		if (response == null) {
			response = ServletActionContext.getResponse();
			response.setCharacterEncoding(encode);
		}
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