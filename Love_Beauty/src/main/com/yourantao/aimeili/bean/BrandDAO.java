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
 * A data access object (DAO) providing persistence and search support for Brand
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Brand
 * @author MyEclipse Persistence Tools
 */

public class BrandDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(BrandDAO.class);
	// property constants
	public static final String BRAND_NAME = "brandName";
	public static final String BRAND_ALIAS = "brandAlias";
	public static final String BRAND_OTHER_NAMES = "brandOtherNames";
	public static final String BRAND_DESCRIPTION = "brandDescription";
	public static final String BRAND_RANK = "brandRank";

	protected void initDao() {
		// do nothing
	}

	public void save(Brand transientInstance) {
		log.debug("saving Brand instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Brand persistentInstance) {
		log.debug("deleting Brand instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Brand findById(java.lang.Integer id) {
		log.debug("getting Brand instance with id: " + id);
		try {
			Brand instance = (Brand) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Brand", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Brand instance) {
		log.debug("finding Brand instance by example");
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
		log.debug("finding Brand instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Brand as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByBrandName(Object brandName) {
		return findByProperty(BRAND_NAME, brandName);
	}

	public List findByBrandAlias(Object brandAlias) {
		return findByProperty(BRAND_ALIAS, brandAlias);
	}

	public List findByBrandOtherNames(Object brandOtherNames) {
		return findByProperty(BRAND_OTHER_NAMES, brandOtherNames);
	}

	public List findByBrandDescription(Object brandDescription) {
		return findByProperty(BRAND_DESCRIPTION, brandDescription);
	}

	public List findByBrandRank(Object brandRank) {
		return findByProperty(BRAND_RANK, brandRank);
	}

	public List findAll() {
		log.debug("finding all Brand instances");
		try {
			String queryString = "from Brand";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Brand merge(Brand detachedInstance) {
		log.debug("merging Brand instance");
		try {
			Brand result = (Brand) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Brand instance) {
		log.debug("attaching dirty Brand instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Brand instance) {
		log.debug("attaching clean Brand instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BrandDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BrandDAO) ctx.getBean("BrandDAO");
	}
	
	/**
	 * 自定义的方法，查找rank>0的
	 * @return
	 */
	public List findRank() {
		log.debug("finding all Brand instances");
		try {
			/*1.查询全部字段的情况下，如"from 实体类"，list中封装的对象为实体类本身，各属性都将得到填充。

			  2.只查询一个字段，默认情况下，list中封装的是Object对象。

		      3.查询两个或两个以上的字段，默认情况下，list中封装的是Object[],长度与所查询的字段数一致。*/
//			final String hql = "select new Brand( "+BRAND_NAME+", "+BRAND_ALIAS+", "+BRAND_RANK+") from Brand ";   // 需要在Brand类中加入新的构造函数
//			final String hql = " from Brand where "+BRAND_RANK+">0";
			final String hql = "select new map("+BRAND_NAME+" as "+BRAND_NAME+","+BRAND_ALIAS+" as "+BRAND_ALIAS+","+BRAND_RANK+" as "+BRAND_RANK+") from Brand ";  //hql动态生成map实现，map中第一个是value,第二个是key，可与前端约定名字
//			return getHibernateTemplate().find(queryString);   //find()方法是类似sql语句的访问
			      return getHibernateTemplate().find(hql);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	
}