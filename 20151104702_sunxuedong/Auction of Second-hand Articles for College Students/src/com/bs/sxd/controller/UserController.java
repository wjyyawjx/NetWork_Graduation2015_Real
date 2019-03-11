package com.bs.sxd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bs.sxd.po.User;
import com.bs.sxd.service.UserService;

/**
 * 用户控制器类
 * 
 * @author 孙雪冬
 *
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;

	/*
	 * 登陆
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username, String password, Integer type, Model model, HttpSession session) {
		// System.out.println(username);
		User user = userService.findUser(username, password, type);
		if (user != null) {
			if (user.getType() == 0) {
				session.setAttribute("USER_SESSION", user);
				return "main";
			} else {
				return "admin";
			}

		} else {
			model.addAttribute("msg", "账号或密码错误！！");
			return "login";
		}
	}

	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		// 清除Session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "redirect:login.action";
	}

	// 关于用户注册的表单提交
	@RequestMapping(value = "/register.action")
	public String register() {
		return "register";
	}

	@RequestMapping(value = "/person.action")
	public String person() {
		return "person";
	}

	@RequestMapping(value = "/zulinShop.action")
	public String zulinShop() {
		return "zulinShop";
	}
	@RequestMapping(value = "/table-user-list.action")
	public String table_user_list() {
		return "table-user-list";
	}
	@RequestMapping(value = "/table-goods-list-admin.action")
	public String table_goods_list_admin() {
		return "table-goods-list-admin";
	}
	@RequestMapping(value = "/form-news.action")
	public String form_news() {
		return "form-news";
	}
	@RequestMapping(value = "/form-show-goods.action")
	public String form_show_goods() {
		return "form-show-goods";
	}
	@RequestMapping(value = "/form-show-goods-user.action")
	public String form_show_goods_user() {
		return "form-show-goods-user";
	}
	@RequestMapping(value = "/form-lease.action")
	public String form_lease() {
		return "form-lease";
	}

	@RequestMapping(value = "/add.action", method = RequestMethod.POST)
	public String register(User user, String username, String password, String phone, String qq, String sex,
			String university, String college, String adreess) {
		//System.out.println(username);
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setSex(sex);
		user.setQq(qq);
		user.setUniversity(university);
		user.setCollege(college);
		user.setAdreess(adreess);
		Integer type = 0;
		user.setType(type);
		//System.out.println(user);
		User u = null;
		u = userService.findByUserName(username);
		if (u == null) {
			System.out.println(u);
			userService.addUser(user);
			return "login";
		} else {
			return "register";
		}
		// return "register";
	}

}
