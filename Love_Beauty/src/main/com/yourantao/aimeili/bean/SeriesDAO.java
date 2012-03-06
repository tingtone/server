package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Series entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Series
 * @author MyEclipse Persistence Tools
 */

public class SeriesDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(SeriesDAO.class);
	// property constants
	public static final String SERIES_NAME = "seriesName";
	public static final String BRAND_ID = "brandId";
	public static final String SERIES_DESCRIPTION = "seriesDescription";

	protected void initDao() {
		// do nothing
	}

	public void save(Series transientInstance) {
		log.debug("saving Series instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Series persistentInstance) {
		log.debug("deleting Series instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Series findById(java.lang.Integer id) {
		log.debug("getting Series instance with id: " + id);
		try {
			Series instance = (Series) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Series", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Series instance) {
		log.debug("finding Series instance by example");
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
		log.debug("finding Series instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Series as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySeriesName(Object seriesName) {
		return findByProperty(SERIES_NAME, seriesName);
	}

	public List findByBrandId(Object brandId) {
		return findByProperty(BRAND_ID, brandId);
	}

	public List findBySeriesDescription(Object seriesDescription) {
		return findByProperty(SERIES_DESCRIPTION, seriesDescription);
	}

	public List findAll() {
		log.debug("finding all Series instances");
		try {
			String queryString = "from Series";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Series merge(Series detachedInstance) {
		log.debug("merging Series instance");
		try {
			Series result = (Series) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Series instance) {
		log.debug("attaching dirty Series instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Series instance) {
		log.debug("attaching clean Series instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SeriesDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SeriesDAO) ctx.getBean("SeriesDAO");
	}
}