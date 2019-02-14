package cn.edu.imnu.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.imnu.po.User;
import cn.edu.imnu.service.UserService;
import net.sf.json.JSONObject;

@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;

	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action")
	public String toLogin(String usercode, String password, Model model, HttpSession session) {
		User user = userService.findUser(usercode, password);
		if (user != null) {
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			// 跳转到主页
			return "index";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！！");
		return "login";
	}

	@RequestMapping(value = "/registercode.action")
	@ResponseBody
	// 注册时判断账号是否存在
	public JSONObject judgeCode(String usercode) {
		User u = null;
		System.out.println(usercode);
		u = userService.findUser(usercode, null);
		HashMap<String, String> map = new HashMap<String, String>();
		if (u != null) {
			map.put("status", "error");
		}
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}

	// 注册
	@RequestMapping(value = "/add.action")
	@ResponseBody
	public String register(User user, Model model, HttpSession session) {
		int rows = userService.addUser(user);
		if (rows != 0) {
			return "redirect:TZlogin.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！！");
		return "register";
	}
}
