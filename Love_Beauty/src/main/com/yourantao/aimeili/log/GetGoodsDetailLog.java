package main.com.yourantao.aimeili.log;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

/**
 * 商品详情日志
 * 
 * @author mac
 * 创建时间： 2012-4-1 下午05:19:20
 * 修改时间：2012-4-1 下午05:19:20
 * 具体描述： TODO
 */
public class GetGoodsDetailLog implements Constant
{
	public static final int IMAGES=1; 
	public static final int BIBIJIA=2; 
	public static final int EXPERIENCE=3; 
	public static final String LOGGER_NAME="goodsDetailLog"; 
	
	private LogHeader header;
	private int detail_type;   //商品详情的类型（图片，比比价，心得）
	private int goodsId;  //商品ID
	
	public LogHeader getHeader() {
		return header;
	}

	public void setHeader(LogHeader header) {
		this.header = header;
	}


	public int getDetail_type() {
		return detail_type;
	}

	public void setDetail_type(int detailType) {
		detail_type = detailType;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public GetGoodsDetailLog(String uuid,HttpServletRequest request){
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
		sb.append(detail_type);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("gid");
		sb.append(SEPARATOR_COLON);
		sb.append(goodsId);
//		sb.append(SEPARATOR_COMMA);

		return sb.toString();
		
	} 
}