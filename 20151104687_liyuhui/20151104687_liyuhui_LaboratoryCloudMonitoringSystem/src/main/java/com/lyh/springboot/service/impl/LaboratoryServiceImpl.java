package com.lyh.springboot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.LaboratoryMapper;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.LaboratoryExample;
import com.lyh.springboot.service.LabUserService;
import com.lyh.springboot.service.LaboratoryService;

@Service
public class LaboratoryServiceImpl  implements LaboratoryService{

	@Autowired
	LaboratoryMapper laboratoryMapper;
	@Autowired
	LabUserService labUserService;

	
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
	public Laboratory get(long id) {
		// TODO Auto-generated method stub
		return laboratoryMapper.selectByPrimaryKey(id);
	}


	@Override
	public void delete(long uid) {
		// TODO Auto-generated method stub
		laboratoryMapper.deleteByPrimaryKey(uid);
		labUserService.deleteByUser(uid);
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

}
