package com.lyh.springboot.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//专门用于显示页面的控制器
@Controller
@RequestMapping("")
public class PageController {

	@RequestMapping("login")
	public String index() {
		return "login";
	}

	@RequestMapping("unauthorized")
	public String noPerms() {
		return "unauthorized";
	}

}
