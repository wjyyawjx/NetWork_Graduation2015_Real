package cn.edu.imnu.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.imnu.po.IP;
import cn.edu.imnu.po.User;
import cn.edu.imnu.service.IndexService;
import net.sf.json.JSONObject;

@Controller
public class IndexController {
	// 依赖注入
	@Autowired
	private IndexService indexService;

	public User IPFind(String u_ip, HttpSession session) {
		User user = null;
		IP ipAdress = null;
		ipAdress = indexService.IpFind(u_ip);
		System.out.println(ipAdress);
		if (ipAdress != null) {
			System.out.println("12323");
			Integer u_id = ipAdress.getU_id();
			user = indexService.find(u_id);
			session.setAttribute("USER_SESSION", user);

		}
		return user;
	}

	// 加载主页
	@RequestMapping(value = "/JZIndex.action")
	@ResponseBody
	public JSONObject JZIndex() {
		System.out.println("heihei");
		HashMap<String, String> map = new HashMap<String, String>();
			map.put("status", "ok");
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}

}
