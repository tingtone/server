package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * GoodsReal entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.GoodsReal
 * @author MyEclipse Persistence Tools
 */

public class GoodsRealDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsRealDAO.class);
	// property constants
	public static final String PROVIDER_ID = "providerId";
	public static final String BRAND_ID = "brandId";
	public static final String CATEGORY_ID = "categoryId";
	public static final String BRAND_NAME = "brandName";
	public static final String CATEGORY_NAME = "categoryName";
	public static final String SERIES_NAME = "seriesName";
	public static final String GOODS_NAME = "goodsName";
	public static final String GOODS_THUMB = "goodsThumb";
	public static final String GOODS_IMAGES = "goodsImages";
	public static final String GOODS_PRICE = "goodsPrice";
	public static final String GOODS_CONTENT = "goodsContent";
	public static final String GOODS_URL = "goodsUrl";
	public static final String GOODS_ORIG_PID = "goodsOrigPid";
	public static final String GOODS_SCORE = "goodsScore";
	public static final String GOODS_FORSKIN = "goodsForskin";
	public static final String GOODS_NOTFORSKIN = "goodsNotforskin";
	public static final String GOODS_NOTICEFORSKIN = "goodsNoticeforskin";
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

	public void save(GoodsReal transientInstance) {
		log.debug("saving GoodsReal instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GoodsReal persistentInstance) {
		log.debug("deleting GoodsReal instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GoodsReal findById(java.lang.Integer id) {
		log.debug("getting GoodsReal instance with id: " + id);
		try {
			GoodsReal instance = (GoodsReal) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.GoodsReal", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(GoodsReal instance) {
		log.debug("finding GoodsReal instance by example");
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
		log.debug("finding GoodsReal instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from GoodsReal as model where model."
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

	public List findByBrandName(Object brandName) {
		return findByProperty(BRAND_NAME, brandName);
	}

	public List findByCategoryName(Object categoryName) {
		return findByProperty(CATEGORY_NAME, categoryName);
	}

	public List findBySeriesName(Object seriesName) {
		return findByProperty(SERIES_NAME, seriesName);
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

	public List findByGoodsContent(Object goodsContent) {
		return findByProperty(GOODS_CONTENT, goodsContent);
	}

	public List findByGoodsUrl(Object goodsUrl) {
		return findByProperty(GOODS_URL, goodsUrl);
	}

	public List findByGoodsOrigPid(Object goodsOrigPid) {
		return findByProperty(GOODS_ORIG_PID, goodsOrigPid);
	}

	public List findByGoodsScore(Object goodsScore) {
		return findByProperty(GOODS_SCORE, goodsScore);
	}

	public List findByGoodsForskin(Object goodsForskin) {
		return findByProperty(GOODS_FORSKIN, goodsForskin);
	}

	public List findByGoodsNotforskin(Object goodsNotforskin) {
		return findByProperty(GOODS_NOTFORSKIN, goodsNotforskin);
	}

	public List findByGoodsNoticeforskin(Object goodsNoticeforskin) {
		return findByProperty(GOODS_NOTICEFORSKIN, goodsNoticeforskin);
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
		log.debug("finding all GoodsReal instances");
		try {
			String queryString = "from GoodsReal";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public GoodsReal merge(GoodsReal detachedInstance) {
		log.debug("merging GoodsReal instance");
		try {
			GoodsReal result = (GoodsReal) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GoodsReal instance) {
		log.debug("attaching dirty GoodsReal instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GoodsReal instance) {
		log.debug("attaching clean GoodsReal instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsRealDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GoodsRealDAO) ctx.getBean("GoodsRealDAO");
	}
	
	/**
	 * 自定义查找数据库，like品牌名
	 * 
	 * @param brandName
	 */
	public List<GoodsReal> findGoodsRealByBrandName(String brandName) {
		log.info("自定义查找数据库，brandName like '%{}%'",brandName);
		try {
			String queryString = "from GoodsReal as model where model."
					+ BRAND_NAME + " like '%"+brandName+"%'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	/**
	 * 自定义函数，通过品牌ID和分类ID获得真实商品list
	 * @param brandId
	 * @param categoryId
	 * @return
	 */
	public List<GoodsReal> findByBrandIdAndCategoryId(Integer brandId,
			Integer categoryId) {
		try {
			String queryString = "from GoodsReal where "
					+ BRAND_ID + " =? and "+CATEGORY_ID+"=? ";
			return getHibernateTemplate().find(queryString,brandId,categoryId);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}