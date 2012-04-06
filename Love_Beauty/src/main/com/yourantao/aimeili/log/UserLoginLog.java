package main.com.yourantao.aimeili.log;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

/**
 * 用户登录日志
 * 
 * @author mac
 * 创建时间： 2012-4-1 下午05:21:13
 * 修改时间：2012-4-1 下午05:21:13
 * 具体描述： TODO
 */
public class UserLoginLog implements Constant
{
	public static final String LOGGER_NAME="userLogin"; 
	private LogHeader header;
	private Timestamp loginTime;

	public Timestamp getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	public UserLoginLog(String uuid,HttpServletRequest request){
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
		
		sb.append("time");
		sb.append(SEPARATOR_COLON);
		sb.append(loginTime);
//		sb.append(SEPARATOR_COMMA);

		return sb.toString();
		
	} 
	
}
