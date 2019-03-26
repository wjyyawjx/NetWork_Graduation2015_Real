package com.qst.service;

import java.util.List;

import com.qst.dao.TmbuyDao;
import com.qst.dao.TmbuyDaoimp;
import com.qst.bean.TmbuyBean;
import com.qst.service.TmbuyService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作学生
 *
 */
public class TmbuyServiceimp implements TmbuyService{
	private TmbuyDao tmbuyDao = null;
	
	public TmbuyServiceimp(){
		tmbuyDao = new TmbuyDaoimp();
	}
	@Override
	//获取所有学生信息
	public List<TmbuyBean> getAllTmbuy() {
		return tmbuyDao.getAllTmbuy();
	}

	@Override
	//获取指定学生信息
	public TmbuyBean getTmbuyMoreInfo(TmbuyBean tmbuy) {
		return tmbuyDao.getTmbuyMoreInfo(tmbuy);
	}

	@Override
	//添加学生
	public int addTmbuy(TmbuyBean tmbuy) {
		return tmbuyDao.addTmbuy(tmbuy);
	}

	@Override
	//删除学生
	public int delTmbuy(TmbuyBean tmbuy) {
		return tmbuyDao.delTmbuy(tmbuy);
	}

	@Override
	//修改学生信息
	public int modifyTmbuy(TmbuyBean tmbuy) {
		return tmbuyDao.modifyTmbuy(tmbuy);
	}

	@Override
	public boolean findTmbuy(TmbuyBean tmbuy) {
		return tmbuyDao.findTmbuy(tmbuy);
	}
	

}