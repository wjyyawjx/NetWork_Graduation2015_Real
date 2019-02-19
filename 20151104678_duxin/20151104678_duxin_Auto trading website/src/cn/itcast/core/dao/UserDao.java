package cn.itcast.core.dao;

import org.apache.ibatis.annotations.Param;

import cn.itcast.core.bean.User;

public interface UserDao {
	public User findUser(@Param("usercode") String usercode,@Param("password") String password);

}
