package main.com.yourantao.aimeili.server;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.bean.TopicGoodsDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

public class TopicServer implements Constant {

	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(TopicServer.class);
	private HttpServletRequest request;

	public TopicServer(HttpServletRequest req) {
		this.request = req;
	}

	/**
	 * 通过tid获得相应商品信息
	 * @return
	 */
	public String getTopicGoods() {
		Integer topicId = getIntegerParameter(TOPIC_ID);
		if (topicId == null)
			return null;
		
		ApplicationContext ac = Config.getInstant();
		TopicGoodsDAO topicGoodsDAO = TopicGoodsDAO.getFromApplicationContext(ac);
		List goods = topicGoodsDAO.findByTopicId(topicId);
		JSONArray jsonArray = JSONArray.fromObject(goods);

		return jsonArray.toString();
	}
	
	private Integer getIntegerParameter(String paraName) {
		int ret = 0;
		try {
			ret = Integer.valueOf(request.getParameter(paraName));
		} catch (Exception e) {
			return null;
		}
		return ret;
	}
}
