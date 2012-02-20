package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Goods
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Goods
 * @author MyEclipse Persistence Tools
 */

public class GoodsDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(GoodsDAO.class);
	// property constants
	public static final String PROVIDER_ID = "providerId";
	public static final String BRAND_ID = "brandId";
	public static final String CATEGORY_ID = "categoryId";
	public static final String GOODS_NAME = "goodsName";
	public static final String GOODS_THUMB = "goodsThumb";
	public static final String GOODS_IMAGES = "goodsImages";
	public static final String GOODS_PRICE = "goodsPrice";
	public static final String GOODS_URL = "goodsUrl";
	public static final String GOODS_SCORE = "goodsScore";
	public static final String GOODS_SKIN = "goodsSkin";
	public static final String GOODS_AGE = "goodsAge";
	public static final String GOODS_DESCRIPTION = "goodsDescription";
	public static final String GOODS_SPECIFICATION = "goodsSpecification";
	public static final String GOODS_COUNT = "goodsCount";
	public static final String GOODS_IS_NEW = "goodsIsNew";
	public static final String GOODS_IS_HOT = "goodsIsHot";
	public static final String GOODS_BUY_COUNT = "goodsBuyCount";
	public static final String GOODS_VIEW_COUNT = "goodsViewCount";
	public static final String GOODS_STATUS = "goodsStatus";
	public static final String GOODS_RANK = "goodsRank";

	protected void initDao() {
		// do nothing
	}

	public void save(Goods transientInstance) {
		log.debug("saving Goods instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Goods persistentInstance) {
		log.debug("deleting Goods instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Goods findById(java.lang.Integer id) {
		log.debug("getting Goods instance with id: " + id);
		try {
			Goods instance = (Goods) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Goods", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Goods instance) {
		log.debug("finding Goods instance by example");
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
		log.debug("finding Goods instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Goods as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByProviderId(Object providerId) {
		return findByProperty(PROVIDER_ID, providerId);
	}

	public List findByBrandId(Object brandId) {
		return findByProperty(BRAND_ID, brandId);
	}

	public List findByCategoryId(Object categoryId) {
		return findByProperty(CATEGORY_ID, categoryId);
	}

	public List findByGoodsName(Object goodsName) {
		return findByProperty(GOODS_NAME, goodsName);
	}

	public List findByGoodsThumb(Object goodsThumb) {
		return findByProperty(GOODS_THUMB, goodsThumb);
	}

	public List findByGoodsImages(Object goodsImages) {
		return findByProperty(GOODS_IMAGES, goodsImages);
	}

	public List findByGoodsPrice(Object goodsPrice) {
		return findByProperty(GOODS_PRICE, goodsPrice);
	}

	public List findByGoodsUrl(Object goodsUrl) {
		return findByProperty(GOODS_URL, goodsUrl);
	}

	public List findByGoodsScore(Object goodsScore) {
		return findByProperty(GOODS_SCORE, goodsScore);
	}

	public List findByGoodsSkin(Object goodsSkin) {
		return findByProperty(GOODS_SKIN, goodsSkin);
	}

	public List findByGoodsAge(Object goodsAge) {
		return findByProperty(GOODS_AGE, goodsAge);
	}

	public List findByGoodsDescription(Object goodsDescription) {
		return findByProperty(GOODS_DESCRIPTION, goodsDescription);
	}

	public List findByGoodsSpecification(Object goodsSpecification) {
		return findByProperty(GOODS_SPECIFICATION, goodsSpecification);
	}

	public List findByGoodsCount(Object goodsCount) {
		return findByProperty(GOODS_COUNT, goodsCount);
	}

	public List findByGoodsIsNew(Object goodsIsNew) {
		return findByProperty(GOODS_IS_NEW, goodsIsNew);
	}

	public List findByGoodsIsHot(Object goodsIsHot) {
		return findByProperty(GOODS_IS_HOT, goodsIsHot);
	}

	public List findByGoodsBuyCount(Object goodsBuyCount) {
		return findByProperty(GOODS_BUY_COUNT, goodsBuyCount);
	}

	public List findByGoodsViewCount(Object goodsViewCount) {
		return findByProperty(GOODS_VIEW_COUNT, goodsViewCount);
	}

	public List findByGoodsStatus(Object goodsStatus) {
		return findByProperty(GOODS_STATUS, goodsStatus);
	}

	public List findByGoodsRank(Object goodsRank) {
		return findByProperty(GOODS_RANK, goodsRank);
	}

	public List findAll() {
		log.debug("finding all Goods instances");
		try {
			String queryString = "from Goods";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goods merge(Goods detachedInstance) {
		log.debug("merging Goods instance");
		try {
			Goods result = (Goods) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goods instance) {
		log.debug("attaching dirty Goods instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goods instance) {
		log.debug("attaching clean Goods instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GoodsDAO) ctx.getBean("GoodsDAO");
	}
}