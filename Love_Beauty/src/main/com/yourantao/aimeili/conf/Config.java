package main.com.yourantao.aimeili.conf;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author whp
 * @创建时间： 2012-2-20 下午06:32:36
 * @修改时间：2012-2-20 下午06:32:36
 * @具体描述： 基本配置类
 */
public class Config {

	public static ApplicationContext ac;
	public static Properties properties;

	private static final String springPath = "applicationContext.xml";
	//private static final String configPath = "C:/Users/kfirst/Workspaces/MyEclipse 8.6/.metadata/.me_tcat/webapps/Love_Beauty/WEB-INF/classes/config.properties";   
	private static final String configPath = System.getProperty("configPath")+"/config.properties";   

	// 配置文件中的key值
	public static final String BASE_SERVER = "BASE_SERVER"; // 服务链接地址
	public static final String BASE_IMAGEURL = "BASE_IMAGEURL"; // 图片服务器链接地址
	public static final String BASE_IMAGESTORAGE = "BASE_IMAGESTORAGE"; // 本地存储文件位置
	public static final String JINGDONG_UNIONID = "JINGDONG_UNIONID"; // 京东销售联盟ID（需要重新申请）
	public static final String TAOBAOKE_PID = "TAOBAOKE_PID"; // 淘宝客PID(kittypad)
	public static final String DANGDANG_PID = "DANGDANG_PID"; // 当当推广联盟ID(kittypad)
	public static final String JINGDONG_UNION_BASEURL = "JINGDONG_UNION_BASEURL"; // 京东销售联盟URL转换方式JINGDONG_UNION_BASEURL+URL
	public static final String DANGDANG_BASEURL = "DANGDANG_BASEURL"; // 当当推广联盟URL转换方式DANGDANG_BASEURL+URL

	/*
	 * 数据库初始化
	 */
	public static void init() {
		ac = new ClassPathXmlApplicationContext(springPath);
		properties = new Properties();
		try {
			properties.load(new FileInputStream(configPath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static ApplicationContext getInstant() {
		return ac;
	}

	public static String get(String key) {
		return properties.getProperty(key);
	}
}