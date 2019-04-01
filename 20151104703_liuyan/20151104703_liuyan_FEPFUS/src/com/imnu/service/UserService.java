package com.imnu.service;

import com.imnu.po.User;

public interface UserService {
	public User LoginUser(String u_user, String u_pwd);

	public void registerUser(String u_user, String u_pwd, String u_email,String u_phone, String u_type, String p_img, String p_dirpath,String u_message);
	
	public User findUser(String u_user);
	
	public User findEmail(String u_email);
	
}
