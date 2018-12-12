package com.imnu.auction;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imnu.common.Message;
import com.imnu.model.AuUser;
import com.imnu.service.AuUserService;



/**
 * 描述：用户的action
 */
@Controller
@RequestMapping("/user")
public class AuUserAction {
	@Resource
	private AuUserService userService;
	
	/**
	 * 注册判断用户名是否存在
	 * @return
	 */
	@RequestMapping("findUserName")
	@ResponseBody
	public Message findUserName(String userName){
		AuUser user = userService.findUserName(userName);
		Message msg = new Message();
		if(user != null){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public List<AuUser> queryAll(){
		return userService.queryAll();
	}
	
	@RequestMapping("findAlls")
	@ResponseBody
	public List<AuUser> findAlls(){
		return userService.findAlls();
	}
	/**
	 * 根据ID查询
	 * @param user
	 * @return
	 */
	@RequestMapping("findById")
	@ResponseBody
	public AuUser findById(AuUser user){
		
		System.out.println("进入这个================"+user.getUserId());
		
		return userService.selectByPrimaryKey(user.getUserId());
	}
	/**
	 * 增加或修改
	 * @param user
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public Message addOrUpdate(AuUser user){
		System.out.println("------------------Id:"+user.getUserId());
		int rows = userService.addOrUpdate(user);
		Message msg = new Message();
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	@RequestMapping("selectSession")
	@ResponseBody
	public int selectSession(HttpSession session) {
		session.setAttribute("userId", 1);
		int id=(int) session.getAttribute("userId");
		return id;
	}
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public Message login(AuUser user,HttpSession session){
		Message msg = new Message();
		AuUser users = userService.login(user);
		if(users != null){
			msg.setState(1);
			session.setAttribute("user", users);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@RequestMapping("register")
	@ResponseBody
	public Message register(AuUser user){
		int rows = userService.addOrUpdate(user);
		Message msg = new Message();
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	/**
	 * 查询
	 * @param session
	 * @return
	 */
	@RequestMapping("getSession")
	@ResponseBody
	public AuUser getSession(HttpSession session) {
		AuUser user = (AuUser) session.getAttribute("user");
		if(user == null){
			user = new AuUser();
		}
		return user;
	}
	@RequestMapping("exitSession")
	@ResponseBody
	public int exitSession(HttpSession session) {
		session.removeAttribute("user");
		return 1;
	}
	/**
	 * 修改
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public Message update(AuUser user,HttpSession session){
		int rows = userService.updateByPrimaryKeySelective(user);
		Message msg = new Message();
		if(rows > 0){
			session.setAttribute("user", user);
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	
	/**
	 * 后台登录
	 * @param user
	 * @return
	 */
	@RequestMapping("htlogin")
	@ResponseBody
	public Message htlogin(AuUser user,HttpSession session){
		Message msg = new Message();
		AuUser users = userService.htLogin(user);
		if(users != null){
			msg.setState(1);
			session.setAttribute("admin", users);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	@RequestMapping("adminSession")
	@ResponseBody
	public int adminSession(HttpSession session) {
		AuUser user=(AuUser) session.getAttribute("admin");
		if(user==null) {
			return 0;
		}else {
			return 1;
		}
	}
	@RequestMapping("adminExit")
	@ResponseBody
	public int adminExit(HttpSession session) {
		session.removeAttribute("admin");
		return 1;
	}
	/**
	 * 根据名字查询
	 * @param userName
	 * @return
	 */
	@RequestMapping("findByUser")
	@ResponseBody
	public List<AuUser> findByUser(String userName){
		List<AuUser> list = userService.findByUser(userName);
		return list;
	}
}
