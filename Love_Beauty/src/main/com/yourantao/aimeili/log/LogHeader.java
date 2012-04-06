package main.com.yourantao.aimeili.log;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import main.com.yourantao.aimeili.conf.Constant;

/**
 * 爱美丽日志头结构
 * 
 * @author mac
 * 创建时间： 2012-4-1 下午05:20:18
 * 修改时间：2012-4-1 下午05:20:18
 * 具体描述： TODO
 */
public class LogHeader implements Constant{

	private static Logger log = LoggerFactory.getLogger(LogHeader.class);
	//设备号
	protected String uuid;
	//远端的IP地址
	protected String remoteIP;
	//原始IP，适合通过代理访问的机器
	protected String originateIP;
	//User-Agent信息
	protected String UA;
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	public String getRemoteIP() {
		return remoteIP;
	}
	public void setRemoteIP(String remoteIP) {
		this.remoteIP = remoteIP;
	}
	public String getOriginateIP() {
		return originateIP;
	}
	public void setOriginateIP(String originateIP) {
		this.originateIP = originateIP;
	}
	public String getUA() {
		return UA;
	}
	public void setUA(String uA) {
		UA = uA;
	}
	/**
	 * 输出固定的记录头
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		// 最开始的时间戳由logback自动生成
		// sb.append(SEPARATOR_COMMA);
		sb.append("uuid");
		sb.append(SEPARATOR_COLON);
		sb.append(uuid);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("rip");
		sb.append(SEPARATOR_COLON);
		sb.append(remoteIP);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("oip");
		sb.append(SEPARATOR_COLON);
		sb.append(originateIP);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("ua");
		sb.append(SEPARATOR_COLON);
		sb.append(UA);
		sb.append(SEPARATOR_COMMA);
		return sb.toString();
	}
	/**
	 * 包装日志头
	 * @param request
	 */
	void getHeader(HttpServletRequest request)
	{
		remoteIP=request.getRemoteAddr();
		originateIP=extractFromRequest(request);
		log.info("originateIP={}",originateIP.toString());
		UA=request.getHeader(USER_AGENT);
		log.info("UA={}",UA.toString());
	}
	
	/**
	 * 获得remoteip
	 * @param request
	 * @return
	 */
	protected String extractFromRequest(HttpServletRequest request) {

		String ip = request.getHeader(X_FORWARDED_FOR);
		if ((ip == null) || (ip.length() == 0)
				|| (UNKNOWN.equalsIgnoreCase(ip))) {
			ip = request.getHeader(X_FORWARDED_FOR1);
		}
		if ((ip == null) || (ip.length() == 0) || UNKNOWN.equalsIgnoreCase(ip)) {
			ip = request.getHeader(PROXY_CLIENT_IP);
		}
		if ((ip == null) || (ip.length() == 0) || UNKNOWN.equalsIgnoreCase(ip)) {
			ip = request.getHeader(WL_PROXY_CLIENT_IP);
		}
		if ((ip == null) || (ip.length() == 0) || UNKNOWN.equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if ((ip == null) || (ip.length() == 0) || UNKNOWN.equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip != null) {
			int index = ip.indexOf(",");
			if (index > 0) {// 有多个IP，取第一个
				ip = ip.substring(0, index);
			}
			ip = ip.trim();
		} else {
			ip = "";
		}

		return ip;
	}
}
