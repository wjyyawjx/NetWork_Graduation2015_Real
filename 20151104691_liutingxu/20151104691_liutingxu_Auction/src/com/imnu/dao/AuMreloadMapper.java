package com.imnu.dao;

import java.util.List;

import com.imnu.model.AuMreload;



public interface AuMreloadMapper {
    int deleteByPrimaryKey(String mrId);

    int insert(AuMreload record);

    int insertSelective(AuMreload record);

    AuMreload selectByPrimaryKey(String mrId);
    
    int updateByPrimaryKeySelective(AuMreload record);

    int updateByPrimaryKey(AuMreload record);
    /**
     * 根据条件查询
     * @param mreload
     * @return
     */
	List<AuMreload> selectMrecord(AuMreload mreload);
	
	/**
	 * 查询所有保证金
	 * @return
	 */
	List<AuMreload> queryAll(AuMreload mreload);
}