package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserAddress entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.UserAddress
 * @author MyEclipse Persistence Tools
 */

public class UserAddressDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(UserAddressDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String PROVINCE = "province";
	public static final String CITY = "city";
	public static final String DISTRICT = "district";
	public static final String DETAIL = "detail";
	public static final String USER_ADDRESS = "userAddress";
	public static final String MOBILE = "mobile";
	public static final String TELEPHONE = "telephone";
	public static final String RECEIVER = "receiver";
	public static final String ZIP_CODE = "zipCode";
	public static final String DEFAULT_ = "default_";

	protected void initDao() {
		// do nothing
	}

	public void save(UserAddress transientInstance) {
		log.debug("saving UserAddress instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserAddress persistentInstance) {
		log.debug("deleting UserAddress instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserAddress findById(java.lang.Integer id) {
		log.debug("getting UserAddress instance with id: " + id);
		try {
			UserAddress instance = (UserAddress) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.UserAddress", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserAddress instance) {
		log.debug("finding UserAddress instance by example");
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
		log.debug("finding UserAddress instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserAddress as model where model."
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

	public List findByProvince(Object province) {
		return findByProperty(PROVINCE, province);
	}

	public List findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List findByDistrict(Object district) {
		return findByProperty(DISTRICT, district);
	}

	public List findByDetail(Object detail) {
		return findByProperty(DETAIL, detail);
	}

	public List findByUserAddress(Object userAddress) {
		return findByProperty(USER_ADDRESS, userAddress);
	}

	public List findByMobile(Object mobile) {
		return findByProperty(MOBILE, mobile);
	}

	public List findByTelephone(Object telephone) {
		return findByProperty(TELEPHONE, telephone);
	}

	public List findByReceiver(Object receiver) {
		return findByProperty(RECEIVER, receiver);
	}

	public List findByZipCode(Object zipCode) {
		return findByProperty(ZIP_CODE, zipCode);
	}

	public List findByDefault_(Object default_) {
		return findByProperty(DEFAULT_, default_);
	}

	public List findAll() {
		log.debug("finding all UserAddress instances");
		try {
			String queryString = "from UserAddress";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserAddress merge(UserAddress detachedInstance) {
		log.debug("merging UserAddress instance");
		try {
			UserAddress result = (UserAddress) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserAddress instance) {
		log.debug("attaching dirty UserAddress instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserAddress instance) {
		log.debug("attaching clean UserAddress instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UserAddressDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (UserAddressDAO) ctx.getBean("UserAddressDAO");
	}
}