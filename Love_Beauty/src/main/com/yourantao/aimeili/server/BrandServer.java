package main.com.yourantao.aimeili.server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

/**
 * 品牌接口服务
 * 
 * @author mac 创建时间： 2012-2-22 上午11:47:51 修改时间：2012-2-22 上午11:47:51
 *         具体描述：品牌接口的服务，包括 获得全部品牌名（待续）
 */
public class BrandServer implements Constant {

	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(BrandServer.class);
	private HttpServletRequest request;

	public BrandServer(HttpServletRequest req) {
		this.request = req;
	}

	/*
	 * 获得品牌list
	 * (品牌名，品牌别名)
	 */
	public JSONArray getBrandList() {
		List<Brand> brands = new ArrayList<Brand>();
		ApplicationContext ac = Config.getACInstant();
		BrandDAO td = BrandDAO.getFromApplicationContext(ac);
		brands = td.findRank();
		JSONArray jsonArray = JSONArray.fromObject(brands);

		return jsonArray;

	}
}
