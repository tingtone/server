package main.com.yourantao.aimeili.util;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TransTool {
	private static final Logger LOG = LoggerFactory.getLogger(TransTool.class);
	 
	public static final int MAXUSERTAGS=3;
	public static final String[] systemUserTag=new String[]{"保湿补水","美白","控油","祛痘","祛痘印","抗皱紧肤","提亮肤色","淡化细纹","细致毛孔","舒缓镇定","淡化眼部细纹","去黑眼圈","去眼袋","防晒隔离","祛黑头"};
	/**
	 * 肤质号码对应的现实名称
	 * @param skin
	 * @return
	 */
	public static String transSkinIdToName(String skin) {
		String skinName="";
		switch (skin.charAt(0)) {
		case '1':
			skinName="干性";
			break;
		case '2':
			skinName="油性";
			break;
		case '3':
			skinName="混合性";
			break;
		case '4':
			skinName="中性";
			break;
		default:
			break;
		}
		return skinName;
	}
	
	/**
	 * 肤质名称对应的号码
	 * @param skin
	 * @return
	 */
	public static String transSkinNameToId(String skin) {
		if(skin==null){  //空值返回“0”
			return "0";
		}
		String result="";
		if(skin.equals("干性")){
			result="1";
		}else if(skin.equals("油性")){
			result="2";
		}
		else if(skin.equals("混合性")){
			result="3";
		}
		else if(skin.equals("中性")){
			result="4";
		}else {
			result="0";
		}
		return result;
	}
	
	/**
	 * DATE类型的数据转化为string
	 * @param birthday
	 * @return
	 */
	public static String transBirthday(Date birthday) {
		return birthday.toString().substring(0,10);
	}

	/**
	 * 用户标签名字转换为号码（6为号码 两两一位）
	 * @param userTags
	 * @return
	 */
	public static String transUserTagsNameToId(String userTags) {
		String result="";
		String[] userTagNames=userTags.split(",");
		for (int i = 0; i < userTagNames.length; i++) {
			result+=getUserTagsId(userTagNames[i]);
		}
		int j=MAXUSERTAGS;
		while(j>userTagNames.length){
			result+="00";
			j--;
		}
		return result;
	}
	
	private static String getUserTagsId(String userTags){
		int userId=0;
		for (int i = 0; i < systemUserTag.length; i++) {
			if(userTags.equals(systemUserTag[i])){
				userId=i+1;
			}
		}
		if(userId<10)
		{
			return "0"+userId;
		}else{
			return userId+"";
		}
		}

	/**
	 * 用户标签号码转换为名字（6为号码 两两一位）
	 * @param userTags
	 * @return
	 */
	public static String transUserTagsIdToName(String userTags) {
		String result="";
		for(int i=0;i<MAXUSERTAGS;i++){
			String userTag=userTags.substring(i*2,i*2+2);
			if(!userTag.equals("00")){
				result+=getUserTagsName(userTag);
			}else{
				result=result.substring(0,result.length()-1);
			}
			if(i!=MAXUSERTAGS-1){
				result+=",";
			}
		}
		return result;
	}
	private static String getUserTagsName(String userTags){
		String userTag="";
		int userId=Integer.parseInt(userTags);
		return systemUserTag[userId-1];
	}
}
