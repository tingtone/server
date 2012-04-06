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
 * UserLogin entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.UserLogin
 * @author MyEclipse Persistence Tools
 */

public class UserLoginDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(UserLoginDAO.class);
	// property constants
	public static final String USER_NAME = "userName";
	public static final String PASSWORD = "password";
	public static final String PASSWORD_QUESTION = "passwordQuestion";
	public static final String PASSWORD_ANSWER = "passwordAnswer";
	public static final String UUID = "uuid";

	protected void initDao() {
		// do nothing
	}

	public void save(UserLogin transientInstance) {
		log.debug("saving UserLogin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserLogin persistentInstance) {
		log.debug("deleting UserLogin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserLogin findById(java.lang.Integer id) {
		log.debug("getting UserLogin instance with id: " + id);
		try {
			UserLogin instance = (UserLogin) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.UserLogin", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserLogin instance) {
		log.debug("finding UserLogin instance by example");
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
		log.debug("finding UserLogin instance with property: " + propertyName
				+ ", value: " + value);
		try {
			return getHibernateTemplate().executeFind(new HibernateCallback() {
				String queryString = "from UserLogin as model where model."
					+ propertyName + "= ?";
				@Override
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query= session.createQuery(queryString);
					query.setParameter(0, value);
					query.setMaxResults(1);
	                List list=query.list();
	                return list;
				}
			});
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByPasswordQuestion(Object passwordQuestion) {
		return findByProperty(PASSWORD_QUESTION, passwordQuestion);
	}

	public List findByPasswordAnswer(Object passwordAnswer) {
		return findByProperty(PASSWORD_ANSWER, passwordAnswer);
	}

	public List findByUuid(Object uuid) {
		return findByProperty(UUID, uuid);
	}

	public List findAll() {
		log.debug("finding all UserLogin instances");
		try {
			String queryString = "from UserLogin";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserLogin merge(UserLogin detachedInstance) {
		log.debug("merging UserLogin instance");
		try {
			UserLogin result = (UserLogin) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserLogin instance) {
		log.debug("attaching dirty UserLogin instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserLogin instance) {
		log.debug("attaching clean UserLogin instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UserLoginDAO getFromApplicationContext(ApplicationContext ctx) {
		return (UserLoginDAO) ctx.getBean("UserLoginDAO");
	}
}