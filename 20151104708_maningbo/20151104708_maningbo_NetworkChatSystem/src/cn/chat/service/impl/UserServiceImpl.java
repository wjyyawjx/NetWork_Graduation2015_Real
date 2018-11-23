package cn.chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.chat.dao.UserDao;
import cn.chat.pojo.UserBean;
import cn.chat.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	public UserBean findUserByEmail(String email,String userPass) {
		UserBean userBean = this.userDao.findUserByEmail(email,userPass);
		return userBean;
	}
	@Override
	public UserBean findUserById(int id) {
		UserBean userBean = this.userDao.findUserById(id);
		return userBean;
	}

	public void addUser(UserBean userBean) {
		this.userDao.addUser(userBean);
	}

	@Override
	public boolean update(String userName, String userPass, String phoneNumber, String email,Integer id) {
		// TODO Auto-generated method stub
		return userDao.update(userName, userPass, phoneNumber, email,id);
	}


	
}
