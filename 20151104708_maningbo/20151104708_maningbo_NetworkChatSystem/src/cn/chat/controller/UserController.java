
package cn.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.chat.pojo.Friend;
import cn.chat.pojo.UserBean;
import cn.chat.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Resource(name="javaMailSender")
	private JavaMailSender javaMailSender;//在spring中配置的邮件发送的bean
	  
	@RequestMapping("/frame")
	public String toIndexPage(HttpServletRequest request) {
		return "frame";
	}

	@RequestMapping(value = "/login.action")
	public String findUserByUserName(String userName, String userPass, Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		UserBean userBean = userService.findUserByUserName(userName, userPass);
		if (userName == null && userPass == null) {
			model.addAttribute("msg", "请输入账号密码:");
			return "login";
		} else {
			if (userBean != null) {
				// System.out.println(userName + userPass);
				session.setAttribute("userBean", userBean);
				return "frame";
			} else {
				model.addAttribute("msg", "账号或密码错误");
				return "login";
			}
		}
	}

	@RequestMapping(value = "/index.action")
	public String goIndex() {
		return "index";
	}

	@RequestMapping(value = "/register.action")
	public String addUser(UserBean userBean, BindingResult result, Model model, HttpServletRequest request,
			HttpSession session) {
		UserBean user = userService.findUserByName(userBean.getUserName());
		if (userBean.getUserName() != null) {
			if (user == null) {
				model.addAttribute("msg", "此用户名可以使用：");
				userService.addUser(userBean);
				return "login";
			} else {
				model.addAttribute("msg", "已存在用户名，请重新输入");
				return "register";
			}
		} else {
			return "register";
		}
	}

	@RequestMapping(value = "/updateinfo.action")
	public String update(String userName, String userPass, String phoneNumber, String email, Model model,
			HttpServletRequest request, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("userBean");
		System.out.println(userName + userPass + phoneNumber + email + user.getId());
		boolean flag = userService.update(userName, userPass, phoneNumber, email, user.getId());
		if (flag == true) {
			UserBean user1 = userService.findUserById(user.getId());
			request.setAttribute("user", user1);
			model.addAttribute("user", user1);
			return "login";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/friendlist.action")
	public ModelAndView findAllUser(HttpSession session, String userName, Model model) {
		ModelAndView view = new ModelAndView();
		UserBean user = (UserBean) session.getAttribute("userBean");
		if (user != null) {
			userName = user.getUserName();
			// System.out.println(userName);
			List<Friend> friend = userService.myFriend(userName);
			System.out.println("查询好友的用户为：" + userName);
			if (friend != null) {
				view.addObject("friend", friend);
				for (Friend myfriend : friend) {
					String username = myfriend.getFriend_2();
					session.setAttribute("friend", friend);
				}
				view.setViewName("friendlist");
			} else {
				view.addObject("error", "msg");
			}
		} else {
			view.setViewName("login");
			model.addAttribute("msg", "请先登录！");
			System.out.println("请先登录！");
			return view;
		}
		return view;
	}

	@RequestMapping(value = "/personalinfo.action")
	public String personalinfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Model model) throws IOException {
		UserBean user = (UserBean) session.getAttribute("userBean");
		if (user != null) {
			// UserBean userinfo = userService.findUserById(user.getId());
			request.setAttribute("userBean", user);
			System.out.println("personalinfo:email=" + user.getEmail());
			System.out.println("personalinfo:user=" + user.getUserName());
			return "personalinfo";
		} else {
			// String flag = "unlogin";
			// request.setAttribute("flag", flag);
			model.addAttribute("msg", "请先登录！");
			return "login";
		}
	}

	@RequestMapping(value = "/logout.action")
	public String logoutByUser(Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserBean user = (UserBean) session.getAttribute("userBean");
		System.out.println("logout:start");
		if (user != null) {
			if (user.getUserName() != null) {
				System.out.println("logout:userName=" + user.getUserName());
				session.removeAttribute("userBean");
			} else {
				System.out.println("logout:userBean.getUserName() is null");
			}
			// session.removeAttribute("userBean");
		} else {
			System.out.println("logout:userBean is null");
		}

		UserBean userChk = (UserBean) session.getAttribute("userBean");
		if (userChk != null)
			System.out.println("logout:remove failed");
		return "frame";
	}

	@RequestMapping(value = "/frame.action")
	public String goframe() {
		return "frame";
	}

	@RequestMapping(value = "/golist.action")
	public String golist(HttpSession session) {
		UserBean user = null;
		if(user==null){
			System.out.println("列表获取的内容为空");
			return "list";
		}
			user = (UserBean) session.getAttribute("userBean");
			System.out.println("列表获取的用户名："+user.getUserName());
			return "list";
		
		
	}

	@RequestMapping(value = "/addfriend.action")
	public String addfriend(String friend_2, HttpSession session, Model model) {
		UserBean user = (UserBean) session.getAttribute("userBean");
		if (user == null) {
			model.addAttribute("msg", "请先登录！");
			return "login";
		} else {
			String userName = user.getUserName();
			System.out.println(userName);
			if (friend_2 == null) {
				model.addAttribute("msg", "用户名不存在！");
				return "addfriend";
			} else {
				userService.addFriend(userName, friend_2);
				// System.out.println(userName+friend_2);
				return "friendlist";
			}
		}
	}
	@RequestMapping(value = "/gochat.action")
	public String gochat() {
		return "chat";
	}
	
	@RequestMapping(value = "/chatroom.action")
	public String chatroom(HttpSession session,HttpServletRequest request,Model model) {
		UserBean user = (UserBean) session.getAttribute("userBean");
		if (user != null) {
			// UserBean userinfo = userService.findUserById(user.getId());
			request.setAttribute("userBean", user);
			System.out.println("chatroom:email=" + user.getEmail());
			return "chatroom";
		} else {
			model.addAttribute("msg", "请先登录！");
			return "login";
		}
	}
    @RequestMapping("forgetpwd.action")
    public String forgetpwd(){
    	return "forgetpwd";
    }
    @RequestMapping("websockettest.action")
    public String websockettest(){
    	return "websocketTest";
    }
    
    @RequestMapping("send.action")
    public String sendMail(String email,String getVali,Model model,HttpServletRequest request){
        System.out.println("获取网页输入的email:"+email);
        UserBean user = userService.findUserByEmail(email);
        System.out.println("获取数据库的email:"+user.getEmail());
        if(user.getEmail().equals(email)){
		    MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
		    MimeMessageHelper mMessageHelper;
		    Properties prop = new Properties();
		    String from;
		    Random random = new Random();
		    String validate="";
		    for (int i=0;i<6;i++)
		    {
		    	validate+=random.nextInt(10);
		    }
		    System.out.println(validate);
		    try {
		        mMessageHelper=new MimeMessageHelper(mMessage,true);
		        mMessageHelper.setFrom("912987977@qq.com");//发件人邮箱
		        mMessageHelper.setTo(user.getEmail());//收件人邮箱
		        mMessageHelper.setSubject("马宁博发送给您的验证码");//邮件的主题
		        mMessageHelper.setText("<p>您好，欢迎使用马宁博的聊天工具，您正在进行邮箱验证，本次验证码为：</p><br/>" +validate,true);//邮件的文本内容，true表示文本以html格式打开
		        javaMailSender.send(mMessage);//发送邮件
		        model.addAttribute("msg", "验证码发送成功");
		        request.setAttribute("validate", validate);
		        System.out.println(validate);
		        return "validate";
		    } catch (MessagingException e) {
		        e.printStackTrace();
		    }
		}
		model.addAttribute("msg", "验证码发送失败");
		return "forgetpwd"; 
        }
    @RequestMapping("validate.action")
    public String validate(String validate,Model model,HttpServletRequest request){
    	System.out.println(validate);
    	System.out.println("---------------");
    	String s =  (String) request.getAttribute("validate");
    	System.out.println(s);
    	if(validate.equals(s)){
    		return "login";
    	}
    	else{
    		 model.addAttribute("msg", "验证码错误！");
    		return"validate";
    	}
    	
    }
}
