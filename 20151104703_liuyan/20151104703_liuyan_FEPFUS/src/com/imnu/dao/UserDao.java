package com.imnu.dao;

import org.apache.ibatis.annotations.Param;

import com.imnu.po.User;

public interface UserDao {
    public User LoginUser(@Param("u_user") String u_user,@Param("u_pwd") String u_pwd);

	public void registerUser(@Param("u_user")String u_user,@Param("u_pwd") String u_pwd,@Param("u_name")String u_name,@Param("u_email") String u_email,@Param("u_phone") String u_phone,@Param("u_type") String u_type, @Param("p_img")String p_img, @Param("p_dirpath")String p_dirpath,@Param("u_message")String u_message);
	
	public User  findUser(@Param("u_user")String u_user);

	public User  findEmail(@Param("u_email")String u_email);

	public void updatemy(@Param("u_user")String u_user, @Param("u_name")String u_name, @Param("u_phone")String u_phone, @Param("u_email")String u_email, @Param("u_message")String u_message);

	public void updateno(@Param("u_email")String u_email);

	public void updateyes(@Param("u_email")String u_email);


}
