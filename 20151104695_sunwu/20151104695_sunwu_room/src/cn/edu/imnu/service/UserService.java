package cn.edu.imnu.service;

import cn.edu.imnu.bean.UserBean;
import cn.edu.imnu.dao.UserDao;

public class UserService {

	public UserBean LoginValidate(String username, String password, String type) {
		UserBean userbean = new UserBean();
		userbean.setUsername(username);
		userbean.setPassword(password);
		userbean.setType(type);
		UserDao sd = new UserDao();
		UserBean rs = sd.login(userbean);
		return rs;
	}

}
