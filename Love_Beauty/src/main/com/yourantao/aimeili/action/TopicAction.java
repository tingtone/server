package main.com.yourantao.aimeili.action;

import java.util.ArrayList;
import java.util.List;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.conf.Config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

@SuppressWarnings("serial")
public class TopicAction extends BaseAction{
	private static final Logger logger = LoggerFactory.getLogger(TopicAction.class);
	
	public String getTopic(){
		
		List<Brand> brands = new ArrayList<Brand>();
		ApplicationContext ac = Config.getACInstant();
		BrandDAO td = BrandDAO.getFromApplicationContext(ac);
		brands = td.findRank();
		outputJson(brands.toString());
		
		return null;
	}
}
