package com.yidu.dao;

import java.util.List;

import com.yidu.controller.vo.CarVo;
import com.yidu.domain.Car;

public interface CarMapper {
    int deleteByPrimaryKey(String carId);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(String carId);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);
    
    List<CarVo> selectAll();
    
    int deleteAll();
    
    List<CarVo> selectById(String userName);
}