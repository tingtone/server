package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * DiaryComment entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.DiaryComment
 * @author MyEclipse Persistence Tools
 */

public class DiaryCommentDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(DiaryCommentDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(DiaryComment transientInstance) {
		log.debug("saving DiaryComment instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(DiaryComment persistentInstance) {
		log.debug("deleting DiaryComment instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public DiaryComment findById(
			main.com.yourantao.aimeili.bean.DiaryCommentId id) {
		log.debug("getting DiaryComment instance with id: " + id);
		try {
			DiaryComment instance = (DiaryComment) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.DiaryComment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(DiaryComment instance) {
		log.debug("finding DiaryComment instance by example");
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
		log.debug("finding DiaryComment instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from DiaryComment as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all DiaryComment instances");
		try {
			String queryString = "from DiaryComment";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public DiaryComment merge(DiaryComment detachedInstance) {
		log.debug("merging DiaryComment instance");
		try {
			DiaryComment result = (DiaryComment) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(DiaryComment instance) {
		log.debug("attaching dirty DiaryComment instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(DiaryComment instance) {
		log.debug("attaching clean DiaryComment instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static DiaryCommentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (DiaryCommentDAO) ctx.getBean("DiaryCommentDAO");
	}
}