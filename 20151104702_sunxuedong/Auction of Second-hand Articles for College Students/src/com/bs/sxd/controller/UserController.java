package com.bs.sxd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value="/login.action", method = RequestMethod.POST)
	public String login(String username, String password,Model model, HttpSession session) {
		User user = userService.findUser(username, password);
		if (user != null) {
		 if(user.getType() == 0){
			 session.setAttribute("USER_SESSION", user);
			   return "main";
		}else{
			return "admin";
		}
		  
			 
		}else
		{
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

}
