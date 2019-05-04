package com.imnu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imnu.dao.INFDao;
import com.imnu.po.Infm;
import com.imnu.po.Pinglun;
import com.imnu.po.User;
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
	public void deletemy(String u_email) {
		// TODO Auto-generated method stub
		this.infDao.deletemy(u_email);
	}
	@Override
	public List<Infm> selecttc() {
		// TODO Auto-generated method stub
		List<Infm> list = this.infDao.selecttc();
		return list;
	}
	@Override
	public List<User> selectall() {
		// TODO Auto-generated method stub
		List<User> list = this.infDao.selectall();
		return list;
	}
	@Override
	public void deleteinf(String u_email) {
		// TODO Auto-generated method stub
		this.infDao.deleteinf(u_email);
	}
	@Override
	public void insertinf(String u_name, String u_phone, String u_email, String u_type, String p_img, String p_dirpath,
			String u_message) {
		// TODO Auto-generated method stub
		this.infDao.insertinf(u_name,u_phone,u_email,u_type,p_img,p_dirpath,u_message);
	}
	@Override
	public void insertpl(String name, String email, String phone, String message, String u_user) {
		// TODO Auto-generated method stub
		this.infDao.infsertpl(name,email,phone,message,u_user);
	}
	@Override
	public List<Pinglun> Selectpl() {
		// TODO Auto-generated method stub
		List<Pinglun> list = this.infDao.selectpl();
		return list;
	}
	
}
