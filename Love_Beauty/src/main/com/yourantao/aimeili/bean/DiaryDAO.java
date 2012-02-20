package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Diary
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Diary
 * @author MyEclipse Persistence Tools
 */

public class DiaryDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(DiaryDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String DIARY_PRIVACY = "diaryPrivacy";
	public static final String DIARY_TAGS = "diaryTags";
	public static final String DIARY_IMAGES = "diaryImages";
	public static final String DIARY_TITLE = "diaryTitle";
	public static final String CONTENT_TYPE = "contentType";
	public static final String DIARY_CONTENT = "diaryContent";
	public static final String DIARY_RANK = "diaryRank";

	protected void initDao() {
		// do nothing
	}

	public void save(Diary transientInstance) {
		log.debug("saving Diary instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Diary persistentInstance) {
		log.debug("deleting Diary instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Diary findById(java.lang.Integer id) {
		log.debug("getting Diary instance with id: " + id);
		try {
			Diary instance = (Diary) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Diary", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Diary instance) {
		log.debug("finding Diary instance by example");
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
		log.debug("finding Diary instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Diary as model where model."
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

	public List findByDiaryPrivacy(Object diaryPrivacy) {
		return findByProperty(DIARY_PRIVACY, diaryPrivacy);
	}

	public List findByDiaryTags(Object diaryTags) {
		return findByProperty(DIARY_TAGS, diaryTags);
	}

	public List findByDiaryImages(Object diaryImages) {
		return findByProperty(DIARY_IMAGES, diaryImages);
	}

	public List findByDiaryTitle(Object diaryTitle) {
		return findByProperty(DIARY_TITLE, diaryTitle);
	}

	public List findByContentType(Object contentType) {
		return findByProperty(CONTENT_TYPE, contentType);
	}

	public List findByDiaryContent(Object diaryContent) {
		return findByProperty(DIARY_CONTENT, diaryContent);
	}

	public List findByDiaryRank(Object diaryRank) {
		return findByProperty(DIARY_RANK, diaryRank);
	}

	public List findAll() {
		log.debug("finding all Diary instances");
		try {
			String queryString = "from Diary";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Diary merge(Diary detachedInstance) {
		log.debug("merging Diary instance");
		try {
			Diary result = (Diary) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Diary instance) {
		log.debug("attaching dirty Diary instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Diary instance) {
		log.debug("attaching clean Diary instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static DiaryDAO getFromApplicationContext(ApplicationContext ctx) {
		return (DiaryDAO) ctx.getBean("DiaryDAO");
	}
}