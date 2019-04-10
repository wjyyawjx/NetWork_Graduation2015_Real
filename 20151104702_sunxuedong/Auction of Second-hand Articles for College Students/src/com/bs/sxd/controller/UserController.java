package com.bs.sxd.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.bs.common.utils.Page;
import com.bs.sxd.po.User;
import com.bs.sxd.service.UserService;
/**
 * 用户控制器类
 * 
 * @author 孙雪冬
 *
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;
	/*
	 * 登陆
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username, String password, Integer type, Model model, HttpSession session) {
		User user = userService.findUser(username, password, type);
		if (user != null) {
			if (user.getType() == 0) {
				session.setAttribute("USER_SESSION", user);		
				return "main";
			} else {
				return "admin";
			}

		} else {
			model.addAttribute("msg", "账号或密码错误！！");
			return "login";
		}
	}
   //查询个人信息
	@RequestMapping(value = "/findper.action", method = RequestMethod.POST)
	public String findper(Integer id, HttpSession session) {
		session.getAttribute("USER_SESSION");
		User user = userService.findper(id);
		session.setAttribute("USER_SESSION", user);
		return "personalinformation_user";
	}
	// 关于用户注册的表单提交
	@RequestMapping(value = "/personalinformation_user.action")
	public String personalinformation_user() {
		return "personalinformation_user";
	}
	// 添加用戶
	@RequestMapping(value = "/add.action", method = RequestMethod.POST)
	public String register(User user, String username, String password, String phone, String qq, String sex,
			String university, String college, String adreess, Model model) {
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setSex(sex);
		user.setQq(qq);
		user.setUniversity(university);
		user.setCollege(college);
		user.setAdreess(adreess);
		Integer type = 0;
		user.setType(type);
		User u = null;
		u = userService.findByUserName(username);
		if (u == null) {
			userService.addUser(user);
			return "login";
		} else {
			model.addAttribute("msg_zc", "！该用户已经存在，请更换用户名！");
			return "register";
		}
	}
	// 管理员分页、模糊、条件搜索用户
	@RequestMapping(value = "/finduserlist.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows_u,
			String username, String sex, Model model) {
		if (username != null && username != "") {
			username = "%" + username + "%";
		}	
		Page<User> user = userService.findUserList(page, rows_u, username, sex);
		// 添加参数
		model.addAttribute("page", user);
		model.addAttribute("l_name", username);
		model.addAttribute("l_static", sex);
		return "table-user-list";
	}
 //修改个人信息
	@RequestMapping(value = "/editpersoninfo.action")
	public String edit_person_info(Integer id,String username,String password,String sex, String phone, String qq, String university, String college, String adreess) {
		User user = new User();
	    user.setId(id);
	    user.setUsername(username);
	    user.setPassword(password);
	    user.setSex(sex);
	    user.setPhone(phone);
	    user.setQq(qq);
	    user.setUniversity(university);
	    user.setCollege(college);
	    user.setAdreess(adreess);
		userService.updateUser(user);	
		return "login";
	}
	//修改用户为管理员
		@RequestMapping(value = "/updateUser_a.action")
		public String update_Admin(Integer type,Integer id,Model model) {			
			User user = new User();
			System.out.println(type);
			if(type == 0){
			    	type = 1;
			    }else{
			    	model.addAttribute("msg_a", "已经是管理员，无需设置！！");
			    	return "table-user-list";
			    }
			user.setId(id);
		    user.setType(type);
			userService.updateUser_Admin(user);	
			return "table-user-list";			
		}
		//修改管理员为用户
				@RequestMapping(value = "/updateUser_p.action")
				public String update_User(Integer type,Integer id,Model model) {			
					User user = new User();
					System.out.println(type);
					if(type == 1){
					    	type = 0;
					    }else{
					    	model.addAttribute("msg_a", "已经是普通用户，无需设置！！");
					    	return "table-user-list";
					    }
					user.setId(id);
				    user.setType(type);
					userService.updateUser_Admin(user);	
					return "table-user-list";			
				}
				//删除用户
				@RequestMapping(value = "/deleteUser.action")
				public String delete_User(Integer id) {			
					userService.deleteuser(id);
					return "table-user-list";			
				}
				/**
				 * 退出登录
				 */
				@RequestMapping(value = "/logout.action")
				public String logout(HttpSession session) {
					// 清除Session
					session.invalidate();
					// 重定向到登录页面的跳转方法
					return "redirect:login.action";
				}
				// 关于用户注册的表单提交
				@RequestMapping(value = "/register.action")
				public String register() {
					return "register";
				}
				@RequestMapping(value = "/person.action")
				public String person() {
					return "person";
				}
				@RequestMapping(value = "/main.action")
				public String main() {
					return "main";
				}
				@RequestMapping(value = "/table-user-list.action")
				public String table_user_list() {
					return "table-user-list";
				}
				@RequestMapping(value = "/table-goods-list-admin.action")
				public String table_goods_list_admin() {
					return "table-goods-list-admin";
				}
				@RequestMapping(value = "/form-news.action")
				public String form_news() {
					return "form-news";
				}
				@RequestMapping(value = "/form-show-goods.action")
				public String form_show_goods() {
					return "form-show-goods";
				}
				@RequestMapping(value = "/form-show-goods-user.action")
				public String form_show_goods_user() {
					return "form-show-goods-user";
				}
				@RequestMapping(value = "/form-lease.action")
				public String form_lease() {
					return "form-lease";
				}
}
