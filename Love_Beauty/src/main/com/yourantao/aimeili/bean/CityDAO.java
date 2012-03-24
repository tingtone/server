package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for City
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.City
 * @author MyEclipse Persistence Tools
 */

public class CityDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(CityDAO.class);
	// property constants
	public static final String CITY_NAME = "cityName";
	public static final String CITY_DEEP = "cityDeep";
	public static final String CITY_ADDRESS = "cityAddress";
	public static final String CITY_PARENT_NAME = "cityParentName";

	protected void initDao() {
		// do nothing
	}

	public void save(City transientInstance) {
		log.debug("saving City instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(City persistentInstance) {
		log.debug("deleting City instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public City findById(java.lang.Integer id) {
		log.debug("getting City instance with id: " + id);
		try {
			City instance = (City) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.City", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(City instance) {
		log.debug("finding City instance by example");
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
		log.debug("finding City instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from City as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCityName(Object cityName) {
		return findByProperty(CITY_NAME, cityName);
	}

	public List findByCityDeep(Object cityDeep) {
		return findByProperty(CITY_DEEP, cityDeep);
	}

	public List findByCityAddress(Object cityAddress) {
		return findByProperty(CITY_ADDRESS, cityAddress);
	}

	public List findByCityParentName(Object cityParentName) {
		return findByProperty(CITY_PARENT_NAME, cityParentName);
	}

	public List findAll() {
		log.debug("finding all City instances");
		try {
			String queryString = "from City";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public City merge(City detachedInstance) {
		log.debug("merging City instance");
		try {
			City result = (City) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(City instance) {
		log.debug("attaching dirty City instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(City instance) {
		log.debug("attaching clean City instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CityDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CityDAO) ctx.getBean("CityDAO");
	}
}