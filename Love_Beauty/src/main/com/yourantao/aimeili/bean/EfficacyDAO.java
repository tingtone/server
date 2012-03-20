package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Efficacy entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Efficacy
 * @author MyEclipse Persistence Tools
 */

public class EfficacyDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(EfficacyDAO.class);
	// property constants
	public static final String EFFICACY_NAME = "efficacyName";
	public static final String EFFICACY_RANK = "efficacyRank";
	public static final String EFFICACY_IMAGE_ID = "efficacyImageId";

	protected void initDao() {
		// do nothing
	}

	public void save(Efficacy transientInstance) {
		log.debug("saving Efficacy instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Efficacy persistentInstance) {
		log.debug("deleting Efficacy instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Efficacy findById(java.lang.Integer id) {
		log.debug("getting Efficacy instance with id: " + id);
		try {
			Efficacy instance = (Efficacy) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Efficacy", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Efficacy instance) {
		log.debug("finding Efficacy instance by example");
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
		log.debug("finding Efficacy instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Efficacy as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByEfficacyName(Object efficacyName) {
		return findByProperty(EFFICACY_NAME, efficacyName);
	}

	public List findByEfficacyRank(Object efficacyRank) {
		return findByProperty(EFFICACY_RANK, efficacyRank);
	}

	public List findByEfficacyImageId(Object efficacyImageId) {
		return findByProperty(EFFICACY_IMAGE_ID, efficacyImageId);
	}

	public List findAll() {
		log.debug("finding all Efficacy instances");
		try {
			String queryString = "from Efficacy";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Efficacy merge(Efficacy detachedInstance) {
		log.debug("merging Efficacy instance");
		try {
			Efficacy result = (Efficacy) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Efficacy instance) {
		log.debug("attaching dirty Efficacy instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Efficacy instance) {
		log.debug("attaching clean Efficacy instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static EfficacyDAO getFromApplicationContext(ApplicationContext ctx) {
		return (EfficacyDAO) ctx.getBean("EfficacyDAO");
	}
	
	/**
	 * 自定义函数，用于有多个分类名的搜索结果
	 * @param hqlSearch
	 * @return
	 */
	public List<Efficacy> findByEfficacyNames(String hqlSearch) {
		try {
			String queryString = "from Efficacy where "
					+ hqlSearch;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}