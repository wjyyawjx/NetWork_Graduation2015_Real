package com.yidu.dao;

import java.util.List;

import com.yidu.domain.ToyType;

public interface ToyTypeMapper {
    int deleteByPrimaryKey(String typeId);

    int insert(ToyType record);

    int insertSelective(ToyType record);

    ToyType selectByPrimaryKey(String typeId);

    int updateByPrimaryKeySelective(ToyType record);

    int updateByPrimaryKey(ToyType record);
    
    int findRows();
     
    List<ToyType> findAll();

	List<ToyType> findAlls(ToyType us);
}