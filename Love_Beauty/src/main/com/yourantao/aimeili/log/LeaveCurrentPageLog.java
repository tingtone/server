package main.com.yourantao.aimeili.log;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

/**
 * 离开页面的日志  （暂时不用）
 * 
 * @author mac
 * 创建时间： 2012-4-1 下午05:19:53
 * 修改时间：2012-4-1 下午05:19:53
 * 具体描述： TODO
 */
public class LeaveCurrentPageLog implements Constant
{
	public static final String LOGGER_NAME="leaveCurrentPage"; 
	
	private LogHeader header;
	private int time;
	private String pageName;
	
	

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public LeaveCurrentPageLog(String uuid,HttpServletRequest request){
		//配置request中的编码为utf-8
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
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString()
	{
		StringBuilder sb=new StringBuilder();
		sb.append(header);
		
		sb.append("page");
		sb.append(SEPARATOR_COLON);
		sb.append(pageName);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("time");
		sb.append(SEPARATOR_COLON);
		sb.append(time);
//		sb.append(SEPARATOR_COMMA);

		return sb.toString();
		
	} 
}