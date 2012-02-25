package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * TopicGoods entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.TopicGoods
 * @author MyEclipse Persistence Tools
 */

public class TopicGoodsDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TopicGoodsDAO.class);
	// property constants
	public static final String TOPIC_ID = "topicId";
	public static final String GOODS_ID = "goodsId";
	public static final String GOODS_NOTE = "goodsNote";

	protected void initDao() {
		// do nothing
	}

	public void save(TopicGoods transientInstance) {
		log.debug("saving TopicGoods instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TopicGoods persistentInstance) {
		log.debug("deleting TopicGoods instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TopicGoods findById(java.lang.Integer id) {
		log.debug("getting TopicGoods instance with id: " + id);
		try {
			TopicGoods instance = (TopicGoods) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.TopicGoods", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TopicGoods instance) {
		log.debug("finding TopicGoods instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TopicGoods instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TopicGoods as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTopicId(Object topicId) {
		return findByProperty(TOPIC_ID, topicId);
	}

	public List findByGoodsId(Object goodsId) {
		return findByProperty(GOODS_ID, goodsId);
	}

	public List findByGoodsNote(Object goodsNote) {
		return findByProperty(GOODS_NOTE, goodsNote);
	}

	public List findAll() {
		log.debug("finding all TopicGoods instances");
		try {
			String queryString = "from TopicGoods";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TopicGoods merge(TopicGoods detachedInstance) {
		log.debug("merging TopicGoods instance");
		try {
			TopicGoods result = (TopicGoods) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TopicGoods instance) {
		log.debug("attaching dirty TopicGoods instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TopicGoods instance) {
		log.debug("attaching clean TopicGoods instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TopicGoodsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TopicGoodsDAO) ctx.getBean("TopicGoodsDAO");
	}
}