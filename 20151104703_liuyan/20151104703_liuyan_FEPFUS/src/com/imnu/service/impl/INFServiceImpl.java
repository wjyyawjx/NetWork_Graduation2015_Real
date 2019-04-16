package com.imnu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imnu.dao.INFDao;
import com.imnu.po.Infm;
import com.imnu.service.INFService;
@Service("infService")
@Transactional
public class INFServiceImpl implements INFService {
	@Autowired
	private INFDao infDao;
	@Override
	public List<Infm> selectjz() {
		// TODO Auto-generated method stub
		List<Infm> list = this.infDao.selectjz();
		return list;
	}
	@Override
	public void deletemy(int u_id) {
		// TODO Auto-generated method stub
		this.infDao.deletemy(u_id);
	}
	
		

}
