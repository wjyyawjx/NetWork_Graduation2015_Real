package com.lyh.springboot.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyh.springboot.common.utils.RandomValidateCode;
import com.lyh.springboot.pojo.User;
import com.lyh.springboot.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
    
    @RequestMapping(value="/login",method= RequestMethod.POST)
    public String login(String num,String pwd, Model model){
    	System.out.println("login:"+num+","+pwd);
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(num, pwd);
		System.out.println(token);
		try {
			subject.login(token);
			Session session = subject.getSession();
			session.setAttribute("subject", subject);
			return "redirect:menu";

		} catch (AuthenticationException e) {
			model.addAttribute("error", "验证失败");
			return "login";
		}
    }
    
    /**
	 * 验证码图片
	 */
	@RequestMapping(value = "/getVerify")
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
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Model model, String num, String pwd,String randomjsp, int type,  String name, String tel, String sex, String email, Integer age, HttpSession session) {
        //从session中获取随机数
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	User user = userService.findUserName(num);
        	if(user != null) {
        		model.addAttribute("msg","用户已存在，请重新输入！");
    			return "register";
    		}else {
    			String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        		int times = 2;
        		String algorithmName = "md5";
        		String encodedPassword = new SimpleHash(algorithmName, pwd, salt, times).toString();
        		User u = new User();
        		u.setNum(num);
        		u.setPassword(encodedPassword);
        		u.setSalt(salt);
        		u.setAge(age);
        		u.setEmail(email);
        		u.setSex(sex);
        		u.setTel(tel);
        		userService.add(u);
        		model.addAttribute("msg","用户注册成功，请登录！");
        		return "redirect:tologin.action";
    		}
        	
        }
        model.addAttribute("msg","验证码错误，请重新输入！");
		return "register";
    }
    
    
    @RequestMapping(value = "/findpwd", method = RequestMethod.POST)
    public String findpwd(Model model, String num, String pwd, String randomjsp, HttpSession session) {
        //从session中获取随机数
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	System.out.println(num);
        	User user = userService.findUserName(num);
        	System.out.println(user);
        	if(user != null) {	
        		if (pwd.length() != 0) {
    				String salt = new SecureRandomNumberGenerator().nextBytes().toString();
    				int times = 2;
    				String algorithmName = "md5";
    				String encodedPassword = new SimpleHash(algorithmName, pwd, salt, times).toString();
    				user.setSalt(salt);
    				user.setPassword(encodedPassword);
    				userService.update(user);
    				model.addAttribute("msg","密码重置成功，请登录！");
        			return "login";
        		}
    		}else {
    			model.addAttribute("msg","用户不存在，请重新输入！");
    			return "findpwd";
    		}
        }
        model.addAttribute("msg","验证码错误，请重新输入！");
		return "findpwd";
    }
    

	@RequestMapping("/tologin")
	public String toLogin() {
		return "login";
	}
	@RequestMapping("/login")
	public String toLogin2() {
		return "login";
	}
	@RequestMapping("/menu")
	public String toMenu() {
		return "menu";
	}
	@RequestMapping("/toregister")
	public String toRegister() {
		return "/register";
	}
	@RequestMapping("/register")
	public String toRegister2() {
		return "register";
	}
	@RequestMapping("/tofindpwd")
	public String tofindpwd() {
		return "findpwd";
	}
	@RequestMapping("/findpwd")
	public String tofindpwd2() {
		return "findpwd";
	}

}
