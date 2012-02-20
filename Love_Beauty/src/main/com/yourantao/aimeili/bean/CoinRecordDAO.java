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
 * CoinRecord entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.CoinRecord
 * @author MyEclipse Persistence Tools
 */

public class CoinRecordDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(CoinRecordDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String RECORD_TYPE = "recordType";
	public static final String RELATED_ID = "relatedId";
	public static final String VARIATION = "variation";

	protected void initDao() {
		// do nothing
	}

	public void save(CoinRecord transientInstance) {
		log.debug("saving CoinRecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CoinRecord persistentInstance) {
		log.debug("deleting CoinRecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CoinRecord findById(java.lang.Integer id) {
		log.debug("getting CoinRecord instance with id: " + id);
		try {
			CoinRecord instance = (CoinRecord) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.CoinRecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CoinRecord instance) {
		log.debug("finding CoinRecord instance by example");
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
		log.debug("finding CoinRecord instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CoinRecord as model where model."
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

	public List findByRecordType(Object recordType) {
		return findByProperty(RECORD_TYPE, recordType);
	}

	public List findByRelatedId(Object relatedId) {
		return findByProperty(RELATED_ID, relatedId);
	}

	public List findByVariation(Object variation) {
		return findByProperty(VARIATION, variation);
	}

	public List findAll() {
		log.debug("finding all CoinRecord instances");
		try {
			String queryString = "from CoinRecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CoinRecord merge(CoinRecord detachedInstance) {
		log.debug("merging CoinRecord instance");
		try {
			CoinRecord result = (CoinRecord) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CoinRecord instance) {
		log.debug("attaching dirty CoinRecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CoinRecord instance) {
		log.debug("attaching clean CoinRecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CoinRecordDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CoinRecordDAO) ctx.getBean("CoinRecordDAO");
	}
}