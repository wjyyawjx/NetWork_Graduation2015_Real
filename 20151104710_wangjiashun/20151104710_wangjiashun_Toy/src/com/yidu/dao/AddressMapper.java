package com.yidu.dao;

import java.util.List;

import com.yidu.domain.Address;
import com.yidu.domain.User;

public interface AddressMapper {
    int deleteByPrimaryKey(String addressId);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(String addressId);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
    /**
     * 条件查询
     * @param addre 地址对象
     * @return 地址集合
     */
	List<Address> selectAll(Address record);
	 
	/**
	 * 通过用户id查询地址
	 * @param userId 用户id
	 * @return 地址集合
	 */
	List<Address> selectAllByUserId(String userId);
}