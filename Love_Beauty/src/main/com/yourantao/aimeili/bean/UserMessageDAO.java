package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserMessage entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.UserMessage
 * @author MyEclipse Persistence Tools
 */

public class UserMessageDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(UserMessageDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String MESSAGE_TEXT = "messageText";
	public static final String MESSAGE_MD5 = "messageMd5";

	protected void initDao() {
		// do nothing
	}

	public void save(UserMessage transientInstance) {
		log.debug("saving UserMessage instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserMessage persistentInstance) {
		log.debug("deleting UserMessage instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserMessage findById(java.lang.Integer id) {
		log.debug("getting UserMessage instance with id: " + id);
		try {
			UserMessage instance = (UserMessage) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.UserMessage", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserMessage instance) {
		log.debug("finding UserMessage instance by example");
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
		log.debug("finding UserMessage instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserMessage as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByMessageText(Object messageText) {
		return findByProperty(MESSAGE_TEXT, messageText);
	}

	public List findByMessageMd5(Object messageMd5) {
		return findByProperty(MESSAGE_MD5, messageMd5);
	}

	public List findAll() {
		log.debug("finding all UserMessage instances");
		try {
			String queryString = "from UserMessage";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserMessage merge(UserMessage detachedInstance) {
		log.debug("merging UserMessage instance");
		try {
			UserMessage result = (UserMessage) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserMessage instance) {
		log.debug("attaching dirty UserMessage instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserMessage instance) {
		log.debug("attaching clean UserMessage instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UserMessageDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (UserMessageDAO) ctx.getBean("UserMessageDAO");
	}
}