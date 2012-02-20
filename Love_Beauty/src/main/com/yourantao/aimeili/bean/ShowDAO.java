package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Show
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Show
 * @author MyEclipse Persistence Tools
 */

public class ShowDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ShowDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String SHOW_TYPE = "showType";
	public static final String SHOW_TAGS = "showTags";
	public static final String SHOW_IMAGES = "showImages";
	public static final String SHOW_TITLE = "showTitle";
	public static final String CONTENT_TYPE = "contentType";
	public static final String SHOW_CONTENT = "showContent";
	public static final String SHOW_RANK = "showRank";

	protected void initDao() {
		// do nothing
	}

	public void save(Show transientInstance) {
		log.debug("saving Show instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Show persistentInstance) {
		log.debug("deleting Show instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Show findById(java.lang.Integer id) {
		log.debug("getting Show instance with id: " + id);
		try {
			Show instance = (Show) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Show", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Show instance) {
		log.debug("finding Show instance by example");
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
		log.debug("finding Show instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Show as model where model."
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

	public List findByShowType(Object showType) {
		return findByProperty(SHOW_TYPE, showType);
	}

	public List findByShowTags(Object showTags) {
		return findByProperty(SHOW_TAGS, showTags);
	}

	public List findByShowImages(Object showImages) {
		return findByProperty(SHOW_IMAGES, showImages);
	}

	public List findByShowTitle(Object showTitle) {
		return findByProperty(SHOW_TITLE, showTitle);
	}

	public List findByContentType(Object contentType) {
		return findByProperty(CONTENT_TYPE, contentType);
	}

	public List findByShowContent(Object showContent) {
		return findByProperty(SHOW_CONTENT, showContent);
	}

	public List findByShowRank(Object showRank) {
		return findByProperty(SHOW_RANK, showRank);
	}

	public List findAll() {
		log.debug("finding all Show instances");
		try {
			String queryString = "from Show";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Show merge(Show detachedInstance) {
		log.debug("merging Show instance");
		try {
			Show result = (Show) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Show instance) {
		log.debug("attaching dirty Show instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Show instance) {
		log.debug("attaching clean Show instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ShowDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ShowDAO) ctx.getBean("ShowDAO");
	}
}