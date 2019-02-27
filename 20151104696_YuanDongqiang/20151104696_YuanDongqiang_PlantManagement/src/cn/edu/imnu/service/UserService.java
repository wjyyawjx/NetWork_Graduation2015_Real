package cn.edu.imnu.service;

import cn.edu.imnu.po.User;

public interface UserService {
	// 通过账号和密码查询用户
	public User findUser(String usercode, String password);

	// 注册
	public int addUser(User user);

	// 查询邮箱
	public User findUseremail(String u_email);

	// 更新登陆的ip
	public void SaveIp(User user);
}
