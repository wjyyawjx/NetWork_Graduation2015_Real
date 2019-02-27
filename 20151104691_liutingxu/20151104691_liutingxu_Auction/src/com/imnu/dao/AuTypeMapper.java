package com.imnu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.imnu.model.AuType;



public interface AuTypeMapper {
    int deleteByPrimaryKey(String typeId);

    int insert(AuType record);

    int insertSelective(AuType record);

    AuType selectByPrimaryKey(String typeId);

    int updateByPrimaryKeySelective(AuType record);

    int updateByPrimaryKey(AuType record);
    
    /**
     * 查询
     * @param page 
     * @param typeName 类型名称
     * @return
     */
    public List<AuType> queryAll(Map<String, Object> map);
    
    @Select("select count(*) from au_type")
	int findCount();
    /**
     * 查询所有
     * @return
     */
    public List<AuType> queryType();
    
    @Select("select type_id as typeId,type_name as typeName from au_type")
	List<AuType> findAll();
}