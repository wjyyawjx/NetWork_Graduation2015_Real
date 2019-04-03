package com.lyh.springboot.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.LabUserMapper;
import com.lyh.springboot.mapper.LaboratoryMapper;
import com.lyh.springboot.mapper.UserMapper;
import com.lyh.springboot.pojo.LabUser;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.LaboratoryExample;
import com.lyh.springboot.pojo.User;
import com.lyh.springboot.service.LabUserService;
import com.lyh.springboot.service.LaboratoryService;

@Service
public class LaboratoryServiceImpl  implements LaboratoryService{

	@Autowired
	LaboratoryMapper laboratoryMapper;
	@Autowired
	LabUserService labUserService;
	@Autowired
	LabUserMapper labUserMapper;
	@Autowired
	UserMapper userMapper;

	
	@Override
	public List<Laboratory> findLab() {
		// TODO Auto-generated method stub
		System.out.println("lab");
		LaboratoryExample example = new LaboratoryExample();
		example.setOrderByClause("l_id desc");
		return laboratoryMapper.selectLab(example);
	}


	@Override
	public List<Laboratory> list() {
		// TODO Auto-generated method stub
		LaboratoryExample example = new LaboratoryExample();
		example.setOrderByClause("l_id desc");
		return laboratoryMapper.selectByExample(example);
	}


	@Override
	public Laboratory get(Integer lId) {
		// TODO Auto-generated method stub
		return laboratoryMapper.selectByPrimaryKey(lId);
	}


	@Override
	public void delete(Integer lId) {
		// TODO Auto-generated method stub
		System.out.println(lId+"  2");
		laboratoryMapper.deleteByPrimaryKey(lId);
		labUserService.deleteByUser(lId);
	}


	@Override
	public void update(Laboratory lab) {
		// TODO Auto-generated method stub
		laboratoryMapper.updateByPrimaryKeySelective(lab);
	}


	@Override
	public void add(Laboratory lab) {
		// TODO Auto-generated method stub
		laboratoryMapper.insert(lab);
	}


	@Override
	public List<Laboratory> listMineLab(Long id) {
		// TODO Auto-generated method stub
		List<Laboratory> laboratorys = new ArrayList<>();
		
		List<LabUser> labUsers = labUserMapper.selectMineByPrimaryKey(id);
		for (LabUser labUser : labUsers) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(labUser.getlId());
			laboratorys.add(laboratory);
		}
		return laboratorys;
	}


	@Override
	public List<Laboratory> listApplicationLab(Long id) {
		// TODO Auto-generated method stub
		List<Laboratory> laboratorys = new ArrayList<>();
		List<LabUser> labUsers = labUserMapper.selectApplicationByPrimaryKey(id);
		for (LabUser labUser : labUsers) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(labUser.getlId());
			laboratorys.add(laboratory);
		}
		return laboratorys;
	}


	@Override
	public List<Laboratory> listUnauthorizedLab(Long id) {
		// TODO Auto-generated method stub
		LaboratoryExample example = new LaboratoryExample();
		example.setOrderByClause("l_id desc");
		List<Laboratory> laboratorys = laboratoryMapper.selectByExample(example);
		List<LabUser> labUsers = labUserMapper.selectAllByPrimaryKey(id);
		for (LabUser labUser : labUsers) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(labUser.getlId());
			for(int i=0; i<laboratorys.size(); i++) {
				Laboratory s = laboratorys.get(i);
				if(laboratory.getlName().equals(s.getlName())) {
					laboratorys.remove(s);
				}
			}
		}
		return laboratorys;
	}


	@Override
	public List<Laboratory> listWaitLab(Long id) {
		// TODO Auto-generated method stub
		List<Laboratory> laboratorys = new ArrayList<>();
		List<LabUser> labUsers = labUserMapper.selectWaitByPrimaryKey(id);
		for (LabUser labUser : labUsers) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(labUser.getlId());
			laboratorys.add(laboratory);
		}
		return laboratorys;
	}


	@Override
	public Map<List<Laboratory>, List<User>> listAllWaitLab() {
		// TODO Auto-generated method stub
		Map<List<Laboratory>, List<User>> AllWaitLab = new HashMap<>();
		List<Laboratory> laboratorys = new ArrayList<>();
		List<User> users = new ArrayList<>();
		List<LabUser> labUsers = labUserMapper.selectAllWaitByPrimaryKey();
		for (LabUser labUser : labUsers) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(labUser.getlId());
			User user = userMapper.selectByPrimaryKey(labUser.getuId());
			laboratorys.add(laboratory);
			users.add(user);
		}
		AllWaitLab.put(laboratorys,users);
		return AllWaitLab;
	}

}
