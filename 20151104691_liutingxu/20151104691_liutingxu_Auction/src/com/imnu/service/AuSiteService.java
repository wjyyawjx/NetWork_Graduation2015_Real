package com.imnu.service;

import java.util.List;
import java.util.Map;

import com.imnu.common.Page;
import com.imnu.model.AuSite;



/**
 * 
 * 描述:地址服务类
 */
public interface AuSiteService {
	int deleteByPrimaryKey(String siId);

    int insert(AuSite record);

    int insertSelective(AuSite record);

    AuSite selectByPrimaryKey(String siId);

    int updateByPrimaryKeySelective(AuSite record);

    int updateByPrimaryKey(AuSite record);
    
    /**
     * 查询所有地址表
     * @return
     */
    public List<AuSite> queryAll(AuSite site,Page page);

	List<Map<String, Object>> findByUserId(String userId);

	int addOrUpdate(AuSite site);
	/**
	 * 查询总行数
	 * @return
	 */
    Long findCount(AuSite site);
}
