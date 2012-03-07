package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Category entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Category
 * @author MyEclipse Persistence Tools
 */

public class CategoryDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(CategoryDAO.class);
	// property constants
	public static final String CATEGORY_NAME = "categoryName";
	public static final String CATEGORY_IMAGE_ID = "categoryImageId";
	public static final String CATEGORY_DESCRIPTION = "categoryDescription";
	public static final String CATEGORY_RANK = "categoryRank";
	public static final String PARENT_CATID = "parentCatid";
	public static final String CAT_LAYER = "catLayer";

	protected void initDao() {
		// do nothing
	}

	public void save(Category transientInstance) {
		log.debug("saving Category instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Category persistentInstance) {
		log.debug("deleting Category instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Category findById(java.lang.Integer id) {
		log.debug("getting Category instance with id: " + id);
		try {
			Category instance = (Category) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Category", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Category instance) {
		log.debug("finding Category instance by example");
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
		log.debug("finding Category instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Category as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCategoryName(Object categoryName) {
		return findByProperty(CATEGORY_NAME, categoryName);
	}

	public List findByCategoryImageId(Object categoryImageId) {
		return findByProperty(CATEGORY_IMAGE_ID, categoryImageId);
	}

	public List findByCategoryDescription(Object categoryDescription) {
		return findByProperty(CATEGORY_DESCRIPTION, categoryDescription);
	}

	public List findByCategoryRank(Object categoryRank) {
		return findByProperty(CATEGORY_RANK, categoryRank);
	}

	public List findByParentCatid(Object parentCatid) {
		return findByProperty(PARENT_CATID, parentCatid);
	}

	public List findByCatLayer(Object catLayer) {
		return findByProperty(CAT_LAYER, catLayer);
	}

	public List findAll() {
		log.debug("finding all Category instances");
		try {
			String queryString = "from Category";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Category merge(Category detachedInstance) {
		log.debug("merging Category instance");
		try {
			Category result = (Category) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Category instance) {
		log.debug("attaching dirty Category instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Category instance) {
		log.debug("attaching clean Category instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CategoryDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CategoryDAO) ctx.getBean("CategoryDAO");
	}
}