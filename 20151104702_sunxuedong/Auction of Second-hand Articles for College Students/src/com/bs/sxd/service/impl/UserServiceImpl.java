package com.bs.sxd.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bs.common.utils.Page;
import com.bs.sxd.dao.UserDao;
import com.bs.sxd.po.Goods;
import com.bs.sxd.po.User;
import com.bs.sxd.service.UserService;

/**
 * 用户Service接口实现类
 * 
 * @author 孙雪冬
 *
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;

	@Override
	public User findUser(String username, String password, Integer type) {
		// TODO Auto-generated method stub
		User user = this.userDao.findUser(username, password, type);
		return user;
	}

	// 根据用户名查询该用户是否存在用于登陆
	@Override
	public User findByUserName(String username) {
		User user = this.userDao.findByUserName(username);
		return user;
	}

	// 添加用户方法
	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}

	// 条件搜索查询并分页显示用户信息
	@Override
	public Page<User> findUserList(Integer page, Integer rows_u, String username, String sex) {
		User user = new User();
		// 当前页
		user.setStart((page - 1) * rows_u);
		// 每页数
		user.setRows(rows_u);
		// 存起来，不然xml文件取不到值
		user.setUsername(username);
		user.setSex(sex);
		List<User> user1 = userDao.findUserList(user);
		// 查询商品列表总记录数
		Integer count = userDao.selectuserListCount(user);
		// 创建Page返回对象
		Page<User> result = new Page<User>();
		result.setPage(page);
		result.setRows_u(user1);
		result.setSize(rows_u);
		result.setTotal(count);
		return result;
	}

	// 查询个人信息
	@Override
	public User findper(Integer id) {
		User user = this.userDao.findper(id);
		return user;
	}

	// 修改个人信息
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	// 修改用户为管理员
	@Override
	public void updateUser_Admin(User user) {
		userDao.updateUser_Admin(user);
	}

	// 修改管理员为用户
	@Override
	public void updateUser_User(User user) {
		userDao.updateUser_User(user);
	}

	// 删除用户
	@Override
	public void deleteuser(Integer id) {
		userDao.deleteuser(id);

	}

}
