package com.lyh.core.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.common.utils.RandomValidateCode;
import com.lyh.core.po.User;
import com.lyh.core.service.UserService;


@Controller 
public class UserController {
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
	 */
	@RequestMapping(value="/login.action",method= RequestMethod.POST)
	public String login(String num,String pwd, Model model,HttpSession session) {
		User user = userService.login(num, pwd);
		if(user != null) {
			session.setAttribute("USER_SESSION", user);
			return "menu";
		}
		model.addAttribute("msg","账号或密码错误请重新输入！");
		return "login";
	}
	
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.action";
	}
	
	/**
	 * 向用户登录、注册页面跳转
	 */
	@RequestMapping(value = "/tologin.action",  method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}
	@RequestMapping(value = "/toregister.action",method= RequestMethod.GET)
	public String toRegister() {
		return "register";
	}
	@RequestMapping(value = "/tofindpwd.action",method= RequestMethod.GET)
	public String tofindpwd() {
		return "findpwd";
	}
	/**
	 * 验证码图片
	 */
	@RequestMapping(value = "/getVerify.action")
    public void getVerify(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    /**
     * 验证登录
     * @param model
     * @param userName
     * @param password
     * @param inputStr
     * @param session
     * @return
     */
    @RequestMapping(value = "/register.action", method = RequestMethod.POST)
    public String register(Model model, String num, String pwd,String randomjsp, String username, String usertype, HttpSession session) {
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	User user = userService.login(num, pwd);
        	if(user != null) {
        		model.addAttribute("msg","用户已存在，请重新输入！");
    			return "register";
    		}
    		userService.addUser(num,pwd,username,usertype);
    		model.addAttribute("msg","用户注册成功，请登录！");
    		return "login";
        }
        model.addAttribute("msg","验证码错误，请重新输入！");
		return "register";
    }
    
    @RequestMapping(value = "/findpwd.action", method = RequestMethod.POST)
    public String findpwd(Model model, String num, String username,String randomjsp, String pwd, HttpSession session) {
        //从session中获取随机数
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	User user = userService.findpwdUser(num, username);
        	if(user == null) {
        		model.addAttribute("msg","用户不存在，请重新输入！");
    			return "findpwd";
    		}else {
    			userService.findpwd(pwd,num);
    			model.addAttribute("msg","密码重置成功，请登录！");
    			return "login";
    		}
        }
        model.addAttribute("msg","验证码错误，请重新输入！");
		return "findpwd";
    }


}






