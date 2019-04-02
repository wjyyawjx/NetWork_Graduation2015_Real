package com.bs.sxd.service;
import com.bs.common.utils.Page;
import com.bs.sxd.po.Evaluation;
/**
 * Service 接口
 * 
 * @author 孙雪冬
 *
 */
public interface EvaluationService {
    //添加评论
	public void addReview(Evaluation eval);
    //分页查询评价信息
	public Page<Evaluation> findeval_List(Integer page, Integer rows_p, Integer l_id);
}
