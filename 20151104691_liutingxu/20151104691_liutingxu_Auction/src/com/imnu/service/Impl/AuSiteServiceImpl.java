package com.imnu.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imnu.common.Page;
import com.imnu.dao.AuSiteMapper;
import com.imnu.model.AuSite;
import com.imnu.service.AuSiteService;


/**
 * 
 * 描述:地址服务实现类
 */
@Service
public class AuSiteServiceImpl implements AuSiteService{
	
	@Resource
	public AuSiteMapper siteDao;
	
	@Override
	public int deleteByPrimaryKey(String siId) {
		return siteDao.deleteByPrimaryKey(siId);
	}

	@Override
	public int insert(AuSite record) {
		// TODO Auto-generated method stub
		return siteDao.insert(record);
	}

	@Override
	public int insertSelective(AuSite record) {
		// TODO Auto-generated method stub
		return siteDao.insertSelective(record);
	}

	@Override
	public AuSite selectByPrimaryKey(String siId) {
		return siteDao.selectByPrimaryKey(siId);
	}

	@Override
	public int updateByPrimaryKeySelective(AuSite record) {
		return siteDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AuSite record) {
		return siteDao.updateByPrimaryKey(record);
	}

	@Override
	public List<AuSite> queryAll(AuSite site,Page page) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", site.getUserId());
		map.put("startRows", page.getStartRows());
		map.put("rows", page.getRows());
		return siteDao.queryAll(map);
	}

	@Override
	public List<Map<String, Object>> findByUserId(String userId) {
		// TODO Auto-generated method stub
		return siteDao.findByUserId(userId);
	}

	@Override
	public int addOrUpdate(AuSite site) {
		int rows = 0;
		if(site.getSiId() != null && !"".equals(site.getSiId())){
			rows = siteDao.updateByPrimaryKeySelective(site);
		}else{
			rows = siteDao.insertSelective(site);
		}
		return rows;
	}

	@Override
	public Long findCount(AuSite site) {
		return siteDao.findCount(site);
	}

}
