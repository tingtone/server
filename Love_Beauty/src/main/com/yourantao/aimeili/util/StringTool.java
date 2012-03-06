package main.com.yourantao.aimeili.util;

public class StringTool {

	/**
	 * 去除字符串中的特殊字符'/'
	 * 
	 * @param word
	 * @return
	 */
	public static String filterWord(String word) {
		StringBuilder builder = new StringBuilder();
		if (word == null) {
			return "";
		}
		word = word.toLowerCase().replaceAll("/", "");
		return word;
	}
}
