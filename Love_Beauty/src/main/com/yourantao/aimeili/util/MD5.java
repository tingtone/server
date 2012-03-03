package main.com.yourantao.aimeili.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import main.com.yourantao.aimeili.action.TopicAction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * MD5加密工具类
 * 
 * @author mac 创建时间： 2012-3-2 上午10:12:54 修改时间：2012-3-2 上午10:12:54 具体描述： TODO
 */
public class MD5 {
	private static final Logger LOG = LoggerFactory
			.getLogger(TopicAction.class);

	public static String md5(String str) {
		String s = str;
		if (s == null) {
			return "";
		} else {
			String value = null;
			MessageDigest md5 = null;
			try {
				md5 = MessageDigest.getInstance("MD5");
			} catch (NoSuchAlgorithmException ex) {
				LOG.info(ex.getMessage());
			}
			sun.misc.BASE64Encoder baseEncoder = new sun.misc.BASE64Encoder();
			try {
				value = baseEncoder.encode(md5.digest(s.getBytes("utf-8")));
			} catch (Exception ex) {
			}
			return value;
		}
	}
}
