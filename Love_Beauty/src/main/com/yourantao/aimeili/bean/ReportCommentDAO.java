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
 * ReportComment entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.ReportComment
 * @author MyEclipse Persistence Tools
 */

public class ReportCommentDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ReportCommentDAO.class);
	// property constants
	public static final String REPORT_ID = "reportId";
	public static final String USER_ID = "userId";
	public static final String CONTENT_TYPE = "contentType";
	public static final String COMMENT_CONTENT = "commentContent";

	protected void initDao() {
		// do nothing
	}

	public void save(ReportComment transientInstance) {
		log.debug("saving ReportComment instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ReportComment persistentInstance) {
		log.debug("deleting ReportComment instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ReportComment findById(java.lang.Integer id) {
		log.debug("getting ReportComment instance with id: " + id);
		try {
			ReportComment instance = (ReportComment) getHibernateTemplate()
					.get("main.com.yourantao.aimeili.bean.ReportComment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ReportComment instance) {
		log.debug("finding ReportComment instance by example");
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
		log.debug("finding ReportComment instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ReportComment as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByReportId(Object reportId) {
		return findByProperty(REPORT_ID, reportId);
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByContentType(Object contentType) {
		return findByProperty(CONTENT_TYPE, contentType);
	}

	public List findByCommentContent(Object commentContent) {
		return findByProperty(COMMENT_CONTENT, commentContent);
	}

	public List findAll() {
		log.debug("finding all ReportComment instances");
		try {
			String queryString = "from ReportComment";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ReportComment merge(ReportComment detachedInstance) {
		log.debug("merging ReportComment instance");
		try {
			ReportComment result = (ReportComment) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ReportComment instance) {
		log.debug("attaching dirty ReportComment instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ReportComment instance) {
		log.debug("attaching clean ReportComment instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ReportCommentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ReportCommentDAO) ctx.getBean("ReportCommentDAO");
	}
}