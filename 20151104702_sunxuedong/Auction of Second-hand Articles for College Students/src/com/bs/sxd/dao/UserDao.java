package com.bs.sxd.dao;

import org.apache.ibatis.annotations.Param;

import com.bs.sxd.po.User;
public interface UserDao {
   public User findUser(@Param("username") String username,
		                @Param("password") String password);
}
