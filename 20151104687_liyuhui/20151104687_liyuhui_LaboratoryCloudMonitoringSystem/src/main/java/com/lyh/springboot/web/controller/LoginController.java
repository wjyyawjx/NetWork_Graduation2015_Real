package com.lyh.springboot.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;

import com.lyh.springboot.common.utils.RandomValidateCode;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.Role;
import com.lyh.springboot.pojo.User;
import com.lyh.springboot.service.LabUserService;
import com.lyh.springboot.service.LaboratoryService;
import com.lyh.springboot.service.RoleService;
import com.lyh.springboot.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private LaboratoryService laboratoryService;
	@Autowired
	private LabUserService labUserService;
	@Autowired
	private RoleService roleService;
    
    @RequestMapping(value="/login",method= RequestMethod.POST)
    public String login(String num,String pwd, Model model, HttpSession httpSession){
    	System.out.println("login:"+num+","+pwd);
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(num, pwd);
		System.out.println(token);
		try {
			subject.login(token);
			Session session = subject.getSession();
			session.setAttribute("subject", subject);
			User user = userService.findUserName(num);
			httpSession.setAttribute("User", user);
			
			List<Laboratory> labs = laboratoryService.findLab();
			httpSession.setAttribute("Lab", labs);
			
			List<Laboratory> mineLab = laboratoryService.listMineLab(user.getId());
			List<Laboratory> applicationLab = laboratoryService.listApplicationLab(user.getId());
			List<Laboratory> WaitLab = laboratoryService.listWaitLab(user.getId());
			List<Laboratory> WaitLab2 = laboratoryService.listWaitLab2(user.getId());
			List<Laboratory> unauthorizedLab = laboratoryService.listUnauthorizedLab(user.getId());
			session.setAttribute("mineLab", mineLab);
			session.setAttribute("applicationLab", applicationLab);
			session.setAttribute("unauthorizedLab", unauthorizedLab);
			session.setAttribute("WaitLab", WaitLab);
			session.setAttribute("WaitLab2", WaitLab2);
			Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
			AllWaitLab = laboratoryService.listAllWaitLab();
			session.setAttribute("AllWaitLab", AllWaitLab);
			
			List<Role> mineRole = roleService.listMineRole(user.getId());
			httpSession.setAttribute("mineRole", mineRole);
			
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
  
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(MultipartFile image, Model model, String num, String pwd, String randomjsp, String type, String name, String tel, String sex, String email, Integer age, HttpSession session, HttpServletRequest req) throws IllegalStateException, IOException {
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
                String fileName = image.getOriginalFilename();
                String destFileName="C:/Users/li/Downloads/upload/"+name+fileName;
                String destsql = name+fileName;
                File destFile = new File(destFileName);
                destFile.getParentFile().mkdirs();
                image.transferTo(destFile);
        		User u = new User();
        		u.setNum(num);
        		u.setName(name);
        		u.setPassword(encodedPassword);
        		u.setSalt(salt);
        		u.setAge(age);
        		u.setEmail(email);
        		u.setSex(sex);
        		u.setTel(tel);
        		u.setType(type);
        		u.setColor("skin-cloth");
        		u.setImage(destsql);
        		userService.add(u);
        		model.addAttribute("msg","用户注册成功，请登录！");
        		return "redirect:tologin";
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
	@RequestMapping("/menu")
	public String toMenu(HttpSession session) {
		User user = (User) session.getAttribute("User");
		List<Laboratory> mineLab = laboratoryService.listMineLab(user.getId());
		List<Laboratory> applicationLab = laboratoryService.listApplicationLab(user.getId());
		List<Laboratory> WaitLab = laboratoryService.listWaitLab(user.getId());
		List<Laboratory> WaitLab2 = laboratoryService.listWaitLab2(user.getId());
		List<Laboratory> unauthorizedLab = laboratoryService.listUnauthorizedLab(user.getId());
		session.setAttribute("mineLab", mineLab);
		session.setAttribute("applicationLab", applicationLab);
		session.setAttribute("unauthorizedLab", unauthorizedLab);
		session.setAttribute("WaitLab", WaitLab);
		session.setAttribute("WaitLab2", WaitLab2);
		Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
		AllWaitLab = laboratoryService.listAllWaitLab();
		session.setAttribute("AllWaitLab", AllWaitLab);
		return "menu";
	}
	@RequestMapping("/mine")
	public String toMine(HttpSession session) {
		User user = (User) session.getAttribute("User");
		List<Laboratory> mineLab = laboratoryService.listMineLab(user.getId());
		List<Laboratory> applicationLab = laboratoryService.listApplicationLab(user.getId());
		List<Laboratory> WaitLab = laboratoryService.listWaitLab(user.getId());
		List<Laboratory> WaitLab2 = laboratoryService.listWaitLab2(user.getId());
		List<Laboratory> unauthorizedLab = laboratoryService.listUnauthorizedLab(user.getId());
		session.setAttribute("mineLab", mineLab);
		session.setAttribute("applicationLab", applicationLab);
		session.setAttribute("unauthorizedLab", unauthorizedLab);
		session.setAttribute("WaitLab", WaitLab);
		session.setAttribute("WaitLab2", WaitLab2);
		Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
		AllWaitLab = laboratoryService.listAllWaitLab();
		session.setAttribute("AllWaitLab", AllWaitLab);
		return "mine";
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
	
	@RequestMapping("/skinChange")
	public String skinChange(String color, HttpSession session){
		User user = (User) session.getAttribute("User");
		user.setColor(color);
		System.out.println(user.getId());
		System.out.println(user.getColor());
		userService.skinChange(user);
		User u = userService.findUserName(user.getNum());
		session.setAttribute("User", u);
		return "menu";
	}
	
	@RequestMapping(value = "/editMine", method = RequestMethod.POST)
    public String editMine(MultipartFile image, Model model, String name, String tel, String email, Integer age, HttpSession session, HttpServletRequest req) throws IllegalStateException, IOException {
        //从session中获取随机数
		User u = (User) session.getAttribute("User");
        if(!name.equals("")) {
        	u.setName(name);
        }else {
        	name=u.getName();
        }
        if(age!=null) {
        	u.setAge(age);
        }
        if(!email.equals("")) {
        	u.setEmail(email);
        }
        if(!tel.equals("")) {
        	u.setTel(tel);
        }
        String fileName = image.getOriginalFilename();
        if(!fileName.equals("")) {
            String destFileName="C:/Users/li/Downloads/upload/"+name+fileName;
            String destsql = name+fileName;
            File destFile = new File(destFileName);
            destFile.getParentFile().mkdirs();
            image.transferTo(destFile);
            u.setImage(destsql);
		}  		
        userService.update(u);
        return "redirect:mine";
    		
    }
	@RequestMapping(value = "/editPwd", method = RequestMethod.POST)
    public String editPwd(Model model,String pwd, String randomjsp, HttpSession session) {
        //从session中获取随机数
		User u = (User) session.getAttribute("User");
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	if (pwd.length() != 0) {
        		String salt = new SecureRandomNumberGenerator().nextBytes().toString();
    			int times = 2;
    			String algorithmName = "md5";
    			String encodedPassword = new SimpleHash(algorithmName, pwd, salt, times).toString();
   				u.setSalt(salt);
   				u.setPassword(encodedPassword);
   				userService.update(u);
   				model.addAttribute("msg","密码重置成功，请重新登录！");
       			return "login";
        	}
    	}
		return "mine";
    }
	
	@RequestMapping("/applicationLab")
	public String applicationLab(Integer lId, HttpSession session){
		User user = (User) session.getAttribute("User");
		labUserService.addApplication(user.getId(),lId);
		List<Laboratory> mineLab = laboratoryService.listMineLab(user.getId());
		List<Laboratory> applicationLab = laboratoryService.listApplicationLab(user.getId());
		List<Laboratory> WaitLab = laboratoryService.listWaitLab(user.getId());
		List<Laboratory> WaitLab2 = laboratoryService.listWaitLab2(user.getId());
		List<Laboratory> unauthorizedLab = laboratoryService.listUnauthorizedLab(user.getId());
		session.setAttribute("mineLab", mineLab);
		session.setAttribute("applicationLab", applicationLab);
		session.setAttribute("unauthorizedLab", unauthorizedLab);
		session.setAttribute("WaitLab", WaitLab);
		session.setAttribute("WaitLab2", WaitLab2);
		Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
		AllWaitLab = laboratoryService.listAllWaitLab();
		session.setAttribute("AllWaitLab", AllWaitLab);
		return "redirect:/mine";
	}
	
	@RequestMapping("/userEnter")
	public String userEnter(Integer lId, HttpSession session){
		User user = (User) session.getAttribute("User");
		labUserService.updateEnter(user.getId(),lId);
		List<Laboratory> mineLab = laboratoryService.listMineLab(user.getId());
		List<Laboratory> applicationLab = laboratoryService.listApplicationLab(user.getId());
		List<Laboratory> WaitLab = laboratoryService.listWaitLab(user.getId());
		List<Laboratory> WaitLab2 = laboratoryService.listWaitLab2(user.getId());
		List<Laboratory> unauthorizedLab = laboratoryService.listUnauthorizedLab(user.getId());
		session.setAttribute("mineLab", mineLab);
		session.setAttribute("applicationLab", applicationLab);
		session.setAttribute("unauthorizedLab", unauthorizedLab);
		session.setAttribute("WaitLab", WaitLab);
		session.setAttribute("WaitLab2", WaitLab2);
		Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
		AllWaitLab = laboratoryService.listAllWaitLab();
		session.setAttribute("AllWaitLab", AllWaitLab);
		return "redirect:/mine";
	}
	
	@RequestMapping("/userEnterNo")
	public String userEnterNo(Integer lId, HttpSession session){
		User user = (User) session.getAttribute("User");
		labUserService.deleteEnter(user.getId(),lId);
		List<Laboratory> mineLab = laboratoryService.listMineLab(user.getId());
		List<Laboratory> applicationLab = laboratoryService.listApplicationLab(user.getId());
		List<Laboratory> WaitLab = laboratoryService.listWaitLab(user.getId());
		List<Laboratory> WaitLab2 = laboratoryService.listWaitLab2(user.getId());
		List<Laboratory> unauthorizedLab = laboratoryService.listUnauthorizedLab(user.getId());
		session.setAttribute("mineLab", mineLab);
		session.setAttribute("applicationLab", applicationLab);
		session.setAttribute("unauthorizedLab", unauthorizedLab);
		session.setAttribute("WaitLab", WaitLab);
		session.setAttribute("WaitLab2", WaitLab2);
		Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
		AllWaitLab = laboratoryService.listAllWaitLab();
		session.setAttribute("AllWaitLab", AllWaitLab);
		return "redirect:/mine";
	}
	
	@RequestMapping("/AdminEnter")
	public String AdminEnter(Integer lId, Long id, HttpSession session){
		User user = (User) session.getAttribute("User");
		labUserService.updateAdminEnter(id,lId);
		List<Laboratory> mineLab = laboratoryService.listMineLab(user.getId());
		List<Laboratory> applicationLab = laboratoryService.listApplicationLab(user.getId());
		List<Laboratory> WaitLab = laboratoryService.listWaitLab(user.getId());
		List<Laboratory> WaitLab2 = laboratoryService.listWaitLab2(user.getId());
		List<Laboratory> unauthorizedLab = laboratoryService.listUnauthorizedLab(user.getId());
		session.setAttribute("mineLab", mineLab);
		session.setAttribute("applicationLab", applicationLab);
		session.setAttribute("unauthorizedLab", unauthorizedLab);
		session.setAttribute("WaitLab", WaitLab);
		session.setAttribute("WaitLab2", WaitLab2);
		Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
		AllWaitLab = laboratoryService.listAllWaitLab();
		session.setAttribute("AllWaitLab", AllWaitLab);
		return "redirect:/menu";
	}
	
	@RequestMapping("/AdminNoEnter")
	public String AdminNoEnter(Integer lId, Long id, HttpSession session){
		User user = (User) session.getAttribute("User");
		labUserService.updateAdminNoEnter(id,lId);
		List<Laboratory> mineLab = laboratoryService.listMineLab(user.getId());
		List<Laboratory> applicationLab = laboratoryService.listApplicationLab(user.getId());
		List<Laboratory> WaitLab = laboratoryService.listWaitLab(user.getId());
		List<Laboratory> WaitLab2 = laboratoryService.listWaitLab2(user.getId());
		List<Laboratory> unauthorizedLab = laboratoryService.listUnauthorizedLab(user.getId());
		session.setAttribute("mineLab", mineLab);
		session.setAttribute("applicationLab", applicationLab);
		session.setAttribute("unauthorizedLab", unauthorizedLab);
		session.setAttribute("WaitLab", WaitLab);
		session.setAttribute("WaitLab2", WaitLab2);
		Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
		AllWaitLab = laboratoryService.listAllWaitLab();
		session.setAttribute("AllWaitLab", AllWaitLab);
		return "redirect:/menu";
	}

}
