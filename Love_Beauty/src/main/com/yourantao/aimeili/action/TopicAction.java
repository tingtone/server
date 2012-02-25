package main.com.yourantao.aimeili.action;

import java.util.ArrayList;
import java.util.List;

import javax.jms.Topic;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.bean.TopicDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

@SuppressWarnings("serial")
public class TopicAction extends BaseAction implements Constant {
	private static final Logger logger = LoggerFactory
			.getLogger(TopicAction.class);

	public String getTopic() {
		List<Brand> brands = new ArrayList<Brand>();
		ApplicationContext ac = Config.getACInstant();
		BrandDAO td = BrandDAO.getFromApplicationContext(ac);
		brands = td.findRank();
		printObject(brands);

		return null;
	}

	public String getTopicsOfCategory() {
		int categoryId = 0;
		try {
			categoryId = Integer.valueOf(getReqeust().getParameter(CATEGORY_ID));
		} catch (NumberFormatException e) {
			return null;
		}

		ApplicationContext ac = Config.getACInstant();
		TopicDAO topicDAO = TopicDAO.getFromApplicationContext(ac);
		List topics = topicDAO.findByCategoryId(categoryId);
		printArray(topics);

		return null;
	}
}
