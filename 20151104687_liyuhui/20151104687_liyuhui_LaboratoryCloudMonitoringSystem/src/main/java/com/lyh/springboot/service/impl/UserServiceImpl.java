package com.lyh.springboot.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.LabUserMapper;
import com.lyh.springboot.mapper.UserMapper;
import com.lyh.springboot.pojo.LabUser;
import com.lyh.springboot.pojo.LabUserExample;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.User;
import com.lyh.springboot.pojo.UserExample;
import com.lyh.springboot.service.UserRoleService;
import com.lyh.springboot.service.UserService;



@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	@Autowired
	UserRoleService userRoleService;
	@Autowired
	LabUserMapper labUserMapper;
	

	@Override
	public String getPassword(String name) {
		User user = getByName(name);
		if (null == user)
			return null;
		return user.getPassword();
	}

	@Override
	public User getByName(String name) {
		UserExample example = new UserExample();
		example.createCriteria().andNumEqualTo(name);
		List<User> users = userMapper.selectByExample(example);
		if (users.isEmpty())
			return null;
		return users.get(0);
	}

	@Override
	public void add(User u) {
		userMapper.insert(u);
	}

	@Override
	public void delete(Long id) {
		userMapper.deleteByPrimaryKey(id);
		userRoleService.deleteByUser(id);
	}

	@Override
	public void update(User u) {
		userMapper.updateByPrimaryKeySelective(u);
	}

	@Override
	public User get(Long id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<User> list() {
		UserExample example = new UserExample();
		example.setOrderByClause("id desc");
		return userMapper.selectByExample(example);
	}
	
	@Override
	public List<User> listStu() {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		example.setOrderByClause("id desc");
		return userMapper.selectStuByExample(example);
	}

	@Override
	public List<User> listTeach() {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		example.setOrderByClause("id desc");
		return userMapper.selectTeachByExample(example);
	}

	@Override
	public User findUserName(String num) {
		// TODO Auto-generated method stub
		return userMapper.selectByName(num);
	}

	@Override
	public List<User> listUser(Laboratory laboratory) {
		// TODO Auto-generated method stub
		List<User> users = new ArrayList<>();

		LabUserExample example = new LabUserExample();

		example.createCriteria().andLIdEqualTo(laboratory.getlId());
		List<LabUser> labUsers = labUserMapper.selectByExample(example);

		for (LabUser labUser : labUsers) {
			User user = userMapper.selectByPrimaryKey(labUser.getuId());
			users.add(user);
		}
		return users;
	}

	@Override
	public List<User> listStu(Laboratory laboratory) {
		// TODO Auto-generated method stub
		List<User> users = new ArrayList<>();

		LabUserExample example = new LabUserExample();

		example.createCriteria().andLIdEqualTo(laboratory.getlId());
		List<LabUser> labUsers = labUserMapper.selectByExample(example);

		for (LabUser labUser : labUsers) {
			User user = userMapper.selectStuByPrimaryKey(labUser.getuId());
			users.add(user);
		}
		return users;
	}

	@Override
	public List<User> listTeacher(Laboratory laboratory) {
		// TODO Auto-generated method stub
		List<User> users = new ArrayList<>();

		LabUserExample example = new LabUserExample();

		example.createCriteria().andLIdEqualTo(laboratory.getlId());
		List<LabUser> labUsers = labUserMapper.selectByExample(example);

		for (LabUser labUser : labUsers) {
			User user = userMapper.selectTeachByPrimaryKey(labUser.getuId());
			users.add(user);
		}
		return users;
	}
	
	@Override
	public List<User> listStu2(Laboratory laboratory) {
		// TODO Auto-generated method stub
		List<User> users = new ArrayList<>();

		LabUserExample example = new LabUserExample();
		example.createCriteria().andLIdEqualTo(laboratory.getlId());
		List<LabUser> labUsers = labUserMapper.selectByExample(example);

		for (LabUser labUser : labUsers) {
			User user = userMapper.selectStuByPrimaryKey(labUser.getuId());
			if(user!=null) {
				users.add(user);
			}
		}
		return users;
	}
	
	@Override
	public List<User> listTeacher2(Laboratory laboratory) {
		// TODO Auto-generated method stub
		List<User> users = new ArrayList<>();

		LabUserExample example = new LabUserExample();

		example.createCriteria().andLIdEqualTo(laboratory.getlId());
		List<LabUser> labUsers = labUserMapper.selectByExample(example);

		for (LabUser labUser : labUsers) {
			User user = userMapper.selectTeachByPrimaryKey(labUser.getuId());
			if(user!=null) {
				users.add(user);
			}
		}
		return users;
	}

	@Override
	public void skinChange(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	

}