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
	public String login(String uname,String upwd, Model model,HttpSession session) {
		User user = userService.login(uname, upwd);
		if(user != null) {
			session.setAttribute("USER_SESSION", user);
			return "menu";
		}
		model.addAttribute("msg","账号或密码错误请重新输入！");
		return "login";
	}
	

}






