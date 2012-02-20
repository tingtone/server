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
 * GoodsComment entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.GoodsComment
 * @author MyEclipse Persistence Tools
 */

public class GoodsCommentDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsCommentDAO.class);
	// property constants
	public static final String GOODS_ID = "goodsId";
	public static final String COMMENTATOR = "commentator";
	public static final String COMMENT_CONTENT = "commentContent";
	public static final String COMMENT_LEVEL = "commentLevel";
	public static final String COMMENT_RANK = "commentRank";

	protected void initDao() {
		// do nothing
	}

	public void save(GoodsComment transientInstance) {
		log.debug("saving GoodsComment instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GoodsComment persistentInstance) {
		log.debug("deleting GoodsComment instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GoodsComment findById(java.lang.Integer id) {
		log.debug("getting GoodsComment instance with id: " + id);
		try {
			GoodsComment instance = (GoodsComment) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.GoodsComment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(GoodsComment instance) {
		log.debug("finding GoodsComment instance by example");
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
		log.debug("finding GoodsComment instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from GoodsComment as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGoodsId(Object goodsId) {
		return findByProperty(GOODS_ID, goodsId);
	}

	public List findByCommentator(Object commentator) {
		return findByProperty(COMMENTATOR, commentator);
	}

	public List findByCommentContent(Object commentContent) {
		return findByProperty(COMMENT_CONTENT, commentContent);
	}

	public List findByCommentLevel(Object commentLevel) {
		return findByProperty(COMMENT_LEVEL, commentLevel);
	}

	public List findByCommentRank(Object commentRank) {
		return findByProperty(COMMENT_RANK, commentRank);
	}

	public List findAll() {
		log.debug("finding all GoodsComment instances");
		try {
			String queryString = "from GoodsComment";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public GoodsComment merge(GoodsComment detachedInstance) {
		log.debug("merging GoodsComment instance");
		try {
			GoodsComment result = (GoodsComment) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GoodsComment instance) {
		log.debug("attaching dirty GoodsComment instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GoodsComment instance) {
		log.debug("attaching clean GoodsComment instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsCommentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (GoodsCommentDAO) ctx.getBean("GoodsCommentDAO");
	}
}