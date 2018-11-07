package com.lyh.core.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.core.po.User;
import com.lyh.core.service.UserService;


@Controller 
public class UserController {
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
	 */
	@RequestMapping(value="/login.action",method= RequestMethod.POST)
	public String login(String num,String pwd, Model model,HttpSession session) {
		User user = userService.login(num, pwd);
		if(user != null) {
			session.setAttribute("USER_SESSION", user);
			return "menu";
		}
		model.addAttribute("msg","账号或密码错误请重新输入！");
		return "login";
	}
	
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.action";
	}
	
	/**
	 * 向用户登录、注册页面跳转
	 */
	@RequestMapping(value = "/tologin.action",  method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}
	@RequestMapping(value = "/toregister.action",method= RequestMethod.GET)
	public String toRegister() {
		return "register";
	}
	@RequestMapping(value = "/tofindpwd.action",method= RequestMethod.GET)
	public String tofindpwd() {
		return "findpwd";
	}
	

}






