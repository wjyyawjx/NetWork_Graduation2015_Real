package cn.edu.imnu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.imnu.dao.UserDao;
import cn.edu.imnu.po.User;
import cn.edu.imnu.service.UserService;

/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiecImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;

	// 通过账号和密码查询用户
	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}

	// 注册
	@Override
	public int addUser(User user) {
		return userDao.addUser(user);
	}
}
