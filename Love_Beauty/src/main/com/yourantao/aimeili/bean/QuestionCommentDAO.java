package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * QuestionComment entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.QuestionComment
 * @author MyEclipse Persistence Tools
 */

public class QuestionCommentDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(QuestionCommentDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(QuestionComment transientInstance) {
		log.debug("saving QuestionComment instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(QuestionComment persistentInstance) {
		log.debug("deleting QuestionComment instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public QuestionComment findById(
			main.com.yourantao.aimeili.bean.QuestionCommentId id) {
		log.debug("getting QuestionComment instance with id: " + id);
		try {
			QuestionComment instance = (QuestionComment) getHibernateTemplate()
					.get("main.com.yourantao.aimeili.bean.QuestionComment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(QuestionComment instance) {
		log.debug("finding QuestionComment instance by example");
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
		log.debug("finding QuestionComment instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from QuestionComment as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all QuestionComment instances");
		try {
			String queryString = "from QuestionComment";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public QuestionComment merge(QuestionComment detachedInstance) {
		log.debug("merging QuestionComment instance");
		try {
			QuestionComment result = (QuestionComment) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(QuestionComment instance) {
		log.debug("attaching dirty QuestionComment instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(QuestionComment instance) {
		log.debug("attaching clean QuestionComment instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static QuestionCommentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (QuestionCommentDAO) ctx.getBean("QuestionCommentDAO");
	}
}