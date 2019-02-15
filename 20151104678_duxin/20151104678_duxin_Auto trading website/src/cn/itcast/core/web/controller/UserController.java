package cn.itcast.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.itcast.core.bean.User;
import cn.itcast.core.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userservice;
	@RequestMapping(value="/login.action",method = RequestMethod.GET)
	public String login(String usercode,String password,Model model, HttpSession session){
		User user =userservice.findUser(usercode, password);
		if(user !=null){
			session.setAttribute("USER_SESSION", user);
			return"customer";
		}
		model.addAttribute("msg","账号密码错误！");
		return "login";
	}
}
