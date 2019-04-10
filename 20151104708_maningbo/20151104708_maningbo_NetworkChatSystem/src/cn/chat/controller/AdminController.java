
package cn.chat.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.chat.dao.UserDao;
import cn.chat.pojo.UserBean;
import cn.chat.pojo.UserBeanVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserDao userDao;

	@RequestMapping("/adminUserList")
	public String adminUserList(Model model) {
		
		List<UserBean> allUser = userDao.findAllUser();
		allUser.forEach(user->{
			List<UserBeanVo> list = userDao.findAllUserByStatus(user.getId());
			if(list.size()<4) {
				list=buildList(list,user);
			}
			user.setListVo(list);
		});
		model.addAttribute("userList", allUser);
		model.addAttribute("color", Arrays.asList("btn-info","btn-success","btn-danger","btn-warning"));
		return "admiUsernpageList";
	}
	@RequestMapping("/updateUserflag/{flag}/{id}")
	public String adminUserList(@PathVariable("flag") int flag,@PathVariable("id") Integer id,Model model,HttpSession session) {
		UserBean userBean=new UserBean();
		userBean.setId(id);
		userBean.setFlag(flag);
		userDao.updateFlag(userBean);
		return adminUserList(model);
	}

	private List<UserBeanVo> buildList(List<UserBeanVo> list,UserBean user) {//0,1,2        1,2,3
		for(int i=0;i<list.size();i++) {
			String status="0"+i;
			if(!list.get(i).getStatus().equals(status)){
				UserBeanVo beanVo=new UserBeanVo();
				beanVo.setCount(0);
				beanVo.setStatus(status);
				beanVo.setUserid(user.getId());
				list.add(i, beanVo);
			}
			
		}
		for(int i=list.size();i<4;i++) {
			String status="0"+i;
			UserBeanVo beanVo=new UserBeanVo();
			beanVo.setCount(0);
			beanVo.setStatus(status);
			beanVo.setUserid(user.getId());
			list.add(beanVo);
		}
		return list;
	}
}
