package main.com.yourantao.aimeili.util.codpreprocessing;

import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DangDangCOD extends BaseCOD {
	private final static String DANG_DANG_URL_PREFIX_FETCH = "http://misc2.dangdang.com/help/help_delivery_ajax.php?parent_id=";
	private final static String DANG_DANG_URL_PREFIX_DETAIL = "http://misc2.dangdang.com/help/get_instruction_ajax.php?id=";

	public static String getCodStr() {
		StringBuilder result = new StringBuilder();
		StringBuilder normalResult = new StringBuilder();
		StringBuilder emergeResult = new StringBuilder();
		String urlEntrance = DANG_DANG_URL_PREFIX_FETCH + 9000;
		String countryJS = getContent(urlEntrance);
		JSONObject countryJO = JSONObject.fromObject(countryJS);
		JSONArray provinceJA = countryJO.getJSONArray("regions");

		for (int provinceIndex = 0; provinceIndex < provinceJA.size(); provinceIndex++) {
			/* int provinceIndex = 0; */
			String provinceName = provinceJA.getJSONObject(provinceIndex)
					.getString("name");// 省份
			System.out.println(provinceName);
			String provinceId = provinceJA.getJSONObject(provinceIndex)
					.getString("id");
			String urlProvince = DANG_DANG_URL_PREFIX_FETCH + provinceId;
			String provinceJS = getContent(urlProvince);
			JSONObject provinceJO = JSONObject.fromObject(provinceJS);
			JSONArray cityJA = provinceJO.getJSONArray("regions");

			for (int cityIndex = 0; cityIndex < cityJA.size(); cityIndex++) {
				String cityName = cityJA.getJSONObject(cityIndex).getString(
						"name");// 市
				System.out.println("\t" + cityName);
				String cityId = cityJA.getJSONObject(cityIndex).getString("id");
				String urlCity = DANG_DANG_URL_PREFIX_FETCH + cityId;
				String cityJS = getContent(urlCity);
				JSONObject cityJO = JSONObject.fromObject(cityJS);
				JSONArray districJA = cityJO.getJSONArray("regions");
				if (districJA.isEmpty()) {
					String urlDistric = DANG_DANG_URL_PREFIX_DETAIL+cityId;
					String districDes = getContent(urlDistric);
					// System.out.println(districDes);
					JSONObject districJO = JSONObject
							.fromObject(districDes);
					if (!districJO.getString("errorCode").equals(0))
						continue;
					JSONArray detailJA = districJO
							.getJSONArray("ship_types");

					for (int oIndex = 0; oIndex < detailJA.size(); oIndex++) {
						Integer shipType = Integer.valueOf(detailJA
								.getJSONObject(oIndex).getString(
										"ship_type"));
						if (shipType == null)
							continue;
						String codAreaDesc = detailJA.getJSONObject(oIndex)
								.getString("cod_area_desc");
						switch (shipType) {
						case 1:
							normalResult.append(provinceName + "\t"
									+ cityName + "\t" + " " + "\t"
									+ codAreaDesc + "\r\n");
							break;
						case 5:
							emergeResult.append(provinceName + "\t"
									+ cityName + "\t" + " " + "\t"
									+ codAreaDesc + "\r\n");
							break;
						}
					}
				} else {
					for (int districIndex = 0; districIndex < districJA.size(); districIndex++) {
						String districName = districJA.getJSONObject(
								districIndex).getString("name");// 区
						System.out.println("\t\t" + districName);
						String districId = districJA
								.getJSONObject(districIndex).getString("id");
						String urlDistric = DANG_DANG_URL_PREFIX_DETAIL
								+ districId;
						String districDes = getContent(urlDistric);
						// System.out.println(districDes);
						JSONObject districJO = JSONObject
								.fromObject(districDes);
						if (!districJO.getString("errorCode").equals("0"))
							continue;
						JSONArray detailJA = districJO
								.getJSONArray("ship_types");
						//System.out.println(detailJA.size());
						for (int oIndex = 0; oIndex < detailJA.size(); oIndex++) {
							Integer shipType = Integer.valueOf(detailJA
									.getJSONObject(oIndex).getString(
											"ship_type"));
							if (shipType == null)
								continue;
							String codAreaDesc = detailJA.getJSONObject(oIndex)
									.getString("cod_area_desc");
							switch (shipType) {
							case 1:
								normalResult.append(provinceName + "\t"
										+ cityName + "\t" + districName + "\t"
										+ codAreaDesc + "\r\n");
								//System.out.println("in case 1");
								break;
							case 5:
								emergeResult.append(provinceName + "\t"
										+ cityName + "\t" + districName + "\t"
										+ codAreaDesc + "\r\n");
								//System.out.println("in case 2");
								break;
							}
						}

					}
				}
				// System.out.println(cityName);
			}
		}
		System.out.println("爬取数据结束");
		FileWriter normalFW;
		FileWriter emergeFW;
		try {
			normalFW = new FileWriter("E:/dangdang-normal.txt");
			System.out.println(normalResult.toString());
			normalFW.write(normalResult.toString(), 0, normalResult.length());
			normalFW.flush();
			normalFW.close();
			emergeFW = new FileWriter("E:/dangdang-emerge.txt");
			System.out.println("%%%%%");
			System.out.println("%%%%%");
			System.out.println("%%%%%");
			System.out.println(emergeResult.toString());
			emergeFW.write(emergeResult.toString(), 0, emergeResult.length());
			emergeFW.flush();
			emergeFW.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}

	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		DangDangCOD.getCodStr();
		/*
		 * FileWriter fw; try { fw = new FileWriter("E:/hello.txt"); String s =
		 * "hello world"; fw.write(s,0,s.length()); fw.flush(); } catch
		 * (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
	}

}
