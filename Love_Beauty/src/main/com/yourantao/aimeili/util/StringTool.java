package main.com.yourantao.aimeili.util;

public class StringTool {

	/**
	 * 去除字符串中的特殊字符
	 * 
	 * @param word
	 * @return
	 */
	public static String filterWord(String word) {
		if (word == null) {
			return "";
		}
		word = word.toLowerCase().replace('/', '0').replace('\\', '1');
		return word;
	}
}
