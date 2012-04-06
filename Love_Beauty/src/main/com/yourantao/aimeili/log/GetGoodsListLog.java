package main.com.yourantao.aimeili.log;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

/**
 * 商品列表日志
 * 
 * @author mac
 * 创建时间： 2012-4-1 下午05:19:40
 * 修改时间：2012-4-1 下午05:19:40
 * 具体描述： TODO
 */
public class GetGoodsListLog implements Constant
{
	public static final int BRAND=1; 
	public static final int CATEGORY=2; 
	public static final int EFFICASY=3; 
	public static final int RANKING=4; 
	public static final int SEARCH=5; 
	public static final int FAVORITE=6; 
	public static final String LOGGER_NAME="goodsListLog"; 
	
	private LogHeader header;
	private int from;   //商品列表的来自（）
	private String fromMsg;  //商品列表来自信息

	
	public LogHeader getHeader() {
		return header;
	}

	public void setHeader(LogHeader header) {
		this.header = header;
	}

	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	public String getFromMsg() {
		return fromMsg;
	}

	public void setFromMsg(String fromMsg) {
		this.fromMsg = fromMsg;
	}

	public GetGoodsListLog(String uuid,HttpServletRequest request){
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
		
		sb.append("from");
		sb.append(SEPARATOR_COLON);
		sb.append(from);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("fromMsg");
		sb.append(SEPARATOR_COLON);
		sb.append(fromMsg);
//		sb.append(SEPARATOR_COMMA);

		return sb.toString();
		
	} 
}
