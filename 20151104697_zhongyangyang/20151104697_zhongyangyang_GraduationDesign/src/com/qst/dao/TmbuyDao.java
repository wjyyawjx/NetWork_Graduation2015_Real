package com.qst.dao;

import java.util.List;

import com.qst.bean.TmbuyBean;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-09  All rights reserved.
 *
 * @ class description：对推荐表的操作接口
 *
 */
public interface TmbuyDao {
	//获取所有商品信息
	public List<TmbuyBean> getAllTmbuy();
	//获取商品信息
	public TmbuyBean getTmbuyMoreInfo(TmbuyBean tmbuy);
	//添加商品
	public int addTmbuy(TmbuyBean tmbuy);
	//删除商品
	public int delTmbuy1(TmbuyBean tmbuy);
	//修改商品信息
	public int modifyTmbuy(TmbuyBean tmbuy);
	//查找指定的商品存在不存在
	public boolean findTmbuy(TmbuyBean tmbuy);
	int delTmbuy(TmbuyBean buytoday);

}
