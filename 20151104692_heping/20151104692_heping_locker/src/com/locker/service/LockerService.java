package com.locker.service;

import java.util.List;

import com.locker.domain.Locker;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
 */
public interface LockerService {

	/**
	 * 查询储物柜表所有
	 * @return
	 */
	List<Locker> selectAll();

	/**
	 * 根据id删除
	 * @param loId
	 * @return
	 */
	int deleteByPrimaryKey(String loId);

	/**
	 * 根据名字查询
	 * @param loName
	 * @return
	 */
	List<Locker> selectByName(String loName);

	/**
	 * 根据id查询
	 * @param loId
	 * @return
	 */
	Locker selectByPrimaryKey(String loId);

	/**
	 * 增加或修改
	 * @param vo
	 * @return
	 */
	int addOrUpdate(Locker vo);

}
