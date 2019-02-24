package com.imnu.service;

import java.util.List;

import com.imnu.model.AuMreload;


/**
 * 保证金记录
 */
public interface AuMrecordService {
	int deleteByPrimaryKey(String mrId);

    int insert(AuMreload record);

    int insertSelective(AuMreload record);

    AuMreload selectByPrimaryKey(String mrId);
    
    int updateByPrimaryKeySelective(AuMreload record);

    int updateByPrimaryKey(AuMreload record);
	/**
	 * 增加保证金记录
	 * @param comId
	 * @param userId
	 * @param money
	 * @return
	 */
	int addMrecord(String comId, String userId, String money);
	/**
	 * 根据条件查询
	 * @param comId
	 * @param userId
	 * @param money
	 * @return
	 */
	List<AuMreload> selectMrecord(String comId, String userId);
	
	/**
	 * 查询所有保证金
	 * @return
	 */
	List<AuMreload> queryAll(AuMreload mreload);
	
	/**
	 * 保证金
	 * @param record
	 * @return
	 */
	int addOrUpdate(AuMreload record);
}
