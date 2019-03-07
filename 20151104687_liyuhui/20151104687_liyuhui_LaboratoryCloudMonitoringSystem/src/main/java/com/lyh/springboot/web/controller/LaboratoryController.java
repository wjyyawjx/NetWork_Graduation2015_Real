package com.lyh.springboot.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.User;
import com.lyh.springboot.service.LaboratoryService;
import com.lyh.springboot.service.LabUserService;
import com.lyh.springboot.service.UserService;

@Controller
@RequestMapping("config")
public class LaboratoryController {
	@Autowired
	UserService userService;
	@Autowired
	LabUserService LabUserService;
	@Autowired
	LaboratoryService laboratoryService;
	
	@RequestMapping("listLab")     //查询
	public String listLab(Model model) {
		List<Laboratory> lab = laboratoryService.list();
		model.addAttribute("lab", lab);
		Map<Laboratory, List<User>> lab_user = new HashMap<>();
		for (Laboratory laboratory : lab) {
			List<User> user = userService.listUser(laboratory);
			lab_user.put(laboratory, user);
		}
		model.addAttribute("lab_user", lab_user);

		return "labDetails";
	}
	
	@RequestMapping("listStu")     //查询
	public String listStu(Model model) {
		List<Laboratory> lab = laboratoryService.list();
		model.addAttribute("lab", lab);
		Map<Laboratory, List<User>> lab_user = new HashMap<>();
		for (Laboratory laboratory : lab) {
			List<User> user = userService.listStu(laboratory);
			lab_user.put(laboratory, user);
		}
		model.addAttribute("lab_user", lab_user);

		return "labDetails";
	}
	
	@RequestMapping("listTeach")     //查询
	public String listTeach(Model model) {
		List<Laboratory> lab = laboratoryService.list();
		model.addAttribute("lab", lab);
		Map<Laboratory, List<User>> lab_user = new HashMap<>();
		for (Laboratory laboratory : lab) {
			List<User> user = userService.listTeacher(laboratory);
			lab_user.put(laboratory, user);
		}
		model.addAttribute("lab_user", lab_user);

		return "labDetails";
	}

//	@RequestMapping("editUser")    //修改
//	public String edit(Model model, long id) {
//		List<Role> rs = roleService.list();
//		model.addAttribute("rs", rs);
//		User user = userService.get(id);
//		model.addAttribute("user", user);
//
//		List<Role> roles = roleService.listRoles(user);
//		model.addAttribute("currentRoles", roles);
//
//		return "editUser";
//	}
//
//	@RequestMapping("deleteUser")   //删除
//	public String delete(Model model, long uid) {
//		userService.delete(uid);
//		return "redirect:listUser";
//	}
//
//	@RequestMapping("updateUser")   //改密码
//	public String update(User user, long[] roleIds) {
//		userRoleService.setRoles(user, roleIds);
//
//		String password = user.getPassword();
//		// 如果在修改的时候没有设置密码，就表示不改动密码
//		if (user.getPassword().length() != 0) {
//			String salt = new SecureRandomNumberGenerator().nextBytes().toString();
//			int times = 2;
//			String algorithmName = "md5";
//			String encodedPassword = new SimpleHash(algorithmName, password, salt, times).toString();
//			user.setSalt(salt);
//			user.setPassword(encodedPassword);
//		} else
//			user.setPassword(null);
//
//		userService.update(user);
//
//		return "redirect:listUser";
//
//	}
//
//	@RequestMapping("addUser")  //添加用户
//	public String add(Model model, String name, String password) {
//
//		String salt = new SecureRandomNumberGenerator().nextBytes().toString();
//		int times = 2;
//		String algorithmName = "md5";
//
//		String encodedPassword = new SimpleHash(algorithmName, password, salt, times).toString();
//
//		User u = new User();
//		u.setNum(name);
//		u.setPassword(encodedPassword);
//		u.setSalt(salt);
//		userService.add(u);
//
//		return "redirect:listUser";
//	}
}
