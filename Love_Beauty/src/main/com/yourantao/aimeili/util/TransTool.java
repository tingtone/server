package main.com.yourantao.aimeili.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TransTool {
	private static final Logger LOG = LoggerFactory.getLogger(TransTool.class);
	public static String transSkin(String skin) {
		
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
		case '5':
			skinName="敏感性";
			break;

		default:
			break;
		}
		return skinName;
	}
}
