package com.lyh.core.dao;

import org.apache.ibatis.annotations.Param;

import com.lyh.core.po.User;

public interface UserDao {

	public User login(@Param("num") String num,@Param("pwd") String pwd);

}
