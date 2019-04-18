package com.yidu.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yidu.controller.vo.UserVo;
import com.yidu.dao.UserMapper;
import com.yidu.domain.User;
import com.yidu.service.UserService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class UserServiceImpl  implements UserService {
	@Resource
	UserMapper userDao;
	@Override
	public int register(User user) {
		String  uuid=UUID.randomUUID().toString().replaceAll("-", "");
		user.setUserId(uuid);
		return userDao.insertSelective(user);
		
	}
	@Override
	public User findByUser(User user) {
		
		return userDao.selectByUser(user);
	}
	@Override
	public User login(User user) {
		return userDao.selectUser(user);
	}
	@Override
	public List<User> findAll() {
		
		return userDao.findAll();
	}
	@Override
	public int queryRows(User user) {
		
		return userDao.selectRows(user);
	}
	@Override
	public int delete(String userId) {
		return userDao.deleteByPrimaryKey(userId);
	}
	@Override
	public int insertorUpdate(User user) {
		System.out.println("转过来的id:"+user.getUserId());
		//判断用户id是否为空
		if(user.getUserId()!=null && !"".equals(user.getUserId())) {
			System.out.println("进入修改的方法");
			return userDao.updateByPrimaryKeySelective(user);
		}else {
			String  uuid=UUID.randomUUID().toString().replaceAll("-", "");
			user.setUserId(uuid);
			System.out.println("进入增加的方法");
			return userDao.insertSelective(user);
		}
		
	}
	@Override
	public User selectId(String userId) {
		return userDao.selectByPrimaryKey(userId);
	}
	@Override
	public PageInfo<User> findAll(Integer page, Integer pageSize, User users) {
		//分页
		PageHelper.startPage(page,pageSize);
		//通过转过来的用户对象 查询出用户集合
		List<User> user = userDao.selectAll(users);
		//遍历用户对象
		for (User user2 : user) {
			//判断用户类型
			if(user2.getUserType()!=null) {
				if(user2.getUserType()==1) {
					user2.setUserTypeks("普通用户");
				}else if(user2.getUserType()==2) {
					user2.setUserTypeks("会员");
				}else if(user2.getUserType()==3){
					user2.setUserTypeks("管理员");
				}
			}
			
		}
		//用PageInfo 把查询出来的用户集合装起来
		PageInfo<User> userPageInfo = new PageInfo<>(user);
		return userPageInfo;
	}
	@Override
	public User backLogin(User user) {
		
		return userDao.backLogin(user);
	}
	
	
	@Override
	public List<UserVo> findByBill(String userName) {
		return userDao.findByBill(userName);
	}

}
