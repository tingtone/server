package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Search entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Search
 * @author MyEclipse Persistence Tools
 */

public class SearchDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(SearchDAO.class);
	// property constants
	public static final String SEARCH_KEYWORD = "searchKeyword";
	public static final String SEARCH_IMAGE_ID = "searchImageId";
	public static final String SEARCH_RANK = "searchRank";

	protected void initDao() {
		// do nothing
	}

	public void save(Search transientInstance) {
		log.debug("saving Search instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Search persistentInstance) {
		log.debug("deleting Search instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Search findById(java.lang.Integer id) {
		log.debug("getting Search instance with id: " + id);
		try {
			Search instance = (Search) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Search", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Search instance) {
		log.debug("finding Search instance by example");
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
		log.debug("finding Search instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Search as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySearchKeyword(Object searchKeyword) {
		return findByProperty(SEARCH_KEYWORD, searchKeyword);
	}

	public List findBySearchImageId(Object searchImageId) {
		return findByProperty(SEARCH_IMAGE_ID, searchImageId);
	}

	public List findBySearchRank(Object searchRank) {
		return findByProperty(SEARCH_RANK, searchRank);
	}

	public List findAll() {
		log.debug("finding all Search instances");
		try {
			String queryString = "from Search";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Search merge(Search detachedInstance) {
		log.debug("merging Search instance");
		try {
			Search result = (Search) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Search instance) {
		log.debug("attaching dirty Search instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Search instance) {
		log.debug("attaching clean Search instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SearchDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SearchDAO) ctx.getBean("SearchDAO");
	}
}