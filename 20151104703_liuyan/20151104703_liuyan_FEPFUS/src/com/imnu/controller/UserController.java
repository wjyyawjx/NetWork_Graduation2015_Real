package com.imnu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.imnu.po.User;
import com.imnu.service.UserService;

@Controller
public class UserController {
     @Autowired
     private UserService userService;
     
     @RequestMapping(value = "/login.action" ,method = RequestMethod.GET)
     public String toLogin() {
    	 return "login";
     }
    
     @RequestMapping(value = "/register.action" ,method = RequestMethod.POST)
     public String register(String u_name, String u_pwd,String u_email,String u_phone,Model model,HttpSession session) {
    	 User email = userService.findEmail(u_email);
    	 User user = userService.findUser(u_name);
         if(email != null) {
        	 model.addAttribute("msg","邮箱已存在，请重新输入!");
	   		 return "register"; 
         }else if(user != null) {
	    	 model.addAttribute("msg","用户名已存在，请重新输入!");
	   		 return "register";
	   	 }else {
	    	 userService.registerUser(u_name, u_pwd,u_email,u_phone);
	       	 return "login"; 
	   	 }
         
         
     }
}
