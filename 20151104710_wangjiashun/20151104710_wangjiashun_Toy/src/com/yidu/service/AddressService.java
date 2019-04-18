package com.yidu.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.yidu.domain.Address;
import com.yidu.domain.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface AddressService  {
	/**
	 * 条件查询，查询所有，分页
	 * @param page 开始的行数
	 * @param pageSize 总页数
	 * @param address 地址对象
	 * @return Address集合
	 */
	PageInfo<Address> findAll(Integer page, Integer pageSize, Address address);
	/**
	 * 删除 
	 * @param addressId 地址id
	 * @return int
	 */
	int delete(String addressId);
	/**
	 * 增加和修改
	 * @param address 地址对象
	 * @return int
	 */
	int insertorUpdate(Address address);
	/**
	 * 通过id查询地址表
	 * @param addressId 地址id
	 * @return Address 对象
	 */
	Address selectId(String addressId);
	/**
	 * 增加收货人
	 * @param user 用户对象 
	 * @return int
	 */
	int addUser(User user);
	/**
	 * 查询用户id
	 * @return String
	 */
	String findUserId();
	/**
	 * 前台的增加地址的方法
	 * @param address 地址对象
	 * @return int
	 */
	int insert(Address address);
	/**
	 * 多表查询通过用户id查找地址
	 * @param userId 用户id
	 * @return 地址集合
	 */
	List<Address> selectAll(String userId);
	
}
