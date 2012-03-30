package main.com.yourantao.aimeili.util.codpreprocessing;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import main.com.yourantao.aimeili.bean.UserAddress;

/**
 * 判断是否可以货到付款的基类，实现了一些通用的方法
 * 
 * @author kfirst
 * 
 */
abstract class BaseCOD implements CODJudgement {
	private static final String REGEX1 = "\\(.*\\)";
	private static final String REGEX2 = "市*$|县*$|区*$|旗*$";

	private static String replace(final String sourceString,
			final String regex, final String replacement) {
		return sourceString.replaceAll(regex, replacement).trim();
	}

	/**
	 * 将省名转化为统一的格式，以便比较。
	 * 
	 * @param province
	 *            省名
	 * @return 统一格式的省名
	 */
	protected static String getProvinceName(String province) {
		return province.trim().substring(0, 2);
	}

	/**
	 * 将城市名或区县名转化为统一的格式，以便比较。
	 * 
	 * @param cityOrDistrict
	 *            城市名或者区县名
	 * @return 统一格式的城市名或区县名
	 */
	protected static String getCityOrDistrictName(String cityOrDistrict) {
		return replace(replace(cityOrDistrict, REGEX1, ""), REGEX2, "");
	}

	/**
	 * 获取给定url的内容
	 * 
	 * @param url
	 *            URL
	 * @return 内容
	 */
	protected static String getContent(String url) {
		StringBuilder result = new StringBuilder();
		try {
			URL U = new URL(url);
			URLConnection connection = U.openConnection();
			connection.connect();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
			String line = in.readLine();
			while ((line = in.readLine()) != null) {
				if (line.trim().isEmpty())
					continue;
				result.append(line);
			}
			in.close();
		} catch (Exception e) {
		}
		return result.toString();
	}

	/**
	 * 判断是否为直辖市
	 * 
	 * @param city
	 *            城市名
	 * @return 是否为直辖市
	 */
	protected static boolean isRegions(String city) {
		city = getCityOrDistrictName(city);
		if (city.equals("重庆") || city.equals("北京") || city.equals("上海")
				|| city.equals("天津"))
			return true;
		return false;
	}

	protected static boolean containsBracket(String str) {
		return str.contains("(");
	}

	/**
	 * 是否支持货到付款
	 * <p />
	 * <strong>注意：所有的子类都应该重载该方法，以实现正确的判断</strong>
	 * 
	 * @param address
	 *            用户地址持久化类
	 * @return 2表示支持，1表示部分地区支持，0表示不支持，
	 */
	public int supportCOD(UserAddress address) {
		return NONSUPPORT;
	}

	/**
	 * 返回该地址支持货到付款的区域，该函数只有当supportCOD返回NONSUPPORT时有效。
	 * 
	 * @param address
	 *            用户地址持久化类
	 * @return 返回该地址支持货到付款的区域
	 */
	public String supportArea(UserAddress address) {
		return "";
	}
}
