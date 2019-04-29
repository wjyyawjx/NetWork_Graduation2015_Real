package cn.edu.imnu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.imnu.dao.PlanDao;
import cn.edu.imnu.dao.UserDao;
import cn.edu.imnu.po.Plan;
import cn.edu.imnu.po.Type;
import cn.edu.imnu.po.User;
import cn.edu.imnu.service.PlanService;

/**
 * 用户Service接口实现类
 */
@Service("planService")
@Transactional
public class PlanServiceLImpl implements PlanService {
	@Autowired
	private PlanDao planDao;

	@Override
	public Integer savePlan(Plan plan) {
		return planDao.savePlan(plan);
	}

	@Override
	public List<Plan> showPlan(Integer id) {
		return planDao.showPlan(id);
	}

	@Override
	public List<Plan> showPlanID(Integer id) {
		return planDao.showPlanID(id);
	}

	@Override
	public List<Plan> showMessage(Integer id) {
		return planDao.showMessage(id);
	}

	@Override
	public String showHabits(Type type) {
		return planDao.showHabits(type);
	}

	@Override
	public User finduser(Integer u_id) {
		return planDao.finduser(u_id);
	}

}
