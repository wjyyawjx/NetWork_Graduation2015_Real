package com.lyh.springboot.mapper;

import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.LaboratoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LaboratoryMapper {
    long countByExample(LaboratoryExample example);

    int deleteByExample(LaboratoryExample example);

    int deleteByPrimaryKey(Integer lId);

    int insert(Laboratory record);

    int insertSelective(Laboratory record);

    List<Laboratory> selectByExample(LaboratoryExample example);

    Laboratory selectByPrimaryKey(Integer lId);

    int updateByExampleSelective(@Param("record") Laboratory record, @Param("example") LaboratoryExample example);

    int updateByExample(@Param("record") Laboratory record, @Param("example") LaboratoryExample example);

    int updateByPrimaryKeySelective(Laboratory record);

    int updateByPrimaryKey(Laboratory record);
}