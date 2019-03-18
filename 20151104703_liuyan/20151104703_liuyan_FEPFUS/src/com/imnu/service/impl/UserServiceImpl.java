package com.imnu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imnu.service.UserService;
import com.imnu.dao.UserDao;
import com.imnu.po.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Override
	public User LoginUser(String u_name, String u_pwd) {
		// TODO Auto-generated method stub
		User user = this.userDao.LoginUser(u_name, u_pwd);
		return user;
	}
	@Override
	public  void registerUser(String u_name, String u_pwd, String u_email,String u_phone,String u_type, String p_img, String p_dirpath) {
		// TODO Auto-generated method stub
		this.userDao.registerUser(u_name, u_pwd,u_email,u_phone,u_type,p_img,p_dirpath);
		
	}
	@Override
	public User findUser(String u_name) {
		// TODO Auto-generated method stub
		User user = this.userDao.findUser(u_name);
		return user;
	}
	@Override
	public User findEmail(String u_email) {
		// TODO Auto-generated method stub
		User user = this.userDao.findEmail(u_email);
		return user;
	}
	
}
