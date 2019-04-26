package cn.edu.imnu.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.imnu.po.Plan;
import cn.edu.imnu.po.Type;
import cn.edu.imnu.po.User;
import cn.edu.imnu.service.PlanService;

@Controller
public class PlanController {
	// 依赖注入
	@Autowired
	private PlanService planService;

	// 添加植物信息
	@RequestMapping(value = "AddPlanMess.action")
	public String AddPlanMess(String name, String category, String place, Integer sun, Integer life, Integer green,
			String title, String time1, String time2, String time3, String planmess, String fileselect,
			HttpServletRequest request) {
		HttpSession sess = request.getSession();
		User user = (User) sess.getAttribute("USER_SESSION");
		Plan plan = new Plan();
		plan.setU_id(user.getU_id());
		plan.setP_name(name);
		plan.setP_breeding(category);
		plan.setP_place(place);
		Integer habits = sun*100 + life*10 + green;
		plan.setP_habits(habits);
		plan.setP_form(title);
		time1 = time1 + time2 + time3;
		plan.setP_water(time1);
		plan.setP_message(planmess);
		plan.setP_img(fileselect);
		Integer save = planService.savePlan(plan);
		if (save != 0) {
			JOptionPane.showMessageDialog(null, "上传信息成功，请等待审核！", "成功", JOptionPane.ERROR_MESSAGE);
			return "index";
		} else {
			JOptionPane.showMessageDialog(null, "上传信息失败，请重新输入！", "失败", JOptionPane.ERROR_MESSAGE);
			return "post-ad";
		}
	}

	// 显示植物信息
	@RequestMapping(value = "plan.action")
	public String Plan(Integer id, Model model) {
		List<Plan> planshow = null;
		switch (id) {
		case 0:
			planshow = planService.showPlan(null);
			break;

		default:
			planshow = planService.showPlanID(id);
			break;
		}
		// list循环遍历
//		for (Plan plan : planshow) {
//			System.out.println(plan.getP_id());
//		}
		model.addAttribute("planshow", planshow);
		return "plan";
	}

	//植物详细信息
	@RequestMapping(value = "single.action")
	public String Single(Integer id, Model model,Type type) {
		List<Plan> planshow = planService.showMessage(id);
		for (Plan plan : planshow) {
			id = plan.getP_habits();
			Integer sun = id/100;
			Integer life =(id%100)/10;
			Integer green = id - (sun*100)-(life*10);
			type.setName("植物喜好");
			type.setT_id(sun);
			String SUN = planService.showHabits(type);
			type.setT_id(life);
			String LIFE = planService.showHabits(type);
			type.setT_id(green);
			String GREEN = planService.showHabits(type);
			String t_name = SUN +"," + LIFE + "," + GREEN;
			type.setT_name(t_name);
		}
		model.addAttribute("planmore", planshow);
		model.addAttribute("type", type);
		return "single";
	}
}
