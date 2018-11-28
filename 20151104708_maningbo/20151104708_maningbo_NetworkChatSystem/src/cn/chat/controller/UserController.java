
package cn.chat.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.chat.pojo.UserBean;
import cn.chat.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/index")
    public String toIndexPage(HttpServletRequest request) {
        return "index";
    }
	@RequestMapping(value="/login.action")
	public String findUserByUserName(String userName,String userPass,Model model,HttpSession session){
		UserBean userBean = userService.findUserByUserName(userName,userPass);
		if(userBean!=null){
			if(userName.equals(userBean.getUserName())&&userPass.equals(userBean.getUserPass())){
				session.setAttribute("userBean", userBean);
				return "index";
			}else{	
				model.addAttribute("msg", "用户名或密码错误！");
			return "login";
			}	
		}else{
			return "login";
			
		}
		
	}
	
	@RequestMapping(value="/index.action")
	public String goIndex(){
		return "index";
	}
	@RequestMapping(value="/update.action")
	public String t(){
		return "update";
	}
	@RequestMapping(value="/register.action")
	public String addUser(UserBean userBean, BindingResult result,Model model,HttpServletRequest request){	
		if(result.hasErrors()){
			model.addAttribute("defeat", "ע��ʧ�ܣ�");
			return "register";
		}else if(userBean.getUserName()==null){
			System.out.println(userBean);
			return "register";
		}else{
			userService.addUser(userBean);
			return "login";
		}
	}
	@RequestMapping(value="/updateinfo.action")
	public String update(String userName,String userPass,String phoneNumber,String email,Model model,HttpServletRequest request,HttpSession session){
		UserBean user = (UserBean) session.getAttribute("userBean");
		System.out.println(userName+userPass+phoneNumber+email+user.getId());
		boolean flag = userService.update(userName,userPass,phoneNumber,email,user.getId());
		if(flag==true){    
			UserBean user1 = userService.findUserById(user.getId()); 
            request.setAttribute("user", user1);  
            model.addAttribute("user", user1);  
            return "login";  
        }else{  
            return "index";  
        }  
	
		
	

}
}