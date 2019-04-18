package com.yidu.service;

import com.github.pagehelper.PageInfo;
import com.yidu.domain.ToyType;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface ToytypeService  {

	int add(ToyType toytype);

	int findRows();

	int delete(String typeId);

	ToyType findById(String typeId);
	/** 
	 * 分页
	 * @param page
	 * @param pageSize
	 * @param us
	 * @return
	 */
	PageInfo<ToyType> findAll(Integer page, Integer pageSize, ToyType us);

}
