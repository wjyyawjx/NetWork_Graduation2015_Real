package com.imnu.service;

import com.imnu.po.User;

public interface UserService {
	public User LoginUser(String u_name, String u_pwd);

	public void registerUser(String u_name, String u_pwd, String u_email,String u_phone, String u_type);
	
	public User findUser(String u_name);
	
	public User findEmail(String u_email);
	
}
