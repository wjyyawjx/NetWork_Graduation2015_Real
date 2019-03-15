package com.locker.service;

import java.util.List;

import com.locker.domain.JsonMessage;
import com.locker.domain.User;

/**
 * 
 
 */
public interface UserService {

	public List<User> findAll();

	int insert(User user);

	int delete(String uId);

	
	public User selectShow(User users);
	
	//查询注册名是否存在
	public User selectName(String uZh);

	public User YongHuMing(String uZh);

	public List<User> backFindAll(User user);

	public int backFindCount(String uZh);

	public int showDelete(String uId);

	public User showUpdate(String uId);

	public int addOrUpdate(User user);

	public void commonAndMember(String getuId);
	

}
