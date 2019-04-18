package com.yidu.service;

import java.text.ParseException;

import com.github.pagehelper.PageInfo;
import com.yidu.domain.Overdue;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface OverdueService  {

	PageInfo<Overdue> findAll(Integer page, Integer pageSize,Overdue us)throws ParseException;

	int delete(String overdueId);

	Overdue findById(String overdueId);

	int findRows();

	int add(Overdue overdue);

}
