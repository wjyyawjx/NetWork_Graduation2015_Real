package com.bs.sxd.service;

import com.bs.sxd.po.User;

/**
 * Service 接口
 * 
 * @author 孙雪冬
 *
 */
public interface UserService {
	public User findUser(String username,String password,Integer type);

	//根据用户名查找（初始用于注册时）
		public User findByUserName(String username);
	//增加用户
		public void addUser(User user);
		
    
	



	


    


   













	
}
