package com.yidu.dao;

import java.util.List;

import com.yidu.domain.Locker;

public interface LockerMapper {
    int deleteByPrimaryKey(String loId);

    int insert(Locker record);

    int insertSelective(Locker record);

    Locker selectByPrimaryKey(String loId);

    int updateByPrimaryKeySelective(Locker record);

    int updateByPrimaryKey(Locker record);

	List<Locker> selectAll();

	List<Locker> selectByName(String loName);
}