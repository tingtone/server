package main.com.yourantao.aimeili.bean;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Topic
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Topic
 * @author MyEclipse Persistence Tools
 */

public class TopicDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(TopicDAO.class);
	// property constants
	public static final String TOPIC_NAME = "topicName";
	public static final String CATEGORY_ID = "categoryId";
	public static final String TOPIC_KEYWORDS = "topicKeywords";
	public static final String TOPIC_IMAGES_ID = "topicImagesId";
	public static final String TOPIC_RANK = "topicRank";
	public static final String TOPIC_THUMB_ID = "topicThumbId";

	protected void initDao() {
		// do nothing
	}

	public void save(Topic transientInstance) {
		log.debug("saving Topic instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Topic persistentInstance) {
		log.debug("deleting Topic instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Topic findById(java.lang.Integer id) {
		log.debug("getting Topic instance with id: " + id);
		try {
			Topic instance = (Topic) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Topic", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Topic instance) {
		log.debug("finding Topic instance by example");
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
		log.debug("finding Topic instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Topic as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTopicName(Object topicName) {
		return findByProperty(TOPIC_NAME, topicName);
	}

	public List findByCategoryId(Object categoryId) {
		return findByProperty(CATEGORY_ID, categoryId);
	}

	public List findByTopicKeywords(Object topicKeywords) {
		return findByProperty(TOPIC_KEYWORDS, topicKeywords);
	}

	public List findByTopicImagesId(Object topicImagesId) {
		return findByProperty(TOPIC_IMAGES_ID, topicImagesId);
	}

	public List findByTopicRank(Object topicRank) {
		return findByProperty(TOPIC_RANK, topicRank);
	}

	public List findByTopicThumbId(Object topicThumbId) {
		return findByProperty(TOPIC_THUMB_ID, topicThumbId);
	}

	public List findAll() {
		log.debug("finding all Topic instances");
		try {
			String queryString = "from Topic";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Topic merge(Topic detachedInstance) {
		log.debug("merging Topic instance");
		try {
			Topic result = (Topic) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Topic instance) {
		log.debug("attaching dirty Topic instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Topic instance) {
		log.debug("attaching clean Topic instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TopicDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TopicDAO) ctx.getBean("TopicDAO");
	}
	/**
	 * 自定义更新数据库 更新专题信息（名字，关键词，缩略图和大图）
	 * 
	 * @param topic
	 */
	public void updateTopic(Topic topic) {
		String hql = "update Topic set ";
		String hqlset = "";
		log.info(topic.getTopicName());
		if (topic.getTopicName() != "" && !topic.getTopicName().equals(""))
			hqlset += "topic_name='" + topic.getTopicName() + "' ,";
		if (topic.getTopicKeywords() != ""
				&& !topic.getTopicKeywords().equals(""))
			hqlset += "topic_keywords='" + topic.getTopicKeywords() + "' ,";
		if (topic.getTopicImagesId() != null)
			hqlset += "topic_images_id='" + topic.getTopicImagesId() + "' ,";
		if (topic.getTopicThumbId() != null)
			hqlset += "topic_thumb_id='" + topic.getTopicThumbId() + "' ,";

		if (!hqlset.equals("")) {
			hql += hqlset;
			hql = hql.substring(0, hql.length() - 1);
			hql += " where topic_id=" + topic.getTopicId();
			Query queryupdate = getSession().createQuery(hql);
			int ret = queryupdate.executeUpdate();
		}
	}
}