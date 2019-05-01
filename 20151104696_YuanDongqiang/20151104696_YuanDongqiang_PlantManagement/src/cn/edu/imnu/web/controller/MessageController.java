package cn.edu.imnu.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.imnu.po.User;
import cn.edu.imnu.po.Message;
import cn.edu.imnu.service.MessageService;
import cn.edu.imnu.service.PlanService;
import net.sf.json.JSONObject;

@Controller
public class MessageController {
	// 依赖注入
	@Autowired
	private MessageService messageService;
	@Autowired
	private PlanService planService;

	@RequestMapping(value = "/message.action")
	public JSONObject Message(Integer id, HttpSession session,String text,Message message,Model model) {
		Date m_time = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(m_time);
		User user = (User) session.getAttribute("USER_SESSION");
		message.setP_id(id);
		message.setU_id(user.getU_id());
		message.setM_text(text);
		message.setM_read(1);
		message.setM_time(dateString);
		Integer mess = messageService.AddMessage(message);
		HashMap<String, String> map = new HashMap<String, String>();
		if(mess != 0) {
			map.put("status", "ok");
		}
		List<Message> message2 = planService.MessageAll(id);
		model.addAttribute("message", message2);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
