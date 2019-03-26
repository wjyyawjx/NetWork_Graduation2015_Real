package com.bs.sxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bs.sxd.po.User;
public interface UserDao {
   public User findUser(@Param("username") String username,
		                @Param("password") String password,
		                @Param("type") Integer type);

public User findByUserName(@Param("username") String username);

public void addUser(User user);
//模糊、条件、分页查询
public List<User> findUserList(User user);
//查询总用户数，为分页提供数据
public Integer selectuserListCount(User user);
//根据ID查询个人信息
public User findper(Integer id);
//修改个人信息
public void updateUser(User user);
//修改用户为管理员
public void updateUser_Admin(User user);
//修改管理员为用户
public void updateUser_User(User user);
public void deleteuser(Integer id);
}


