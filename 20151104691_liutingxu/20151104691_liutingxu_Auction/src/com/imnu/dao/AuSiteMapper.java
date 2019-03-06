package com.imnu.dao;

import java.util.List;
import java.util.Map;

import com.imnu.model.AuSite;



/**
 * 
 * 描述:地址Dao
 */
public interface AuSiteMapper {
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
    public List<AuSite> queryAll(Map<String, Object> map);

	List<Map<String, Object>> findByUserId(String userId);
	/**
	 * 查询总行数
	 * @return
	 */
	Long findCount(AuSite site);
}