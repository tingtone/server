package main.com.yourantao.aimeili.log;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

/**
 * 购物车日志
 * 
 * @author mac
 * 创建时间： 2012-4-1 下午05:20:34
 * 修改时间：2012-4-1 下午05:20:34
 * 具体描述： TODO
 */
public class ShoppingCartLog implements Constant
{
	public static final int INSERT=1; 
	public static final int UPDATE=2; 
	public static final int DELETE=3; 
	public static final String LOGGER_NAME="Shopping"; 
	
	private int type;
	private int count;
	private LogHeader header;
	private int goodsRealId;
	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getgoodsRealId() {
		return goodsRealId;
	}

	public void setgoodsRealId(int goodsRealId) {
		this.goodsRealId = goodsRealId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public ShoppingCartLog(String uuid,HttpServletRequest request){
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
		
		sb.append("type");
		sb.append(SEPARATOR_COLON);
		sb.append(type);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("count");
		sb.append(SEPARATOR_COLON);
		sb.append(count);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("grid");
		sb.append(SEPARATOR_COLON);
		sb.append(goodsRealId);
//		sb.append(SEPARATOR_COMMA);

		return sb.toString();
		
	} 
}