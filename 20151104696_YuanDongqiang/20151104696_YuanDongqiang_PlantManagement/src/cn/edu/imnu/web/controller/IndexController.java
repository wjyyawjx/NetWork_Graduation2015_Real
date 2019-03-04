package cn.edu.imnu.web.controller;

import java.util.Date;
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
		if (ipAdress != null) {
			Integer u_id = ipAdress.getU_id();
			user = indexService.find(u_id);
			session.setAttribute("USER_SESSION", user);

		}
		return user;
	}

	// 判断本机IP是否存在数据库中
	public void IPuesing(String u_ip, Date u_time, Integer u_id) {
		IP ipAdress = null;
		System.out.println(ipAdress);
		ipAdress = indexService.IpFind(u_ip);
		if (ipAdress.getU_ip() != null) {
			ipAdress.setU_ip(u_ip);
			ipAdress.setU_time(u_time);
			ipAdress.setU_id(u_id);
			indexService.updateIp(ipAdress);

		} else {
			ipAdress.setU_ip(u_ip);
			ipAdress.setU_id(u_id);
			ipAdress.setU_time(u_time);
			indexService.addIp(ipAdress);
		}
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
