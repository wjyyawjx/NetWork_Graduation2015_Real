package com.yidu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.yidu.domain.Area;

public interface AreaMapper {
    int deleteByPrimaryKey(String id);

    int insert(Area record);

    int insertSelective(Area record);

    Area selectByPrimaryKey(String arId);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKey(Area record);

	List<Area> selectAll();
	
	@Select("select  ar_id as arId,ar_name as arName from tb_area")
	List<Area> findAll();
}