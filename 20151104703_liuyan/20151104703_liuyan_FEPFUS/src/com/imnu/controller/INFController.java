package com.imnu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class INFController {
	 @RequestMapping(value = "/SelectInf.action" ,method = RequestMethod.GET)
	 public String SelectInf(Model model,HttpSession session) {
	 	return "jiazhang";
	     }
}
