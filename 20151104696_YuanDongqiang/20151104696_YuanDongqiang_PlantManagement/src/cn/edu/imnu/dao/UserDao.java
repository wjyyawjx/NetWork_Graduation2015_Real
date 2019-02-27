package cn.edu.imnu.dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.imnu.po.User;

public interface UserDao {
	/**
	 * 通过账号和密码查询用户 
	 * 查询账号和Email是否存在
	 */
	public User findUser(@Param("usercode") String usercode, 
						@Param("password") String password);

	/**
	 * 注册用户
	 */
	public int addUser(User user);
	/**
	 * 判断邮箱是否存在
	 */
	public User findUseremail(@Param("u_email") String u_email);
	/**
	 * 更新ip
	 */
	public void SaveIp(User user);

}
