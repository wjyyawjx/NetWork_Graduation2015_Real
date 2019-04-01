package com.qst.dao;

import java.util.List;

import com.qst.bean.RecommendBean;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-09  All rights reserved.
 *
 * @ class description：对推荐表的操作接口
 *
 */
public interface RecommendDao {
	//获取所有商品信息
	public List<RecommendBean> getAllRecommend();
	//获取商品信息
	public RecommendBean getRecommendMoreInfo(RecommendBean rec);
	//添加商品
	public int addRecommend(RecommendBean rec);
	//删除商品
	public int delRecommendt(RecommendBean rec);
	//修改商品信息
	public int modifyRecommend(RecommendBean rec);
	//查找指定的商品存在不存在
	public boolean findRecommend(RecommendBean rec);
	int delRecommend(RecommendBean recommend);

}
