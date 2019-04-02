package com.bs.sxd.service;
import com.bs.common.utils.Page;
import com.bs.sxd.po.User;
/**
 * Service 接口
 * 
 * @author 孙雪冬
 *
 */
public interface UserService {
	public User findUser(String username, String password, Integer type);
	// 根据用户名查找（初始用于注册时）
	public User findByUserName(String username);
	// 增加用户
	public void addUser(User user);
	// 管理员模糊、条件、分页查询
	public Page<User> findUserList(Integer page, Integer rows_u, String username, String sex);
	// 根据用户ID查询用户信息
	public User findper(Integer id);
	// 修改用户个人信息
	public void updateUser(User user);
	// 修改用户为管理员
	public void updateUser_Admin(User user);
	// 修改管理员为用户
	void updateUser_User(User user);
	// 删除用户
	public void deleteuser(Integer id);
}
