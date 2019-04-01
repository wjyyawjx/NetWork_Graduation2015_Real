package com.qst.service;

import java.util.List;

import com.qst.dao.RecommendDao;
import com.qst.dao.RecommendDaoimp;
import com.qst.bean.RecommendBean;
import com.qst.service.RecommendService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作学生
 *
 */
public class RecommendServiceimp implements RecommendService{
	private RecommendDao recommendDao = null;
	
	public RecommendServiceimp(){
		recommendDao = new RecommendDaoimp();
	}

	@Override
	//获取所有学生信息
	public List<RecommendBean> getAllRecommend() {
		return recommendDao.getAllRecommend();
	}

	@Override
	//获取指定学生信息
	public RecommendBean getRecommendMoreInfo(RecommendBean rec) {
		return recommendDao.getRecommendMoreInfo(rec);
	}

	@Override
	//添加学生
	public int addRecommend(RecommendBean rec) {
		return recommendDao.addRecommend(rec);
	}

	@Override
	//删除学生
	public int delRecommend(RecommendBean rec) {
		return recommendDao.delRecommend(rec);
	}

	@Override
	//修改学生信息
	public int modifyRecommend(RecommendBean rec) {
		return recommendDao.modifyRecommend(rec);
	}
	
	//查找有没有指定的学生
	public boolean findSRecommend(RecommendBean rec){
		return recommendDao.findRecommend(rec);
				
	}

	@Override
	public boolean findRecommend(RecommendBean recommend) {
		// TODO Auto-generated method stub
		return false;
	}

}

