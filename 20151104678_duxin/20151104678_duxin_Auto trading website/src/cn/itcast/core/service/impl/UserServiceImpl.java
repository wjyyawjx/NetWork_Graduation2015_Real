package cn.itcast.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.core.bean.User;
import cn.itcast.core.dao.UserDao;
import cn.itcast.core.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userdao;

	@Override
	public User findUser(String usercode, String password) {
		// TODO Auto-generated method stub
		User user = this.userdao.findUser(usercode, password);
		return user;
	}

}
