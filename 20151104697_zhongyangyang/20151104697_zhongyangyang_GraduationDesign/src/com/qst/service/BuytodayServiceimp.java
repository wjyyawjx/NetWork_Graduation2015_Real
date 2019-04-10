package com.qst.service;

import java.util.List;

import com.qst.dao.BuytodayDao;
import com.qst.dao.BuytodayDaoimp;
import com.qst.bean.BuytodayBean;
import com.qst.service.BuytodayService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作学生
 *
 */
public class BuytodayServiceimp implements BuytodayService{
	private BuytodayDao buytodayDao = null;
	
	public BuytodayServiceimp(){
		buytodayDao = new BuytodayDaoimp();
	}
	@Override
	//获取所有学生信息
	public List<BuytodayBean> getAllBuytoday() {
		return buytodayDao.getAllBuytoday();
	}

	@Override
	//获取指定学生信息
	public BuytodayBean getBuytodayMoreInfo(BuytodayBean buy) {
		return buytodayDao.getBuytodayMoreInfo(buy);
	}

	@Override
	//添加学生
	public int addBuytoday(BuytodayBean buy) {
		return buytodayDao.addBuytoday(buy);
	}

	@Override
	//删除学生
	public int delBuytoday(BuytodayBean buy) {
		return buytodayDao.delBuytoday(buy);
	}

	@Override
	//修改学生信息
	public int modifyBuytoday(BuytodayBean buy) {
		return buytodayDao.modifyBuytoday(buy);
	}

	@Override
	public boolean findBuytoday(BuytodayBean buy) {
		return buytodayDao.findBuytoday(buy);
	}
	

}

