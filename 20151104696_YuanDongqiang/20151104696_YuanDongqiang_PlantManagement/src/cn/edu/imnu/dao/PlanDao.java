package cn.edu.imnu.dao;

import java.util.List;

import cn.edu.imnu.po.Message;
import cn.edu.imnu.po.Plan;
import cn.edu.imnu.po.Type;
import cn.edu.imnu.po.User;

public interface PlanDao {

	public Integer savePlan(Plan plan);

	public List<Plan> showPlan(Integer id);

	public List<Plan> showPlanID(Integer id);

	public List<Plan> showMessage(Integer id);

	public String showHabits(Type type);

	public User finduser(Integer u_id);

	public Integer ShowMess(Integer id);

	public List<Message> MessageAll(Integer id);

	public List<Plan> FindPlan(String search);

}
