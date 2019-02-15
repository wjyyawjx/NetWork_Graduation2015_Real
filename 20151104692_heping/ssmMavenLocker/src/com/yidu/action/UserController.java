package com.yidu.action;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yidu.domain.JsonMessage;
import com.yidu.domain.Pages;
import com.yidu.domain.User;
import com.yidu.service.UserService;
import com.yidu.util.Message;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wuqi
 * @since 2018-10-23
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	/**
	 * 登陆进来如果消费超过100就修改成会员
	 * @param session
	 * @return
	 */
	@RequestMapping("/commonAndMember")
	@ResponseBody
	public int commonAndMember(HttpSession session) {
		
		User user = (User) session.getAttribute("useryh");
		if(user!=null) {
			userService.commonAndMember(user.getuId());
		}else {
			return 1;
		}
		return 0;
	}
	
	/**
	 * 清空session
	 * @param session
	 * @return
	 */
	@RequestMapping("/removeSession")
	@ResponseBody
	public JsonMessage removeSession(HttpSession session) {
		JsonMessage jm = new JsonMessage();
		session.removeAttribute("useryh");
	
		jm.setState(1);
		
		return jm;
		
	}
	
	/**
	 * 个人中心根据id查询
	 * @param session
	 * @return
	 */
	@RequestMapping("/userSelect")
	@ResponseBody
	public User userSelect(HttpSession session) {
		User user = (User) session.getAttribute("useryh");
		User user2 = userService.showUpdate(user.getuId());
		return user2;
	}
	
	
	/**
	 * 增加和修改
	 * @param user
	 * @return
	 */
	@RequestMapping("/addOrUpdate")
	@ResponseBody
	public JsonMessage addOrUpdate(User user) {
		JsonMessage jm = new JsonMessage();
		int rows = userService.addOrUpdate(user);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	
	/**
	 * 根据id查询
	 * @param uId
	 * @return
	 */
	@RequestMapping("/showUpdate")
	@ResponseBody
	public User showUpdate(String uId) {
		return userService.showUpdate(uId);
	}
	
	/**
	 * 查询行数和模糊查询行数
	 * @param uZh
	 * @return
	 */
	@RequestMapping("/backFindCount")
	@ResponseBody
	public Pages backFindCount(String uZh) {
		int rows = userService.backFindCount(uZh);
		Pages page = new Pages();
		page.setTotalRows(rows);
		return page;
	}
	
	
	/**
	 * 查询所有和模糊查询
	 * @param user
	 * @return
	 */
	@RequestMapping("/backFindAll")
	@ResponseBody
	public List<User> backFindAll(User user){
		return userService.backFindAll(user);
	}
	
	/**
	 * 取session
	 * @param session
	 * @return
	 */
	@RequestMapping("/getSession")
	@ResponseBody
	public User getSession(HttpSession session) {
		User user = (User) session.getAttribute("user");
		return user;
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List<User> findAll(){
		return userService.findAll();
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(User user){
		return userService.insert(user);
	}
	
	@RequestMapping("delete")
	public int delete(String uId){
		return userService.delete(uId);
	}
	
 	/**
	 * 登录
	 * @param users
	 * @return
	 */
	@RequestMapping("loginFindName")
	@ResponseBody
	public User loginFindName(HttpSession session,User users) {
		User us=userService.selectShow(users);
		if(us!=null) {
			if("3".equals(us.getuType())) {
				session.setAttribute("user", us);
			}else {
				session.setAttribute("useryh", us);
			}
			return us;
		}else {
			User user = new User();
			user.setuType("4");
			return user;
		}
	}
	/**
	 * 注册
	 * @param user
	 * @return
	 */
 	@RequestMapping("regist")
 	@ResponseBody
 	public Message regist(User user){
 		int user2 = userService.insert(user);
		Message message = new Message();
		if(user2>0){
			message.setState(1);
			message.setMsg("注册成功");
		}else{
			message.setState(0);
			message.setMsg("该账户已存在");
		}

		return message;
 	}
 	
 	/**
 	 * 判断用户名是否存在
 	 * @param uZh
 	 * @return
 	 */
 	@RequestMapping("YongHuMing")
 	@ResponseBody
 	public JsonMessage YongHuMing(String uZh) {
 		JsonMessage jm = new JsonMessage();
 		User user = userService.YongHuMing(uZh);
 		if(user!=null) {
 			jm.setState(1);
 		}else {
 			jm.setState(0);
 		}
 		return jm;
 	}
 	
 	/**
 	 * 根据id删除
 	 * @param uId
 	 * @return
 	 */
 	@RequestMapping("showDelete")
 	@ResponseBody
 	public JsonMessage showDelete(String uId) {
 		JsonMessage jm = new JsonMessage();
 		int rows = userService.showDelete(uId);
 		if(rows>0) {
 			jm.setState(1);
 		}else {
 			jm.setState(0);
 		}
 		return jm;
 	}
}

