package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Image
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Image
 * @author MyEclipse Persistence Tools
 */

public class ImageDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ImageDAO.class);
	// property constants
	public static final String IMG_URL = "imgUrl";
	public static final String IMG_MD5 = "imgMd5";
	public static final String IMG_WIDTH = "imgWidth";
	public static final String IMG_HEIGHT = "imgHeight";
	public static final String IMG_SIZE = "imgSize";
	public static final String IMG_TYPE = "imgType";

	protected void initDao() {
		// do nothing
	}

	public void save(Image transientInstance) {
		log.debug("saving Image instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Image persistentInstance) {
		log.debug("deleting Image instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Image findById(java.lang.Integer id) {
		log.debug("getting Image instance with id: " + id);
		try {
			Image instance = (Image) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Image", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Image instance) {
		log.debug("finding Image instance by example");
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
		log.debug("finding Image instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Image as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByImgUrl(Object imgUrl) {
		return findByProperty(IMG_URL, imgUrl);
	}

	public List findByImgMd5(Object imgMd5) {
		return findByProperty(IMG_MD5, imgMd5);
	}

	public List findByImgWidth(Object imgWidth) {
		return findByProperty(IMG_WIDTH, imgWidth);
	}

	public List findByImgHeight(Object imgHeight) {
		return findByProperty(IMG_HEIGHT, imgHeight);
	}

	public List findByImgSize(Object imgSize) {
		return findByProperty(IMG_SIZE, imgSize);
	}

	public List findByImgType(Object imgType) {
		return findByProperty(IMG_TYPE, imgType);
	}

	public List findAll() {
		log.debug("finding all Image instances");
		try {
			String queryString = "from Image";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Image merge(Image detachedInstance) {
		log.debug("merging Image instance");
		try {
			Image result = (Image) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Image instance) {
		log.debug("attaching dirty Image instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Image instance) {
		log.debug("attaching clean Image instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ImageDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ImageDAO) ctx.getBean("ImageDAO");
	}
}