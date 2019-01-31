package com.imnu.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.imnu.dao.AuUserMapper;
import com.imnu.model.AuUser;
import com.imnu.service.AuUserService;


/**
 * 用户实现服务类
 */
@Service
public class AuUserServiceImpl implements AuUserService{
	
	@Resource
	private AuUserMapper userDao;
	
	@Override
	public int deleteByPrimaryKey(String userId) {
		return userDao.deleteByPrimaryKey(userId);
	}

	@Override
	public int insert(AuUser record) {
		return userDao.insert(record);
	}

	

	@Override
	public AuUser selectByPrimaryKey(String userId) {
		/*AuUser user = userDao.selectByPrimaryKey(userId);
		UserVo vo = new UserVo();
		BeanUtils.copyProperties(user, vo);
		vo.set*/
		return userDao.selectByPrimaryKey(userId);
	}
	/**
	 * 查询所有
	 */
	@Override
	public List<AuUser> queryAll() {
		return userDao.queryAll();
	}

	
	/**
	 * 增加或修改
	 */
	@Override
	public int addOrUpdate(AuUser user) {
		int rows = 0 ;
		if (user.getUserId()!=null && !"".equals(user.getUserId())) {
			rows = userDao.updateByPrimaryKeySelective(user);
		}else{
			rows = userDao.insertSelective(user);
		}
		return rows;
	}

	@Override
	public int updateByPrimaryKey(AuUser record) {
		return userDao.updateByPrimaryKey(record);
	}

	@Override
	public int insertSelective(AuUser record) {
		return userDao.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(AuUser record) {
		return userDao.updateByPrimaryKeySelective(record);
	}
	/**
	 * 登录
	 */
	@Override
	public AuUser login(AuUser user) {
		return userDao.login(user);
	}

	@Override
	public List<AuUser> findAlls() {
		return userDao.findAlls();
	}
	/**
	 * 后台登录注册
	 */
	@Override
	public AuUser htLogin(AuUser user) {
		user.setUserType("3");
		return userDao.htLogin(user);
	}
	/**
	 * 查询名字是否存在
	 */
	@Override
	public AuUser findUserName(String userName) {
		return userDao.findUserName(userName);
	}
	/**
	 * 根据名字查询
	 */
	@Override
	public List<AuUser> findByUser(String userName) {
		List<AuUser> list = userDao.findByUser(userName);
		return list;
	}
}
