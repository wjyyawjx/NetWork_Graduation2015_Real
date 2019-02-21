package com.lyh.springboot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.LaboratoryMapper;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.LaboratoryExample;
import com.lyh.springboot.service.LaboratoryService;

@Service
public class LaboratoryServiceImpl  implements LaboratoryService{

	@Autowired
	LaboratoryMapper laboratoryMapper;

	
	@Override
	public List<Laboratory> findLab() {
		// TODO Auto-generated method stub
		System.out.println("lab");
		LaboratoryExample example = new LaboratoryExample();
		example.setOrderByClause("l_id desc");
		return laboratoryMapper.selectLab(example);
	}

}
