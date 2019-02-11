package com.imnu.service;

import java.util.List;
import java.util.Map;

import com.imnu.auction.vo.WareloadVo;
import com.imnu.common.Page;
import com.imnu.model.AuWareload;


/**
 * 
 * 描述:钱包支出记录服务类
 */
public interface AuWareloadService {
	int deleteByPrimaryKey(String wrId);

    int insert(AuWareload record);

    int insertSelective(AuWareload record);

    AuWareload selectByPrimaryKey(String wrId);

    int updateByPrimaryKeySelective(AuWareload record);

    int updateByPrimaryKey(AuWareload record);
    
    /**
     * 查询所有钱包支出记录信息
     * @param wareload
     * @return
     */
    List<AuWareload> queryAll(AuWareload wareload,Page page);
    /**
     * 增加或修改
     * @param wareload
     * @return
     */
    int addOrUpdate(WareloadVo wareload);
    /**
	 * 查询总行数
	 * @return
	 */
    Long findCount();
    /**
     * 根据id查询小芬记录
     * @param userId 用户id
     * @return 钱包记录集合
     */
	List<Map<String, Object>> xfRecord(String userId);
}
