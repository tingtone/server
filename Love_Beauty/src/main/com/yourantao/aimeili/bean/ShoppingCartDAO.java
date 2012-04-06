package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * ShoppingCart entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.ShoppingCart
 * @author MyEclipse Persistence Tools
 */

public class ShoppingCartDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ShoppingCartDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String GOODS_REAL_ID = "goodsRealId";
	public static final String COUNT = "count";
	public static final String PROVIDER_ID = "providerId";
	public static final String PRICE = "price";

	protected void initDao() {
		// do nothing
	}

	public void save(ShoppingCart transientInstance) {
		log.debug("saving ShoppingCart instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ShoppingCart persistentInstance) {
		log.debug("deleting ShoppingCart instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ShoppingCart findById(java.lang.Integer id) {
		log.debug("getting ShoppingCart instance with id: " + id);
		try {
			ShoppingCart instance = (ShoppingCart) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.ShoppingCart", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ShoppingCart instance) {
		log.debug("finding ShoppingCart instance by example");
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
		log.debug("finding ShoppingCart instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ShoppingCart as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByGoodsRealId(Object goodsRealId) {
		return findByProperty(GOODS_REAL_ID, goodsRealId);
	}

	public List findByCount(Object count) {
		return findByProperty(COUNT, count);
	}

	public List findByProviderId(Object providerId) {
		return findByProperty(PROVIDER_ID, providerId);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findAll() {
		log.debug("finding all ShoppingCart instances");
		try {
			String queryString = "from ShoppingCart";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ShoppingCart merge(ShoppingCart detachedInstance) {
		log.debug("merging ShoppingCart instance");
		try {
			ShoppingCart result = (ShoppingCart) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ShoppingCart instance) {
		log.debug("attaching dirty ShoppingCart instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ShoppingCart instance) {
		log.debug("attaching clean ShoppingCart instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ShoppingCartDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ShoppingCartDAO) ctx.getBean("ShoppingCartDAO");
	}
	/**
	 * 自定义查找用户的购物车函数
	 */
	public List<ShoppingCart> getUserShoppingCart(int userId){
		String hql = "from ShoppingCart where userId = "+ userId + " order by providerId";
		List<ShoppingCart> result = getHibernateTemplate().find(hql);
		return result;
	}

	public ShoppingCart getCartByUserAndGoods(int userId, int goodsRealId) {
		// TODO Auto-generated method stub
		String hql = "from ShoppingCart where userId = " + userId + " and goodsRealId = " + goodsRealId;
		/*HibernateTemplate hibernateTemplate = getHibernateTemplate();
		hibernateTemplate.setMaxResults(1);
		List<ShoppingCart> result = hibernateTemplate.find(hql);*/
		List<ShoppingCart> result = getHibernateTemplate().find(hql);
		if(result.isEmpty())
			return null;
		else
			return result.get(0);
	}
}