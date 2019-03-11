package cn.edu.imnu.web.controller;

import java.net.UnknownHostException;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.imnu.po.IP;
import cn.edu.imnu.po.User;
import cn.edu.imnu.service.IndexService;
import cn.edu.imnu.service.UserService;
import net.sf.json.JSONObject;

@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;
	@Autowired
	private IndexService indexService;
	@Autowired
	private IndexController indexController;

	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action")
	public String toLogin(String usercode, String password, Model model, HttpSession session) {
		User user = userService.findUser(usercode, password);
		if (user != null) {
			// 获取windows本机IP
			try {
				String u_ip = java.net.InetAddress.getLocalHost().getHostAddress();
				Date u_time = new Date();
				long day = getDatePoor(u_time, user.getU_time());
				System.out.println(day);
				System.out.println(u_ip);
				if (u_ip != user.getU_ip()) {
					user.setU_ip(u_ip);
					user.setU_time(u_time);
					userService.SaveIp(user);
				}
				user.setU_time(u_time);
				userService.SaveIp(user);
				// 将用户对象添加到Session
				session.setAttribute("USER_SESSION", user);
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
			// 跳转到主页
			return "index";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！！");
		return "login";
	}

	@RequestMapping(value = "/registercode.action")
	@ResponseBody
	// 注册时判断账号是否存在
	public JSONObject registercode(String usercode) {
		User u = null;
		u = userService.findUser(usercode, null);
		HashMap<String, String> map = new HashMap<String, String>();
		if (u != null) {
			map.put("status", "error");
		}
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}

	@RequestMapping(value = "/registeremail.action")
	@ResponseBody
	// 注册时判断邮箱是否存在
	public JSONObject registeremail(String u_email) {
		User u = null;
		u = userService.findUseremail(u_email);
		HashMap<String, String> map = new HashMap<String, String>();
		if (u != null) {
			map.put("status", "error");
		}
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}

	// 注册
	@RequestMapping(value = "/add.action")
	public String register(User user, Model model, HttpSession session) {
		String u_type = "普通用户";
		user.setU_type(u_type);
		int rows = userService.addUser(user);
		if (rows != 0) {
			return "redirect:TZlogin.action";
		}
		model.addAttribute("msg", "注册失败，请重新输入！！");
		return "register";
	}

	// 退出登录
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		session.removeAttribute("USER_SESSION");
		return "index";
	}

	// 计算时间差
	public static Long getDatePoor(Date endDate, Date nowDate) {

		long nd = 1000 * 24 * 60 * 60;
		long nh = 1000 * 60 * 60;
		long nm = 1000 * 60;
		// 获得两个时间的毫秒时间差异
		long diff = endDate.getTime() - nowDate.getTime();
		// 计算差多少天
		long day = diff / nd;
		// 计算差多少小时
		long hour = diff % nd / nh;
		// 计算差多少分钟
		long min = diff % nd % nh / nm;
		// 计算差多少秒//输出结果
		System.out.println(day + "天" + hour + "小时" + min + "分钟");
		return day;
	}

}
