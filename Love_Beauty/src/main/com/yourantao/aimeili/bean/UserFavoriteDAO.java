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
 * UserFavorite entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.UserFavorite
 * @author MyEclipse Persistence Tools
 */

public class UserFavoriteDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(UserFavoriteDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String FAVORITE_TYPE = "favoriteType";
	public static final String RELATED_ID = "relatedId";

	protected void initDao() {
		// do nothing
	}

	public void save(UserFavorite transientInstance) {
		log.debug("saving UserFavorite instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserFavorite persistentInstance) {
		log.debug("deleting UserFavorite instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserFavorite findById(java.lang.Integer id) {
		log.debug("getting UserFavorite instance with id: " + id);
		try {
			UserFavorite instance = (UserFavorite) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.UserFavorite", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserFavorite instance) {
		log.debug("finding UserFavorite instance by example");
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
		log.debug("finding UserFavorite instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserFavorite as model where model."
					+ propertyName + "= ? order by model.addTime desc";   //按收藏时间排序
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByFavoriteType(Object favoriteType) {
		return findByProperty(FAVORITE_TYPE, favoriteType);
	}

	public List findByRelatedId(Object relatedId) {
		return findByProperty(RELATED_ID, relatedId);
	}

	public List findAll() {
		log.debug("finding all UserFavorite instances");
		try {
			String queryString = "from UserFavorite";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserFavorite merge(UserFavorite detachedInstance) {
		log.debug("merging UserFavorite instance");
		try {
			UserFavorite result = (UserFavorite) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserFavorite instance) {
		log.debug("attaching dirty UserFavorite instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserFavorite instance) {
		log.debug("attaching clean UserFavorite instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UserFavoriteDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (UserFavoriteDAO) ctx.getBean("UserFavoriteDAO");
	}
	
	
	/**
	 * 自定义查找数据库，uid和gid
	 * 
	 * @param brandName
	 */
	public List<UserFavorite> findByUidAndGid(Integer uid, Integer gid) {
		log.info("自定义查找数据库，brandName uid= '{}',gid='{}'",uid,gid);
		try {
			String queryString = "from UserFavorite as model where model."
					+ USER_ID + "=? and "+RELATED_ID+"=?";
			return getHibernateTemplate().find(queryString,new Integer[]{uid, gid});
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}