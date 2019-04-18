package com.yidu.dao;


import java.util.List;

import com.yidu.controller.vo.CarVo;
import com.yidu.controller.vo.CartogramVo;
import com.yidu.controller.vo.RecordVo;
import com.yidu.domain.Record;

public interface RecordMapper {
    int deleteByPrimaryKey(String recordId);

    int insert(Record record);

    int insertSelective(Record record);

    RecordVo selectByPrimaryKey(String recordId);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);
    
    List<RecordVo> selectAll();
    
    int selectCount();
    
    List<CartogramVo> pieChart();
    
    List<RecordVo> findByUserId(String userId);
    
    List<RecordVo> selectLease(String userId);
}