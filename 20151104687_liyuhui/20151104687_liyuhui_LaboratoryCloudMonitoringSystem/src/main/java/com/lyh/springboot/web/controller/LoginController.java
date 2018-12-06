package com.lyh.springboot.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.springboot.common.utils.RandomValidateCode;
import com.lyh.springboot.mapper.LoginMapper;
import com.lyh.springboot.pojo.Login;

@Controller
public class LoginController {
	@Autowired LoginMapper loginMapper;
    
    @RequestMapping(value="/login.action",method= RequestMethod.POST)
    public String login(String num,String pwd, Model model,HttpSession session){
    	System.out.println("login:"+num+","+pwd);
		Login login = loginMapper.login(num, pwd);
		if(login != null) {
			session.setAttribute("USER_SESSION", login);
			return "menu";
		}
		model.addAttribute("msg","账号或密码错误请重新输入！");
		return "login";
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
    public String register(Model model, String num, String pwd,String randomjsp, int type, HttpSession session) {
        //从session中获取随机数
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	Login login = loginMapper.login(num, pwd);
        	if(login != null) {
        		model.addAttribute("msg","用户已存在，请重新输入！");
    			return "register";
    		}
        	loginMapper.addUser(num,pwd,type);
    		model.addAttribute("msg","用户注册成功，请完善信息！");
    		session.setAttribute("NUM",num);
    		if(type==0) {
    			return "register_t";
    		}
    		else {
    			return "register_s";
    		}
        }
        model.addAttribute("msg","验证码错误，请重新输入！");
		return "register";
    }
    
    @RequestMapping(value = "/register_s.action", method = RequestMethod.POST)
    public String register_s(Model model, String name, String tel, String sex, String email, String age, HttpSession session) {
    	System.out.println("register_S");
    	Login login = (Login)session.getAttribute("NUM");
    	loginMapper.perfectInformation_s(name, tel, sex, email, age, login.getNum());
    	model.addAttribute("msg","用户信息完善成功，请登录！");
    	session.invalidate();
		return "redirect:login.action";
    }
    
    @RequestMapping(value = "/register_t.action", method = RequestMethod.POST)
    public String register_t(Model model, String name, String tel, String email, HttpSession session) {
    	System.out.println("register_T");
    	Login login = (Login)session.getAttribute("USER_SESSION");   	
    	loginMapper.perfectInformation_t(name, tel, email, login.getNum());
    	model.addAttribute("msg","用户信息完善成功，请登录！");
    	return "login";
    }
    
    @RequestMapping(value = "/findpwd.action", method = RequestMethod.POST)
    public String findpwd(Model model, String num, String pwd, String randomjsp, HttpSession session) {
        //从session中获取随机数
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	Login login = loginMapper.findpwdUser(num);
        	if(login == null) {
        		model.addAttribute("msg","用户不存在，请重新输入！");
    			return "findpwd";
    		}else {
    			loginMapper.findpwd(pwd,num);
    			model.addAttribute("msg","密码重置成功，请登录！");
    			return "login";
    		}
        }
        model.addAttribute("msg","验证码错误，请重新输入！");
		return "findpwd";
    }
    
	@RequestMapping("/tologin")
	public String toLogin() {
		return "login";
	}
	@RequestMapping(value = "/tologin.action",  method = RequestMethod.GET)
	public String toLogin2() {
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
	
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.action";
	}


}
