package com.yidu.dao;

import java.util.List;

import com.yidu.domain.Overdue;

public interface OverdueMapper {
    int deleteByPrimaryKey(String overdueId);

    int insert(Overdue record);

    int insertSelective(Overdue record);

    Overdue selectByPrimaryKey(String overdueId);

    int updateByPrimaryKeySelective(Overdue record);

    int updateByPrimaryKey(Overdue record);
    
    int findRows();
    
    List<Overdue> findAll();
    
    List<Overdue> findAlls(Overdue us);

	
}