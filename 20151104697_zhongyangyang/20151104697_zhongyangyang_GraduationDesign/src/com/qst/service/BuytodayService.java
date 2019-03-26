package com.qst.service;

import java.util.List;

import com.qst.bean.BuytodayBean;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作商品
 *
 */
public interface BuytodayService {
	//获取所有商品信息
	public List<BuytodayBean> getAllBuytoday();
	//获取指定商品信息
	public BuytodayBean getBuytodayMoreInfo(BuytodayBean buytoday);
	//添加商品
	public int addBuytoday(BuytodayBean buytoday);
	//删除商品
	public int delBuytoday(BuytodayBean buytoday);
	//修改商品信息
	public int modifyBuytoday(BuytodayBean buytoday);
	//查找有没有指定的商品
	public boolean findBuytoday(BuytodayBean buytoday);
}

