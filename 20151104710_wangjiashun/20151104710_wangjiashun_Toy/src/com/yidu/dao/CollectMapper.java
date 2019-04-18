package com.yidu.dao;

import java.util.List;

import com.yidu.controller.vo.CollectVo;
import com.yidu.domain.Collect;


public interface CollectMapper {
    int deleteByPrimaryKey(String collectId);

    int insert(Collect record);

    int insertSelective(Collect record);

    Collect selectByPrimaryKey(String collectId);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
    
    List<CollectVo> selectfin(String id);
}