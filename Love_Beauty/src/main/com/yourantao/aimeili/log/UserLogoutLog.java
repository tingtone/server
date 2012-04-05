package main.com.yourantao.aimeili.log;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

/**
 * 用户登出日志
 * 
 * @author mac
 * 创建时间： 2012-4-1 下午05:21:27
 * 修改时间：2012-4-1 下午05:21:27
 * 具体描述： TODO
 */
public class UserLogoutLog implements Constant {
	public static final String LOGGER_NAME = "userLogout";
	private LogHeader header;
	private String pageName;
	private Long lastTime;

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public Long getLastTime() {
		return lastTime;
	}

	public void setLastTime(Long lastTime) {
		this.lastTime = lastTime;
	}

	public UserLogoutLog(String uuid, HttpServletRequest request) {
		// 配置request中的编码为utf-8
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		header = new LogHeader();
		header.setUuid(uuid);
		header.getHeader(request);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(header);

		sb.append("page");
		sb.append(SEPARATOR_COLON);
		sb.append(pageName);
		sb.append(SEPARATOR_COMMA);

		sb.append("ttime");
		sb.append(SEPARATOR_COLON);
		sb.append(lastTime);
//		sb.append(SEPARATOR_COMMA);
		
		return sb.toString();

	}
}
