package cn.edu.imnu.web.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.imnu.po.User;
import cn.edu.imnu.po.Message;
import cn.edu.imnu.service.MessageService;
import net.sf.json.JSONObject;

@Controller
public class MessageController {
	// 依赖注入
	@Autowired
	private MessageService messageService;

	@RequestMapping(value = "/message.action")
	public JSONObject Message(Integer id, HttpSession session,String text,Message message) {
		Date m_time = new Date();
		User user = (User) session.getAttribute("USER_SESSION");
		message.setP_id(id);
		message.setU_id(user.getU_id());
		message.setM_text(text);
		message.setM_read(1);
		message.setM_time(m_time);
		Integer mess = messageService.AddMessage(message);
		HashMap<String, String> map = new HashMap<String, String>();
		if(mess != 0) {
			map.put("status", "ok");
		}
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
