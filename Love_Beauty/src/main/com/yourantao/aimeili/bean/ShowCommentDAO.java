package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * ShowComment entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.ShowComment
 * @author MyEclipse Persistence Tools
 */

public class ShowCommentDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ShowCommentDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(ShowComment transientInstance) {
		log.debug("saving ShowComment instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ShowComment persistentInstance) {
		log.debug("deleting ShowComment instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ShowComment findById(main.com.yourantao.aimeili.bean.ShowCommentId id) {
		log.debug("getting ShowComment instance with id: " + id);
		try {
			ShowComment instance = (ShowComment) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.ShowComment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ShowComment instance) {
		log.debug("finding ShowComment instance by example");
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
		log.debug("finding ShowComment instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from ShowComment as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all ShowComment instances");
		try {
			String queryString = "from ShowComment";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ShowComment merge(ShowComment detachedInstance) {
		log.debug("merging ShowComment instance");
		try {
			ShowComment result = (ShowComment) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ShowComment instance) {
		log.debug("attaching dirty ShowComment instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ShowComment instance) {
		log.debug("attaching clean ShowComment instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ShowCommentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ShowCommentDAO) ctx.getBean("ShowCommentDAO");
	}
}