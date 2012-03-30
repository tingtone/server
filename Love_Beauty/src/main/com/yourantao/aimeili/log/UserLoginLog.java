package main.com.yourantao.aimeili.log;

import java.sql.Timestamp;

/**
 * @author whp
 *
 */
public class UserLoginLog extends CommonLog
{
	public static final String LOGGER_NAME="userLogin"; 
	private String uuid;    //
	private int uid;
	private String uname;
	private Timestamp loginTime;


	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}




	public Timestamp getLoginTime() {
		return loginTime;
	}


	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}


	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString()
	{
		StringBuilder sb=new StringBuilder();
		
		sb.append("uuid");
		sb.append(SEPARATOR_COLON);
		sb.append(uuid);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("uid");
		sb.append(SEPARATOR_COLON);
		sb.append(uid);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("uname");
		sb.append(SEPARATOR_COLON);
		sb.append(uname);
		sb.append(SEPARATOR_COMMA);
		
		sb.append("time");
		sb.append(SEPARATOR_COLON);
		sb.append(loginTime);
//		sb.append(SEPARATOR_COMMA);

		return sb.toString();
		
	} 
	
}
