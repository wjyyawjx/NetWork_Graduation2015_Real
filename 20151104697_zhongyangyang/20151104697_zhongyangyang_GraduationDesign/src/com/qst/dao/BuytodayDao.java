package com.qst.dao;

import java.util.List;

import com.qst.bean.BuytodayBean;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-09  All rights reserved.
 *
 * @ class description：对推荐表的操作接口
 *
 */
public interface BuytodayDao {
	//获取所有商品信息
	public List<BuytodayBean> getAllBuytoday();
	//获取商品信息
	public BuytodayBean getBuytodayMoreInfo(BuytodayBean buy);
	//添加商品
	public int addBuytoday(BuytodayBean buy);
	//删除商品
	public int delBuytoday1(BuytodayBean buy);
	//修改商品信息
	public int modifyBuytoday(BuytodayBean buy);
	//查找指定的商品存在不存在
	public boolean findBuytoday(BuytodayBean buy);
	int delBuytoday(BuytodayBean buy);

}
