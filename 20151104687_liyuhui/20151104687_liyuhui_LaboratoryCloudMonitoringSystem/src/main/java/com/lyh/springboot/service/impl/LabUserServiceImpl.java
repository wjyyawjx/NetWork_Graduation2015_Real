package com.lyh.springboot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.LabUserMapper;
import com.lyh.springboot.pojo.LabUser;
import com.lyh.springboot.pojo.LabUserExample;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.User;
import com.lyh.springboot.service.LabUserService;


@Service
public class LabUserServiceImpl implements LabUserService {
	
	@Autowired 
	LabUserMapper labUserMapper;

	@Override
	public void deleteByUser(Integer lId) {
		// TODO Auto-generated method stub
		LabUserExample example = new LabUserExample();
		example.createCriteria().andLIdEqualTo(lId); 
		List<LabUser> lus = labUserMapper.selectByExample(example);
		for (LabUser labUser : lus) {
			labUserMapper.deleteByPrimaryKey(labUser.getId());
		}
	}

	@Override
	public void setUser(Laboratory lab, long[] userIds) {
		// TODO Auto-generated method stub
		LabUserExample example = new LabUserExample();
		example.createCriteria().andLIdEqualTo(lab.getlId());
		List<LabUser> lus = labUserMapper.selectByExample(example);
		for (LabUser labUser : lus) {
			labUserMapper.deleteByPrimaryKey(labUser.getId());
		}
		// 设置新的角色关系
		if (null != userIds) {
			for (Long uid : userIds) {
				LabUser labUser = new LabUser();
				labUser.setuId(uid);
				labUser.setlId(lab.getlId());
				labUserMapper.insert(labUser);
			}
		}
	}

	@Override
	public void setUser2(Laboratory lab, long[] userIds, List<User> users) {
		// TODO Auto-generated method stub
		LabUserExample example = new LabUserExample();
		example.createCriteria().andLIdEqualTo(lab.getlId());
		List<LabUser> lus = labUserMapper.selectByExample(example);
		for (LabUser labUser : lus) {
			labUserMapper.deleteByPrimaryKey(labUser.getId());
		}
		// 设置新的角色关系
		if (null != userIds) {
			for (Long uid : userIds) {
				LabUser labUser = new LabUser();
				labUser.setuId(uid);
				labUser.setlId(lab.getlId());
				labUserMapper.insert(labUser);
			}
		}
		if (null != users) {
			for (User uid : users) {
				LabUser labUser = new LabUser();
				labUser.setuId(uid.getId());
				labUser.setlId(lab.getlId());
				labUserMapper.insert(labUser);
			}
		}
	}


}
