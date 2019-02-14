package cn.edu.imnu.service;

import cn.edu.imnu.po.User;

public interface UserService {
	//通过账号和密码查询用户
	public User findUser(String usercode,String password);

	//注册
	public int addUser(User user);
}
