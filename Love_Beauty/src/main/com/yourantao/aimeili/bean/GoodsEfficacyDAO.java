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

/**
 * A data access object (DAO) providing persistence and search support for
 * GoodsEfficacy entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.GoodsEfficacy
 * @author MyEclipse Persistence Tools
 */

public class GoodsEfficacyDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsEfficacyDAO.class);
	// property constants
	public static final String EFFICACY_ID = "efficacyId";
	public static final String GOODS = "goods";

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
	public void save(GoodsEfficacy transientInstance) {
		log.debug("saving GoodsEfficacy instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GoodsEfficacy persistentInstance) {
		log.debug("deleting GoodsEfficacy instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GoodsEfficacy findById(java.lang.Integer id) {
		log.debug("getting GoodsEfficacy instance with id: " + id);
		try {
			GoodsEfficacy instance = (GoodsEfficacy) getHibernateTemplate()
					.get("main.com.yourantao.aimeili.bean.GoodsEfficacy", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(GoodsEfficacy instance) {
		log.debug("finding GoodsEfficacy instance by example");
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
		log.debug("finding GoodsEfficacy instance with property: "
				+ propertyName + ", value: " + value);
		try {
			return getHibernateTemplate().executeFind(new HibernateCallback() {
				String queryString = "from GoodsEfficacy as model where model."
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

	public List findByEfficacyId(Object efficacyId) {
		return findByProperty(EFFICACY_ID, efficacyId);
	}

	public List findByGoods(Object goods) {
		return findByProperty(GOODS, goods);
	}

	public List findAll() {
		log.debug("finding all GoodsEfficacy instances");
		try {
			String queryString = "from GoodsEfficacy";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public GoodsEfficacy merge(GoodsEfficacy detachedInstance) {
		log.debug("merging GoodsEfficacy instance");
		try {
			GoodsEfficacy result = (GoodsEfficacy) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GoodsEfficacy instance) {
		log.debug("attaching dirty GoodsEfficacy instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GoodsEfficacy instance) {
		log.debug("attaching clean GoodsEfficacy instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsEfficacyDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (GoodsEfficacyDAO) ctx.getBean("GoodsEfficacyDAO");
	}
}