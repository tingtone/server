package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Keyword entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Keyword
 * @author MyEclipse Persistence Tools
 */

public class KeywordDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(KeywordDAO.class);
	// property constants
	public static final String KEYWORD = "keyword";
	public static final String KEYWORD_COUNT = "keywordCount";
	public static final String KEYWORD_RANK = "keywordRank";

	protected void initDao() {
		// do nothing
	}

	public void save(Keyword transientInstance) {
		log.debug("saving Keyword instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Keyword persistentInstance) {
		log.debug("deleting Keyword instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Keyword findById(java.lang.Integer id) {
		log.debug("getting Keyword instance with id: " + id);
		try {
			Keyword instance = (Keyword) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Keyword", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Keyword instance) {
		log.debug("finding Keyword instance by example");
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
		log.debug("finding Keyword instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Keyword as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByKeyword(Object keyword) {
		return findByProperty(KEYWORD, keyword);
	}

	public List findByKeywordCount(Object keywordCount) {
		return findByProperty(KEYWORD_COUNT, keywordCount);
	}

	public List findByKeywordRank(Object keywordRank) {
		return findByProperty(KEYWORD_RANK, keywordRank);
	}

	public List findAll() {
		log.debug("finding all Keyword instances");
		try {
			String queryString = "from Keyword";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Keyword merge(Keyword detachedInstance) {
		log.debug("merging Keyword instance");
		try {
			Keyword result = (Keyword) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Keyword instance) {
		log.debug("attaching dirty Keyword instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Keyword instance) {
		log.debug("attaching clean Keyword instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static KeywordDAO getFromApplicationContext(ApplicationContext ctx) {
		return (KeywordDAO) ctx.getBean("KeywordDAO");
	}
}