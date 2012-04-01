package main.com.yourantao.aimeili.log;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

public class UserInfoLog implements Constant
{
	public static final int INSERT=1; 
	public static final int UPDATE=2; 
	public static final int DELETE=3; 
	public static final String LOGGER_NAME="userInfo"; 
	
	private int type;
	private LogHeader header;
	private int relativeId;  //亲戚ID ，0代表修改的是“我”
	private String nickName;
	private String city;
	private String skin;
	private String birthday;
	private String userTags;

	
	public String getUserTags() {
		return userTags;
	}

	public void setUserTags(String userTags) {
		this.userTags = userTags;
	}

	public int getRelativeId() {
		return relativeId;
	}

	public void setRelativeId(int relativeId) {
		this.relativeId = relativeId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public UserInfoLog(String uuid,HttpServletRequest request){
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
		
		sb.append("rid");
		sb.append(SEPARATOR_COLON);
		sb.append(relativeId);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("nick");
		sb.append(SEPARATOR_COLON);
		sb.append(nickName);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("city");
		sb.append(SEPARATOR_COLON);
		sb.append(city);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("birth");
		sb.append(SEPARATOR_COLON);
		sb.append(birthday);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("tag");
		sb.append(SEPARATOR_COLON);
		sb.append(userTags);
//		sb.append(SEPARATOR_COMMA);

		return sb.toString();
		
	} 
}