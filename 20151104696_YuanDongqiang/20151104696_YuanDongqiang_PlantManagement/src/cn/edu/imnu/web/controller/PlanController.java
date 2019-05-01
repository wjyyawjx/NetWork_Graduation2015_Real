package cn.edu.imnu.web.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.imnu.po.Message;
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
	public String AddPlanMess(Plan plan, String name, String category, String place, Integer sun, Integer life,
			Integer green, String title, String time1, String time2, String time3, String planmess, String fileselect,
			HttpServletRequest request) throws Exception {
		HttpSession sess = request.getSession();
		User user = (User) sess.getAttribute("USER_SESSION");

		plan.setU_id(user.getU_id());
		plan.setP_name(name);
		plan.setP_breeding(category);
		plan.setP_place(place);
		Integer habits = sun * 100 + life * 10 + green;
		plan.setP_habits(habits);
		plan.setP_form(title);
		time1 = time1 + time2 + time3;
		plan.setP_water(time1);
		plan.setP_message(planmess);

		// 保存数据库的路径
		String sqlPath = null;
		// 定义文件保存的本地路径
		String localPath = "D:\\File\\";
		// 定义 文件名
		String filename = null;
		if (!plan.getFile().isEmpty()) {
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = plan.getFile().getContentType();
			// 获得文件后缀名
			String suffixName = contentType.substring(contentType.indexOf("/") + 1);
			// 得到 文件名
			filename = uuid + "." + suffixName;
			System.out.println(filename);
			// 文件保存路径
			plan.getFile().transferTo(new File(localPath + filename));
		}
		// 把图片的相对路径保存至数据库
		sqlPath = "/images/" + filename;

		plan.setP_img(sqlPath);
		Integer save = planService.savePlan(plan);
		if (save != 0) {
			return "index";
		} else {
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
		// for (Plan plan : planshow) {
		// System.out.println(plan.getP_id());
		// }
		model.addAttribute("planshow", planshow);
		return "plan";
	}

	// 植物详细信息
	@RequestMapping(value = "single.action")
	public String Single(Integer id, Model model, Type type) {
		Integer MessMany = planService.ShowMess(id);
		List<Message> message = planService.MessageAll(id);
		List<Plan> planshow = planService.showMessage(id);
		for (Plan plan : planshow) {
			User user = planService.finduser(plan.getU_id());
			model.addAttribute("user", user);
		}
		for (Plan plan : planshow) {
			id = plan.getP_habits();
			Integer sun = id / 100;
			Integer life = (id % 100) / 10;
			Integer green = id - (sun * 100) - (life * 10);
			type.setName("植物喜好");
			type.setT_id(sun);
			String SUN = planService.showHabits(type);
			type.setT_id(life);
			String LIFE = planService.showHabits(type);
			type.setT_id(green);
			String GREEN = planService.showHabits(type);
			String t_name = SUN + ";" + LIFE + ";" + GREEN;
			type.setT_name(t_name);
		}
		model.addAttribute("planmore", planshow);
		model.addAttribute("type", type);
		model.addAttribute("MessMany", MessMany);
		model.addAttribute("message", message);
		return "single";
	}

	// 模糊查询
	@RequestMapping(value = "findplan.action")
	public String FindPlan(String search, Model model) {
		List<Plan> plan = planService.FindPlan(search);
		model.addAttribute("planshow", plan);
		return "plan";
	}
	// 上传照片

	// @RequestMapping("/upload")
	// public String upload(User user,HttpServletRequest request,Model model) throws
	// Exception{
	// //保存数据库的路径
	// String sqlPath = null;
	// //定义文件保存的本地路径
	// String localPath="D:\\File\\";
	// //定义 文件名
	// String filename=null;
	// if(!user.getFile().isEmpty()){
	// //生成uuid作为文件名称
	// String uuid = UUID.randomUUID().toString().replaceAll("-","");
	// //获得文件类型（可以判断如果不是图片，禁止上传）
	// String contentType=user.getFile().getContentType();
	// //获得文件后缀名
	// String suffixName=contentType.substring(contentType.indexOf("/")+1);
	// //得到 文件名
	// filename=uuid+"."+suffixName;
	// //文件保存路径
	// user.getFile().transferTo(new File(localPath+filename));
	// }
	// //把图片的相对路径保存至数据库
	// sqlPath = "/images/"+filename;
	// System.out.println(sqlPath);
	// user.setImage(sqlPath);
	// userService.addUser(user);
	// model.addAttribute("user", user);
	// return "MyJsp";
	// }
}
