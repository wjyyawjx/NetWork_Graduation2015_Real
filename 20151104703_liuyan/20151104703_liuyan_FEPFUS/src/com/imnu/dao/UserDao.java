package com.imnu.dao;

import org.apache.ibatis.annotations.Param;

import com.imnu.po.User;

public interface UserDao {
    public User LoginUser(@Param("u_name") String u_name,@Param("u_pwd") String u_pwd);

	public void registerUser(@Param("u_name")String u_name,@Param("u_pwd") String u_pwd,@Param("u_email") String u_email,@Param("u_phone") String u_phone);
	
	public User  findUser(@Param("u_name")String u_name);

	public User  findEmail(@Param("u_email")String u_email);
	

}
