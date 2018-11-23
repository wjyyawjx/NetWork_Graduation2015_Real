package cn.chat.service;

import java.util.List;

import cn.chat.pojo.UserBean;

public interface UserService {
	
	public UserBean findUserByEmail(String email,String userPass);
	public void addUser(UserBean userBean);
	public boolean update(String userName,String userPass,String phoneNumber,String email,Integer id);
	public UserBean findUserById(int id);


}
