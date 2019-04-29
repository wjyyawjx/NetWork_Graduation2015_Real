package cn.edu.imnu.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.imnu.po.User;
import cn.edu.imnu.service.MessageService;

@Controller
public class MessageController {
	// 依赖注入
//	@Autowired
//	private MessageService messageService;

	@RequestMapping(value = "/message.action")
	public String Message(Integer id, HttpSession session) {
		User user = (User) session.getAttribute("USER_SESSION");
		System.out.println(user.getU_name());
		System.out.println(id);
		return null;
	}
}
