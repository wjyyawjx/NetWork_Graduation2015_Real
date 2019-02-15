package com.lyh.springboot.mapper;

import com.lyh.springboot.pojo.TemHum;
import com.lyh.springboot.pojo.TemHumExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TemHumMapper {
    long countByExample(TemHumExample example);

    int deleteByExample(TemHumExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TemHum record);

    int insertSelective(TemHum record);

    List<TemHum> selectByExample(TemHumExample example);

    TemHum selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TemHum record, @Param("example") TemHumExample example);

    int updateByExample(@Param("record") TemHum record, @Param("example") TemHumExample example);

    int updateByPrimaryKeySelective(TemHum record);

    int updateByPrimaryKey(TemHum record);
}