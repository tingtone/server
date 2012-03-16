package main.com.yourantao.aimeili.bean;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Ranking entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see main.com.yourantao.aimeili.bean.Ranking
 * @author MyEclipse Persistence Tools
 */

public class RankingDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(RankingDAO.class);
	// property constants
	public static final String RANKING_NAME = "rankingName";
	public static final String RANKING_RANK = "rankingRank";
	public static final String RANKING_IMAGE_ID = "rankingImageId";

	protected void initDao() {
		// do nothing
	}

	public void save(Ranking transientInstance) {
		log.debug("saving Ranking instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Ranking persistentInstance) {
		log.debug("deleting Ranking instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Ranking findById(java.lang.Integer id) {
		log.debug("getting Ranking instance with id: " + id);
		try {
			Ranking instance = (Ranking) getHibernateTemplate().get(
					"main.com.yourantao.aimeili.bean.Ranking", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Ranking instance) {
		log.debug("finding Ranking instance by example");
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
		log.debug("finding Ranking instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Ranking as model where model."
					+ propertyName + "= ? order by "+RANKING_RANK+" desc";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByRankingName(Object rankingName) {
		return findByProperty(RANKING_NAME, rankingName);
	}

	public List findByRankingRank(Object rankingRank) {
		return findByProperty(RANKING_RANK, rankingRank);
	}

	public List findByRankingImageId(Object rankingImageId) {
		return findByProperty(RANKING_IMAGE_ID, rankingImageId);
	}

	public List findAll() {
		log.debug("finding all Ranking instances");
		try {
			String queryString = "from Ranking order by "+RANKING_RANK+" desc";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Ranking merge(Ranking detachedInstance) {
		log.debug("merging Ranking instance");
		try {
			Ranking result = (Ranking) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Ranking instance) {
		log.debug("attaching dirty Ranking instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Ranking instance) {
		log.debug("attaching clean Ranking instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RankingDAO getFromApplicationContext(ApplicationContext ctx) {
		return (RankingDAO) ctx.getBean("RankingDAO");
	}
}