package com.lyh.core.service;

import com.lyh.core.po.User;

public interface UserService {

	public User login(String num, String pwd);

	public void addUser(String num, String pwd, String username, String usertype);

	public User findpwdUser(String num, String pwd);

	public void findpwd(String pwd, String num);

}
