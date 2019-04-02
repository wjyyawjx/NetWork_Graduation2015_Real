package com.bs.sxd.dao;

import java.util.List;

import com.bs.sxd.po.Evaluation;

public interface EvaluationDao {
   //添加评论
	public void addReview(Evaluation eval);
   //分页查询
	public List<Evaluation> findeval_List(Evaluation eval);
   //查询评价信息总数，为分页提供数据
	public Integer selectevalListCount(Evaluation eval);

}
