package cn.edu.imnu.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JumpController {
	/**
	 * 跳转注册
	 */
	@RequestMapping(value = "/register.action")
	public String toRegister(String id) {
		return "register";
	}

	/**
	 * 跳转登录
	 */
	@RequestMapping(value = "/TZlogin.action")
	public String toTZlogin() {
		return "login";
	}

	/**
	 * 跳转帮助界面
	 */
	@RequestMapping(value = "/help.action")
	public String toHelp() {
		return "help";
	}

	/*
	 * 跳转主页
	 */
	@RequestMapping(value = "/index.action")
	public String toIndex() {
		return "index";
	}

	/*
	 * 跳转添加信息界面
	 */
	@RequestMapping(value = "addMessage.action")
	public String addMessage() {
		return "post-ad";
	}
}
