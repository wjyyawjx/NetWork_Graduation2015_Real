package com.lyh.springboot.mapper;

import com.lyh.springboot.pojo.LabUser;
import com.lyh.springboot.pojo.LabUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LabUserMapper {
    long countByExample(LabUserExample example);

    int deleteByExample(LabUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LabUser record);

    int insertSelective(LabUser record);

    List<LabUser> selectByExample(LabUserExample example);

    LabUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LabUser record, @Param("example") LabUserExample example);

    int updateByExample(@Param("record") LabUser record, @Param("example") LabUserExample example);

    int updateByPrimaryKeySelective(LabUser record);

    int updateByPrimaryKey(LabUser record);
}