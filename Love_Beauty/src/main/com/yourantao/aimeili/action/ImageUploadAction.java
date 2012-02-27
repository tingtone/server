package main.com.yourantao.aimeili.action;

import java.util.List;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.conf.Config;
import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

/**
 * 
 * 图片上传
 * @author whp
 * 创建时间： 2012-2-25 下午04:38:05
 * 修改时间：2012-2-25 下午04:38:05
 * 具体描述： TODO
 */
@SuppressWarnings("serial")
public class ImageUploadAction extends BaseAction{
	private static final Logger logger = LoggerFactory.getLogger(ImageUploadAction.class);
	
	public String getTopic(){
		
//		List<Brand> brands = new ArrayList<Brand>();
		ApplicationContext ac = Config.getACInstant();
		BrandDAO td = BrandDAO.getFromApplicationContext(ac);
		List<Brand> brands = td.findRank();
		JSONArray json = JSONArray.fromObject(brands);
		outputJson(json.toString());
		
		return null;
	}
}