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
	public TmbuyBean getTmbuyMoreInfo(TmbuyBean tm) {
		return tmbuyDao.getTmbuyMoreInfo(tm);
	}

	@Override
	//添加学生
	public int addTmbuy(TmbuyBean tm) {
		return tmbuyDao.addTmbuy(tm);
	}

	@Override
	//删除学生
	public int delTmbuy(TmbuyBean tm) {
		return tmbuyDao.delTmbuy(tm);
	}

	@Override
	//修改学生信息
	public int modifyTmbuy(TmbuyBean tm) {
		return tmbuyDao.modifyTmbuy(tm);
	}

	@Override
	public boolean findTmbuy(TmbuyBean tm) {
		return tmbuyDao.findTmbuy(tm);
	}
	

}