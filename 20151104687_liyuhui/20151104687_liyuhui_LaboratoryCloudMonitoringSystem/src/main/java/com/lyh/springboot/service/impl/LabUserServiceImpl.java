package com.lyh.springboot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.LabUserMapper;
import com.lyh.springboot.service.LabUserService;


@Service
public class LabUserServiceImpl implements LabUserService {
	
	@Autowired 
	LabUserMapper labUserMapper;


}
