package com.locker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.locker.dao.RecordMapper;
import com.locker.dao.UserMapper;
import com.locker.domain.JsonMessage;
import com.locker.domain.Record;
import com.locker.domain.User;
import com.locker.service.RecordService;
import com.locker.service.UserService;

/**
 * 

 */
@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;
	
	@Resource 
	private RecordMapper record;
	
	@Override
	public List<User> findAll(){
		
		return userMapper.findAll();
	}
	
	@Override
	public int insert(User user){
		return userMapper.insert(user);
		
	}
	
	@Override
	public int delete(String uId){
		return userMapper.deleteByPrimaryKey(uId);
	}

	@Override
	public User selectShow(User user) {
		System.err.println(userMapper.selectFindShow(user));
		return userMapper.selectFindShow(user);
	}

	@Override
	public User selectName(String uZh) {
		
		return userMapper.findName(uZh);
	}

	@Override
	public User YongHuMing(String uZh) {
		return userMapper.YongHuMing(uZh);
	}

	/**
	 * 查询所有和模糊查询
	 */
	@Override
	public List<User> backFindAll(User user) {
		return userMapper.backFindAll(user);
	}
	
	/**
	 * 查询行数和模糊查询
	 */
	@Override
	public int backFindCount(String uZh) {
		return userMapper.backFindCount(uZh); 
	}

	/**
	 * 根据id删除
	 */
	@Override
	public int showDelete(String uId) {
		return userMapper.deleteByPrimaryKey(uId); 
	}

	/**
	 * 根据id查询
	 */
	@Override
	public User showUpdate(String uId) {
		return userMapper.selectByPrimaryKey(uId);
	}

	/**
	 * 增加和修改
	 */
	@Override
	public int addOrUpdate(User user) {
		if(user.getuId()!=null && !"".equals(user.getuId())) {
			return userMapper.updateByPrimaryKeySelective(user);
		}else {
			return userMapper.insertSelective(user);
		}
	}
	
	/**
	 * 如果付款>=100,普通用户升级为会员用户
	 */
	@Override
	public void commonAndMember(String getuId) {
		System.err.println("==id"+getuId);
		List<Record> list = record.findMoneyById(getuId);
		int total = 0;
		for(int i=0;i<list.size();i++) {
			total+=Integer.valueOf(list.get(i).getReMoney());
		}
		System.err.println("====一共支付钱==="+total);
		if(total>=100) {
			User user = new User();
			user.setuId(getuId);
			user.setuType("2");
			userMapper.updateByPrimaryKeySelective(user);
		}
	}
}
