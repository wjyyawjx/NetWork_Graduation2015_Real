package cn.itcast.core.service;

import cn.itcast.core.bean.User;

public interface UserService {
	public User findUser(String usercode,String password);

}
