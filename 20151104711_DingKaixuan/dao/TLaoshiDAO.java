package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TLaoshi;

/**
 * Data access object (DAO) for domain model class TLaoshi.
 * 
 * @see com.model.TLaoshi
 * @author MyEclipse Persistence Tools
 */

public class TLaoshiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TLaoshiDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TLaoshi transientInstance)
	{
		log.debug("saving TLaoshi instance");
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

	public void delete(TLaoshi persistentInstance)
	{
		log.debug("deleting TLaoshi instance");
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

	public TLaoshi findById(java.lang.Integer id)
	{
		log.debug("getting TLaoshi instance with id: " + id);
		try
		{
			TLaoshi instance = (TLaoshi) getHibernateTemplate().get(
					"com.model.TLaoshi", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TLaoshi instance)
	{
		log.debug("finding TLaoshi instance by example");
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
		log.debug("finding TLaoshi instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TLaoshi as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TLaoshi instances");
		try
		{
			String queryString = "from TLaoshi";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TLaoshi merge(TLaoshi detachedInstance)
	{
		log.debug("merging TLaoshi instance");
		try
		{
			TLaoshi result = (TLaoshi) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TLaoshi instance)
	{
		log.debug("attaching dirty TLaoshi instance");
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

	public void attachClean(TLaoshi instance)
	{
		log.debug("attaching clean TLaoshi instance");
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

	public static TLaoshiDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TLaoshiDAO) ctx.getBean("TLaoshiDAO");
	}
}