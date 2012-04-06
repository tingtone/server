package main.com.yourantao.aimeili.bean;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sun.istack.internal.FinalArrayList;

/**
 * A data access object (DAO) providing persistence and search support for
 * GoodsMap entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.GoodsMap
 * @author MyEclipse Persistence Tools
 */

public class GoodsMapDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsMapDAO.class);
	// property constants
	public static final String GOODS_REAL_ID = "goodsRealId";
	public static final String GOODS_ID = "goodsId";

	public int page=0;
	public int num=0;
	protected void initDao() {
		// do nothing
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void save(GoodsMap transientInstance) {
		log.debug("saving GoodsMap instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GoodsMap persistentInstance) {
		log.debug("deleting GoodsMap instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GoodsMap findById(java.lang.Integer id) {
		log.debug("getting GoodsMap instance with id: " + id);
		try {
			GoodsMap instance = (GoodsMap) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.GoodsMap", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(GoodsMap instance) {
		log.debug("finding GoodsMap instance by example");
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

	public List findByProperty(final String propertyName,final Object value) {
		log.debug("finding GoodsMap instance with property: " + propertyName
				+ ", value: " + value);
		try {
			return getHibernateTemplate().executeFind(new HibernateCallback() {
				String queryString = "from GoodsMap as model where model."
					+ propertyName + "= ?";
				@Override
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query= session.createQuery(queryString);
					query.setParameter(0, value);
					query.setFirstResult(num*page);
					if(num!=0)
						query.setMaxResults(num);
	                List list=query.list();
	                return list;
				}
			});
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGoodsRealId(Object goodsRealId) {
		return findByProperty(GOODS_REAL_ID, goodsRealId);
	}

	public List findByGoodsId(Object goodsId) {
		return findByProperty(GOODS_ID, goodsId);
	}

	public List findAll() {
		log.debug("finding all GoodsMap instances");
		try {
			String queryString = "from GoodsMap";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public GoodsMap merge(GoodsMap detachedInstance) {
		log.debug("merging GoodsMap instance");
		try {
			GoodsMap result = (GoodsMap) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GoodsMap instance) {
		log.debug("attaching dirty GoodsMap instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GoodsMap instance) {
		log.debug("attaching clean GoodsMap instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsMapDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GoodsMapDAO) ctx.getBean("GoodsMapDAO");
	}

	/**
	 * 自定义函数，根据商品id和真实商品ID获得goodsMap
	 * @param goodsId
	 * @param goodsRealId
	 * @return
	 */
	public List<GoodsMap> findByGoodsIdAndGoodsRealId(final Integer goodsId,
			final Integer goodsRealId) {
		try {
			return getHibernateTemplate().executeFind(new HibernateCallback() {
				String queryString = "from GoodsMap where "
					+ GOODS_ID + "= ? and "+GOODS_REAL_ID+"= ?";
				@Override
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query= session.createQuery(queryString);
					query.setParameter(0, goodsId);
					query.setParameter(1, goodsRealId);
					query.setFirstResult(num*page);
					if(num!=0)
						query.setMaxResults(num);
	                List list=query.list();
	                return list;
				}
			});
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}