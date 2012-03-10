package main.com.yourantao.aimeili.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;

public class MD5 {
	private static final Logger LOG = LoggerFactory.getLogger(MD5.class);
	protected static final char hexDigits[] = { '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	/**
	 * 计算文件的MD5值，并将结果转换为16进制数表示法
	 * 
	 * @param file
	 *            要计算MD5值的文件
	 * @return 16进制数表示法表示的MD5字符串
	 */
	public static String md5(File file) {
		try {
			FileInputStream fis = new FileInputStream(file);
			MappedByteBuffer byteBuffer = fis.getChannel().map(
					FileChannel.MapMode.READ_ONLY, 0, file.length());
			MessageDigest md5 = getMD5Instance();
			md5.update(byteBuffer);
			return bufferToHex(md5.digest());
		} catch (IOException e) {
			LOG.error("md5 file [" + file.getName() + "] error!", e);
			return null;
		}
	}

	/**
	 * 计算字符串的MD5值，并将结果转换为16进制数表示法
	 * 
	 * @param str
	 *            要计算MD5值的字符串
	 * @return 16进制数表示法表示的MD5字符串
	 */
	public static String md5(String str) {
		MessageDigest md5 = getMD5Instance();
		try {
			return bufferToHex(md5.digest(str.getBytes("utf-8")));
		} catch (UnsupportedEncodingException e) {
			LOG.error("md5 string [" + str + "] error!", e);
			return null;
		}
	}

	private static MessageDigest getMD5Instance() {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			LOG.error("get MD5 instance error!", e);
		}
		return md5;
	}

	private static String bufferToHex(byte bytes[]) {
		StringBuffer buffer = new StringBuffer();
		int length = bytes.length;
		for (int i = 0; i < length; i++) {
			buffer.append(hexDigits[(bytes[i] & 0xf0) >> 4]);
			buffer.append(hexDigits[bytes[i] & 0xf]);
		}
		return buffer.toString();
	}
}
