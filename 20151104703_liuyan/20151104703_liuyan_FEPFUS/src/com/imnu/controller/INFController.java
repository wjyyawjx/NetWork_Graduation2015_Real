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
import com.imnu.service.INFService;

@Controller
public class INFController {
 
	 @Autowired
     private INFService infService;
	 @RequestMapping(value = "/SelectInf.action" ,method = RequestMethod.GET)
	 public String SelectInf(Model model,HttpSession session,HttpServletRequest request) {
		
		 List<Infm> list = infService.selectjz();
		  request.setAttribute("list", list);
	 	  return "jiazhang";
	     }
	 @RequestMapping(value = "/SelectMy.action" ,method = RequestMethod.GET)
	 public String SelectMy(Model model,HttpSession session,HttpServletRequest request) {
	 	  return "my";
	     }
}
