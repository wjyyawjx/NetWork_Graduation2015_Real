package cn.edu.imnu.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.imnu.po.Plan;
import cn.edu.imnu.po.User;
import cn.edu.imnu.service.PlanService;

@Controller
public class PlanController {
	// 依赖注入
	@Autowired
	private PlanService planService;

	@RequestMapping(value = "AddPlanMess.action")
	public String AddPlanMess(String name,String category,
			String place,String sun,String life,String green,
			String title,String time1,String time2,String time3,String planmess, 
			String fileselect,HttpServletRequest request) {
		HttpSession sess = request.getSession();
		User user =(User) sess.getAttribute("USER_SESSION");
		Plan plan = new Plan();
		plan.setU_id(user.getU_id());
		plan.setP_name(name);
		plan.setP_breeding(category);
		plan.setP_place(place);
		String habits = sun + life + green;
		plan.setP_habits(habits);
		plan.setP_form(title);
		time1=time1+time2+time3;
		plan.setP_water(time1);
		plan.setP_message(planmess);
		plan.setP_img(fileselect);
		Integer save = planService.savePlan(plan);
		if (save != 0) {
			JOptionPane.showMessageDialog(null, "上传信息成功，请等待审核！", "成功", JOptionPane.ERROR_MESSAGE);
			return "index";
		}else
		{
			JOptionPane.showMessageDialog(null, "上传信息失败，请重新输入！", "失败", JOptionPane.ERROR_MESSAGE);
			return "post-ad";
		}
	}
}
