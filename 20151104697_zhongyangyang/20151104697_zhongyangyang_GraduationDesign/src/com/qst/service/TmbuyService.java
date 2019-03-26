package com.qst.service;

import java.util.List;

import com.qst.bean.TmbuyBean;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作商品
 *
 */
public interface TmbuyService {
	//获取所有商品信息
	public List<TmbuyBean> getAllTmbuy();
	//获取指定商品信息
	public TmbuyBean getTmbuyMoreInfo(TmbuyBean tmbuy);
	//添加商品
	public int addTmbuy(TmbuyBean tmbuy);
	//删除商品
	public int delTmbuy(TmbuyBean tmbuy);
	//修改商品信息
	public int modifyTmbuy(TmbuyBean tmbuy);
	//查找有没有指定的商品
	public boolean findTmbuy(TmbuyBean tmbuy);
}
