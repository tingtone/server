package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * ReportGoods entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.ReportGoods
 * @author MyEclipse Persistence Tools
 */

public class ReportGoodsDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ReportGoodsDAO.class);
	// property constants
	public static final String REPORT_ID = "reportId";
	public static final String GOODS_ID = "goodsId";
	public static final String GOODS_SCORE = "goodsScore";

	protected void initDao() {
		// do nothing
	}

	public void save(ReportGoods transientInstance) {
		log.debug("saving ReportGoods instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ReportGoods persistentInstance) {
		log.debug("deleting ReportGoods instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ReportGoods findById(java.lang.Integer id) {
		log.debug("getting ReportGoods instance with id: " + id);
		try {
			ReportGoods instance = (ReportGoods) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.ReportGoods", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ReportGoods instance) {
		log.debug("finding ReportGoods instance by example");
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
		log.debug("finding ReportGoods instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from ReportGoods as model where model."
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

	public List findByGoodsId(Object goodsId) {
		return findByProperty(GOODS_ID, goodsId);
	}

	public List findByGoodsScore(Object goodsScore) {
		return findByProperty(GOODS_SCORE, goodsScore);
	}

	public List findAll() {
		log.debug("finding all ReportGoods instances");
		try {
			String queryString = "from ReportGoods";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ReportGoods merge(ReportGoods detachedInstance) {
		log.debug("merging ReportGoods instance");
		try {
			ReportGoods result = (ReportGoods) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ReportGoods instance) {
		log.debug("attaching dirty ReportGoods instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ReportGoods instance) {
		log.debug("attaching clean ReportGoods instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ReportGoodsDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ReportGoodsDAO) ctx.getBean("ReportGoodsDAO");
	}
}