package cn.edu.imnu.dao;

import java.util.List;

import cn.edu.imnu.po.Plan;

public interface PlanDao {

	public Integer savePlan(Plan plan);

	public List<Plan> showPlan(Integer id);

	public List<Plan> showPlanID(Integer id);


}
