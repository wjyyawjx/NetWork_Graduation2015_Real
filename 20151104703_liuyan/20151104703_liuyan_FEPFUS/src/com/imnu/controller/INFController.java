package com.imnu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.imnu.po.Infm;
import com.imnu.po.Pinglun;
import com.imnu.po.User;
import com.imnu.service.INFService;

@Controller
public class INFController {
 
	 @Autowired
     private INFService infService;
	 @RequestMapping(value = "/SelectInf.action" ,method = RequestMethod.GET)
	 public String SelectInf(Model model,HttpSession session,HttpServletRequest request) {
		
		 List<Infm> list = infService.selectjz();
		  request.setAttribute("list", list);
	 	  return "right";
	     }
	 @RequestMapping(value = "/SelectTc.action" ,method = RequestMethod.GET)
	 public String SelectTc(Model model,HttpSession session,HttpServletRequest request) {
		
		 List<Infm> list = infService.selecttc();
		  request.setAttribute("list", list);
	 	  return "right";
	     }
	 @RequestMapping(value = "/SelectAll.action" ,method = RequestMethod.GET)
	 public String SelectAll(Model model,HttpSession session,HttpServletRequest request) {
		
		 List<User> list = infService.selectall();
		  request.setAttribute("list", list);
	 	  return "rootright";
	     }
	 @RequestMapping(value = "/SelectMy.action" ,method = RequestMethod.GET)
	 public String SelectMy(Model model,HttpSession session,HttpServletRequest request) {
	 	  return "my";
	     }
	 @RequestMapping(value = "/pinglun.action" ,method = RequestMethod.GET)
	 public String pinglun() {
	 	  return "pinglun";
	     }
	 @RequestMapping(value = "/pl.action" ,method = RequestMethod.POST)
	 public String pl(String name,String email, String phone,String message,HttpSession session) {
		 User user = (User) session.getAttribute("USER_SESSION");
     	 String u_user = user.getU_user(); 
		 infService.insertpl(name,email,phone,message,u_user);
		  return "pinglun";
	     }
	 @RequestMapping(value = "/Selectpl.action" ,method = RequestMethod.GET)
	 public String Selectpl(HttpServletRequest request) {
		 
		  List<Pinglun> list = infService.Selectpl();
		  request.setAttribute("list", list);
		  return "rootpinglun";
	     }
}
