package cn.edu.imnu.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.imnu.po.User;
import cn.edu.imnu.service.UserService;

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
}
