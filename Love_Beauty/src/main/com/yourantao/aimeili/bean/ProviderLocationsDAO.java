package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * ProviderLocations entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.ProviderLocations
 * @author MyEclipse Persistence Tools
 */

public class ProviderLocationsDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ProviderLocationsDAO.class);
	// property constants
	public static final String PROVIDER_ID = "providerId";
	public static final String PROVINCE = "province";
	public static final String CITY = "city";
	public static final String DISTRIC = "distric";

	protected void initDao() {
		// do nothing
	}

	public void save(ProviderLocations transientInstance) {
		log.debug("saving ProviderLocations instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ProviderLocations persistentInstance) {
		log.debug("deleting ProviderLocations instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ProviderLocations findById(java.lang.Integer id) {
		log.debug("getting ProviderLocations instance with id: " + id);
		try {
			ProviderLocations instance = (ProviderLocations) getHibernateTemplate()
					.get("main.com.yourantao.aimeili.bean.ProviderLocations",
							id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ProviderLocations instance) {
		log.debug("finding ProviderLocations instance by example");
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
		log.debug("finding ProviderLocations instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ProviderLocations as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByProviderId(Object providerId) {
		return findByProperty(PROVIDER_ID, providerId);
	}

	public List findByProvince(Object province) {
		return findByProperty(PROVINCE, province);
	}

	public List findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List findByDistric(Object distric) {
		return findByProperty(DISTRIC, distric);
	}

	public List findAll() {
		log.debug("finding all ProviderLocations instances");
		try {
			String queryString = "from ProviderLocations";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ProviderLocations merge(ProviderLocations detachedInstance) {
		log.debug("merging ProviderLocations instance");
		try {
			ProviderLocations result = (ProviderLocations) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ProviderLocations instance) {
		log.debug("attaching dirty ProviderLocations instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ProviderLocations instance) {
		log.debug("attaching clean ProviderLocations instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ProviderLocationsDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ProviderLocationsDAO) ctx.getBean("ProviderLocationsDAO");
	}
}