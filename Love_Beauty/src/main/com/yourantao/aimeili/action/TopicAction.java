package main.com.yourantao.aimeili.action;

import java.util.List;

import main.com.yourantao.aimeili.bean.TopicDAO;
import main.com.yourantao.aimeili.bean.TopicGoodsDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

@SuppressWarnings("serial")
public class TopicAction extends BaseAction implements Constant {
	private static final Logger logger = LoggerFactory
			.getLogger(TopicAction.class);

	private Integer getIntegerParameter(String paraName) {
		int ret = 0;
		try {
			ret = Integer.valueOf(getReqeust().getParameter(paraName));
		} catch (Exception e) {
			return null;
		}
		return ret;
	}

	public String getTopicsOfCategory() {
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null)
			return null;

		ApplicationContext ac = Config.getACInstant();
		TopicDAO topicDAO = TopicDAO.getFromApplicationContext(ac);
		List topics = topicDAO.findByCategoryId(categoryId);
		printArray(topics);

		return null;
	}

	public String getTopicGoods() {
		Integer topicId = getIntegerParameter(TOPIC_ID);
		if (topicId == null)
			return null;
		
		ApplicationContext ac = Config.getACInstant();
		TopicGoodsDAO topicGoodsDAO = TopicGoodsDAO.getFromApplicationContext(ac);
		List goods = topicGoodsDAO.findByTopicId(topicId);
		printArray(goods);

		return null;
	}
}
