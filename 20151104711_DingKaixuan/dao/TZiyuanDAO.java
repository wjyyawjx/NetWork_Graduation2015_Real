package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TZiyuan;

/**
 * A data access object (DAO) providing persistence and search support for
 * TZiyuan entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.model.TZiyuan
 * @author MyEclipse Persistence Tools
 */

public class TZiyuanDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TZiyuanDAO.class);
	// property constants
	public static final String BIAOTI = "biaoti";
	public static final String NEIRONG = "neirong";
	public static final String FUJIAN = "fujian";
	public static final String SHIJIAN = "shijian";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TZiyuan transientInstance)
	{
		log.debug("saving TZiyuan instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TZiyuan persistentInstance)
	{
		log.debug("deleting TZiyuan instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TZiyuan findById(java.lang.Integer id)
	{
		log.debug("getting TZiyuan instance with id: " + id);
		try
		{
			TZiyuan instance = (TZiyuan) getHibernateTemplate().get(
					"com.model.TZiyuan", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TZiyuan instance)
	{
		log.debug("finding TZiyuan instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TZiyuan instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TZiyuan as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByBiaoti(Object biaoti)
	{
		return findByProperty(BIAOTI, biaoti);
	}

	public List findByNeirong(Object neirong)
	{
		return findByProperty(NEIRONG, neirong);
	}

	public List findByFujian(Object fujian)
	{
		return findByProperty(FUJIAN, fujian);
	}

	public List findByShijian(Object shijian)
	{
		return findByProperty(SHIJIAN, shijian);
	}

	public List findAll()
	{
		log.debug("finding all TZiyuan instances");
		try
		{
			String queryString = "from TZiyuan";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TZiyuan merge(TZiyuan detachedInstance)
	{
		log.debug("merging TZiyuan instance");
		try
		{
			TZiyuan result = (TZiyuan) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TZiyuan instance)
	{
		log.debug("attaching dirty TZiyuan instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TZiyuan instance)
	{
		log.debug("attaching clean TZiyuan instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TZiyuanDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TZiyuanDAO) ctx.getBean("TZiyuanDAO");
	}
}