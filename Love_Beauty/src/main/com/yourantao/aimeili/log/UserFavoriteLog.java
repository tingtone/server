package main.com.yourantao.aimeili.log;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

public class UserFavoriteLog implements Constant
{
	public static final int INSERT=1; 
	public static final int GET=2; 
	public static final int DELETE=3; 
	public static final String LOGGER_NAME="userFavorite"; 
	
	private int type;
	private LogHeader header;
	private int goodsId;
	
	
	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public UserFavoriteLog(String uuid,HttpServletRequest request){
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
		
		sb.append("gid");
		sb.append(SEPARATOR_COLON);
		sb.append(goodsId);
//		sb.append(SEPARATOR_COMMA);

		return sb.toString();
		
	} 
}