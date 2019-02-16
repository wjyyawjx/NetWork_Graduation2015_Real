package com.yidu.service;

import java.util.List;

import com.yidu.domain.JsonMessage;
import com.yidu.domain.User;

/**
 * 
 * @author wuqi
 * @date 2018年10月23日
 * @version 1.0
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
