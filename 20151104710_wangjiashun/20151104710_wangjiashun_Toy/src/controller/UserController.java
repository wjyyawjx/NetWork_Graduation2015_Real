package com.yidu.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Message;
import com.yidu.controller.vo.UserVo;
import com.yidu.domain.User;
import com.yidu.service.UserService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Controller
@RequestMapping("/user")
public class UserController {
	

	@Resource
	UserService service;
	/**
	 * 无参的遍历用户
	 * @return 用户集合
	 */
	@RequestMapping("/findUserAll")
	@ResponseBody
	public List<User> findUserAll() {
		List<User> list = service.findAll();
		return list;
	}
	
	/**
	 * 条件查询，查询所有，分页
	 * @param page 开始的行数
	 * @param pageSize 总页数
	 * @param userName 后台查询转过来的用户名
	 * @param userType 后台查询转过来的用户类型
	 * @return Map类型
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String, Object> findAll(Integer page,@RequestParam(value="limit") Integer pageSize,@RequestParam(value="key[userName]",required=false) String userName,@RequestParam(value="key[userType]",required=false) String userType) {
		User us = new User();
		//判断后台查询转过来的用户名是否为空
		if(userName==null || "".equals(userName)) {
			us.setUserName("");
		}else {
			us.setUserName(userName);
		}
		//判断后台查询转过来的用户类型是否为空
		if(userType==null || "".equals(userType)) {
			us.setUserType(null);
		}else {
			us.setUserType(Integer.valueOf(userType));
		}
		//新建一个map
		HashMap<String , Object> map = new HashMap<>();
		//获取查询的值 PageInfo接受
		PageInfo<User> list = service.findAll(page,pageSize,us);
		
		//添加到map
		map.put("code", 0);
		map.put("msg", "");
		map.put("count",list.getTotal());
		map.put("data", list.getList());
		
		return map;
	}
	/**
	 * 删除
	 * @param user 用户对象
	 * @return 一个Message工具类
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Message delete(User user) {
		//创建一个工具类
		Message message=new Message();
		//调用用户service删除的方法
		int rows=service.delete(user.getUserId());
		if(rows>0) {
			message.setMsg("删除成功");
		}else{
			message.setMsg("删除失败");
		}
		
		return message;
	}
	/**
	 * 注册
	 * @param user 用户对象
	 * @return 一个Message工具类
	 */
	@RequestMapping("/register")
	@ResponseBody
	public Message register(User user) {
		//创建一个工具类
		Message mes=new Message();
		System.out.println("进入了注册的方法");
		System.out.println("前台的手机号："+user.getUserPhone());
		System.out.println("前台的邮箱："+user.getUserEmail());
		int rows = service.register(user);
		if(rows>0) {
			mes.setState(1);
			mes.setMsg("注册成功");
		}else {
			mes.setState(0);
			mes.setMsg("注册失败");
		}
		return mes;
	}
	/**
	 * 判断用户名是否存在
	 * @param user 用户对象
	 * @return  一个Message工具类
	 */
	@RequestMapping("/findByUserName")
	@ResponseBody
	public Message findByUserName(User user) {
		//创建一个工具类
		Message mes=new Message();
		System.out.println("进入了查询用户名的方法");
		System.out.println("前台的用户名："+user.getUserName());
		User users = service.findByUser(user);
		if(users==null) {
			mes.setState(1);
			mes.setMsg("√");
		}else {
			mes.setState(0);
			mes.setMsg("此用户名已被注册");
		}
		return mes;
	}
	/**
	 * 前台登录
	 * @param user 用户对象
	 * @param session 
	 * @return 一个Message工具类
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Message login(User user,HttpSession session) {
		//创建一个工具类
		Message mes=new Message();
		System.out.println("进入了登录的方法");
		System.out.println("前台的用户名："+user.getUserName());
		User users = service.login(user);
		session.setAttribute("user", users);
		if(users==null) {
			mes.setState(0);
			mes.setMsg("用户名或密码错误");
		}else {
			mes.setState(1);
			mes.setMsg("登录成功");
		}
		return mes;
	}
	/**
	 * 后台登陆
	 * @param user 用户对象
	 * @return 一个Message工具类
	 */
	@RequestMapping("/houtailogin")
	@ResponseBody
	public Message houtaiLogin(User user) {
		//创建一个工具类
		Message mes=new Message();
		System.out.println("进入了登录后台的方法");
		System.out.println("后台的用户名："+user.getUserName());
		User users = service.backLogin(user);
		if(users==null) {
			mes.setState(0);
			mes.setMsg("用户名或密码错误");
		}else {
			mes.setState(1);
			mes.setMsg("登录成功");
			
		}
		return mes;
	}
	/**
	 * 获取存放在Session中的用户
	 * @param session
	 * @return 用户对象
	 */
	@RequestMapping("/getUser")
	@ResponseBody
	public User getUser(HttpSession session) {
		User user = (User) session.getAttribute("user");
		System.err.println("进入session"+user);
		return user;
	}
	/**
	 * 退出的方法
	 * @param session
	 * @return Message工具类
	 */
	@RequestMapping("/exit")
	@ResponseBody
	public Message exit(HttpSession session) {
		//创建一个工具类
		Message mes=new Message();
		session.removeAttribute("user");
		System.out.println("进入session的值"+session.getAttribute("user"));
		if(session.getAttribute("user")==null) {
			mes.setState(1);
			mes.setMsg("退出");
		}else {
			mes.setState(0);
		}
		return mes;
	}
	/**
	 * 用户增加和修改的方法
	 * @param user
	 * @return Message工具类
	 */
	@RequestMapping("/insertUpdate")
	@ResponseBody
	public Message insertUpdate(User user) {
		//创建一个工具类
		Message mes=new Message();
		System.err.println("进入了增加修改的方法");
		System.err.println("id====="+user.getUserId());
		int rows = service.insertorUpdate(user);
		if(rows>0) {
			mes.setState(1);
			mes.setMsg("操作成功");
		}
		
		return mes;
	}
	/**
	 * 通过用户id查询出用户对象
	 * @param userId
	 * @return 用户对象
	 */
	@RequestMapping("/selectId")
	@ResponseBody
	public User selectId(String userId) {
		System.out.println("转过来的id:"+userId);
		User users = service.selectId(userId);
		System.out.println("id："+users.getUserId()+"名字："+users.getUserName());
		return users;
	}
	
	
	@RequestMapping("/findByBill")
	@ResponseBody
	public List<UserVo> findByBill(HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			return service.findByBill(user.getUserName());
		}
		return null;
	}
}

