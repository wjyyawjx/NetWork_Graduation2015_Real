package com.lyh.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lyh.core.dao.UserDao;
import com.lyh.core.po.User;
import com.lyh.core.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	@Override
	public User login(String num, String pwd) {
		User user = this.userDao.login(num, pwd);
		return user;
	}
	
	@Override
	public void addUser(String username, String upwd, String usercode, Integer user_State) {
		
	}

	@Override
	public User findpwdUser(String username, String usercode){
		
	}

	@Override
	public void findpwd(String upwd, String usercode) {
		
	}
}
