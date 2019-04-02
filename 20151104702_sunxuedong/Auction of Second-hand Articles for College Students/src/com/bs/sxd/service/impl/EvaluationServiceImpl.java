package com.bs.sxd.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bs.common.utils.Page;
import com.bs.sxd.dao.EvaluationDao;
import com.bs.sxd.po.Evaluation;
import com.bs.sxd.service.EvaluationService;
/**
 * 用户Service接口实现类
 * 
 * @author 孙雪冬
 *
 */
@Service("evaluationService")
@Transactional
public class EvaluationServiceImpl implements EvaluationService {
	// 注入GoodsDao
	@Autowired
	private EvaluationDao evaluationDao;
	// 添加评价信息
	@Override
	public void addReview(Evaluation eval) {
		evaluationDao.addReview(eval);
	}
	// 分页查询评价信息
	@Override
	public Page<Evaluation> findeval_List(Integer page, Integer rows_p, Integer l_id) {
		Evaluation eval = new Evaluation();
		// 当前页
		eval.setStart((page - 1) * rows_p);
		// 每页数
		eval.setRows(rows_p);
		// 存起来，不然xml文件取不到值
		eval.setL_id(l_id);	
		List<Evaluation> evals = evaluationDao.findeval_List(eval);
		// 查询商品列表总记录数
		Integer count = evaluationDao.selectevalListCount(eval);
		// 创建Page返回对象
		Page<Evaluation> result = new Page<Evaluation>();
		result.setPage(page);
		result.setRows_p(evals);
		result.setSize(rows_p);
		result.setTotal(count);
		return result;
	}
}
