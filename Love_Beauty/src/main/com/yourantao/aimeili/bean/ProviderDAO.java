package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Provider entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Provider
 * @author MyEclipse Persistence Tools
 */

public class ProviderDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ProviderDAO.class);
	// property constants
	public static final String PROVIDER_NAME = "providerName";
	public static final String PROVIDER_THUMB = "providerThumb";
	public static final String PROVIDER_DESCRIPTION = "providerDescription";
	public static final String PROVIDER_SERVICE = "providerService";
	public static final String PROVIDER_DELIVER = "providerDeliver";

	protected void initDao() {
		// do nothing
	}

	public void save(Provider transientInstance) {
		log.debug("saving Provider instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Provider persistentInstance) {
		log.debug("deleting Provider instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Provider findById(java.lang.Integer id) {
		log.debug("getting Provider instance with id: " + id);
		try {
			Provider instance = (Provider) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Provider", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Provider instance) {
		log.debug("finding Provider instance by example");
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
		log.debug("finding Provider instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Provider as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByProviderName(Object providerName) {
		return findByProperty(PROVIDER_NAME, providerName);
	}

	public List findByProviderThumb(Object providerThumb) {
		return findByProperty(PROVIDER_THUMB, providerThumb);
	}

	public List findByProviderDescription(Object providerDescription) {
		return findByProperty(PROVIDER_DESCRIPTION, providerDescription);
	}

	public List findByProviderService(Object providerService) {
		return findByProperty(PROVIDER_SERVICE, providerService);
	}

	public List findByProviderDeliver(Object providerDeliver) {
		return findByProperty(PROVIDER_DELIVER, providerDeliver);
	}

	public List findAll() {
		log.debug("finding all Provider instances");
		try {
			String queryString = "from Provider";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Provider merge(Provider detachedInstance) {
		log.debug("merging Provider instance");
		try {
			Provider result = (Provider) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Provider instance) {
		log.debug("attaching dirty Provider instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Provider instance) {
		log.debug("attaching clean Provider instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ProviderDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ProviderDAO) ctx.getBean("ProviderDAO");
	}
}