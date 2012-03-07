package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * GoodsImages entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.GoodsImages
 * @author MyEclipse Persistence Tools
 */

public class GoodsImagesDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsImagesDAO.class);
	// property constants
	public static final String GOODS_ID = "goodsId";
	public static final String IMG_ID = "imgId";

	protected void initDao() {
		// do nothing
	}

	public void save(GoodsImages transientInstance) {
		log.debug("saving GoodsImages instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GoodsImages persistentInstance) {
		log.debug("deleting GoodsImages instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GoodsImages findById(java.lang.Integer id) {
		log.debug("getting GoodsImages instance with id: " + id);
		try {
			GoodsImages instance = (GoodsImages) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.GoodsImages", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(GoodsImages instance) {
		log.debug("finding GoodsImages instance by example");
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
		log.debug("finding GoodsImages instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from GoodsImages as model where model."
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

	public List findByImgId(Object imgId) {
		return findByProperty(IMG_ID, imgId);
	}

	public List findAll() {
		log.debug("finding all GoodsImages instances");
		try {
			String queryString = "from GoodsImages";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public GoodsImages merge(GoodsImages detachedInstance) {
		log.debug("merging GoodsImages instance");
		try {
			GoodsImages result = (GoodsImages) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GoodsImages instance) {
		log.debug("attaching dirty GoodsImages instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GoodsImages instance) {
		log.debug("attaching clean GoodsImages instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsImagesDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (GoodsImagesDAO) ctx.getBean("GoodsImagesDAO");
	}
}