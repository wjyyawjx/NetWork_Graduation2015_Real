package com.lyh.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lyh.core.service.UserService;
import com.lyh.core.dao.UserDao;
import com.lyh.core.po.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	@Override
	public User login(String uname, String upwd) {
		User user = this.userDao.login(uname, upwd);
		return user;
	}
}
