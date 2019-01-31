package com.dao;

import java.util.List;

import com.entity.User;

public interface UserDao {
	
	public boolean login(String name,String pwd);//登录
	public boolean register(User user);//注册
	public List<User> getUserAll();//返回用户信息集合
	public boolean delete(int id) ;//根据id删除用户
	public boolean update(int id,String name, String worknumber,String sex, String home,String gangwei,String info) ;//更新用户信息
}
