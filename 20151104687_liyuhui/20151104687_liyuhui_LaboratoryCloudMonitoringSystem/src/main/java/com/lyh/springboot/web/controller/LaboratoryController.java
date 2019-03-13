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
import com.lyh.springboot.pojo.Permission;
import com.lyh.springboot.pojo.Role;
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
	LabUserService labUserService;
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
	
	@RequestMapping("listAll")     //查询
	public String listAll(Model model) {
		List<Laboratory> lab = laboratoryService.list();
		model.addAttribute("lab", lab);
		Map<Laboratory, List<User>> lab_user = new HashMap<>();
		for (Laboratory laboratory : lab) {
			List<User> user = userService.listUser(laboratory);
			lab_user.put(laboratory, user);
		}
		model.addAttribute("lab_user", lab_user);

		return "listLab";
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

		return "listLab";
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

		return "listLab";
	}

	@RequestMapping("editLab")    //修改
	public String edit(Model model, Integer lId) {
		Laboratory lab = laboratoryService.get(lId);
		model.addAttribute("lab", lab);
		
		List<User> us = userService.list();
		model.addAttribute("us", us);

		List<User> users = userService.listUser(lab);
		model.addAttribute("currentusers", users);

		return "editLab";
	}

	@RequestMapping("deleteLab")   //删除
	public String delete(Model model, Integer lId) {
		laboratoryService.delete(lId);
		return "redirect:listLab";
	}

	@RequestMapping("updateLab") 
	public String update(Laboratory lab, long[] userIds) {	
		System.out.println(lab.getlName());
		labUserService.setUser(lab, userIds);
		laboratoryService.update(lab);
		return "redirect:listLab";
	}


	@RequestMapping("addLab")  //添加用户
	public String add(Model model, Laboratory lab) {
		laboratoryService.add(lab);
		return "redirect:listLab";
	}
}
