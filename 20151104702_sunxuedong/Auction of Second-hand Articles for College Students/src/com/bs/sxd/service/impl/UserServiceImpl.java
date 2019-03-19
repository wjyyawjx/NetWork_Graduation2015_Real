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

	@Override
	public User findByUserName(String username) {
		User user = this.userDao.findByUserName(username);
		return user;
		
	}

	@Override
	public void addUser(User user) {
		userDao.addUser(user);
		
	}

	@Override
	public Page<User> findUserList(Integer page, Integer rows_u, String username, String sex) {
		User user = new User();
		// 当前页
		user.setStart((page - 1) * rows_u);
		// 每页数
		user.setRows(rows_u);
		//存起来，不然xml文件取不到值
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

	
}
