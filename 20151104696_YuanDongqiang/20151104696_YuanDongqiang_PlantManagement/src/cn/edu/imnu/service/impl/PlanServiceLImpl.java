package cn.edu.imnu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.imnu.dao.PlanDao;
import cn.edu.imnu.po.Plan;
import cn.edu.imnu.service.PlanService;

/**
 * 用户Service接口实现类
 */
@Service("planService")
@Transactional
public class PlanServiceLImpl implements PlanService {
	@Autowired
	private PlanDao palnDao;

	@Override
	public Integer savePlan(Plan plan) {
		return palnDao.savePlan(plan);
	}

}
