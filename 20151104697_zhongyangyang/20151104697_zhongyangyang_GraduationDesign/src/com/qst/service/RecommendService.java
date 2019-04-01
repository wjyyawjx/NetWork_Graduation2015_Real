package com.qst.service;

import java.util.List;

import com.qst.bean.RecommendBean;
import com.qst.servlet.Recommend;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作学生
 *
 */
public interface RecommendService {
	//获取所有学生信息
	public List<RecommendBean> getAllRecommend();
	//获取指定学生信息
	public RecommendBean getRecommendMoreInfo(RecommendBean recommend);
	//添加学生
	public int addRecommend(RecommendBean recommend);
	//删除学生
	public int delRecommend(RecommendBean rec);
	//修改学生信息
	public int modifyRecommend(RecommendBean recommend);
	//查找有没有指定的学生
	public boolean findRecommend(RecommendBean recommend);
}
