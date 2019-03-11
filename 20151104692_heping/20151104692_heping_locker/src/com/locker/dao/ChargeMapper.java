package com.locker.dao;

import java.util.List;

import com.locker.domain.Charge;

public interface ChargeMapper {
    int deleteByPrimaryKey(String chId);

    int insert(Charge record);

    int insertSelective(Charge record);

    Charge selectByPrimaryKey(String chId);

    int updateByPrimaryKeySelective(Charge record);

    int updateByPrimaryKey(Charge record);

	List<Charge> findAllAll();
}