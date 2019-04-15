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
	public User LoginUser(String u_user, String u_pwd) {
		// TODO Auto-generated method stub
		User user = this.userDao.LoginUser(u_user, u_pwd);
		return user;
	}
	@Override
	public  void registerUser(String u_user, String u_pwd,String u_name,String u_email,String u_phone,String u_type, String p_img, String p_dirpath,String u_message) {
		// TODO Auto-generated method stub
		this.userDao.registerUser(u_user, u_pwd,u_name,u_email,u_phone,u_type,p_img,p_dirpath,u_message);
		
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
	@Override
	public void updatemy(String u_user, String u_name, String u_phone, String u_email, String u_message) {
		// TODO Auto-generated method stub
		this.userDao.updatemy(u_user,u_name,u_phone,u_email,u_message);
	}
	
}
