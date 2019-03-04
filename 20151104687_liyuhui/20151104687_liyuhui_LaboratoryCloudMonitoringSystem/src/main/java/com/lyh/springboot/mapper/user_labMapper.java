package com.lyh.springboot.mapper;

import com.lyh.springboot.pojo.user_lab;
import com.lyh.springboot.pojo.user_labExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface user_labMapper {
    long countByExample(user_labExample example);

    int deleteByExample(user_labExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(user_lab record);

    int insertSelective(user_lab record);

    List<user_lab> selectByExample(user_labExample example);

    user_lab selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") user_lab record, @Param("example") user_labExample example);

    int updateByExample(@Param("record") user_lab record, @Param("example") user_labExample example);

    int updateByPrimaryKeySelective(user_lab record);

    int updateByPrimaryKey(user_lab record);
}