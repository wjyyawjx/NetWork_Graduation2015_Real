package com.lyh.springboot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.LoginMapper;
import com.lyh.springboot.pojo.Login;
import com.lyh.springboot.pojo.Student;
import com.lyh.springboot.pojo.Teacher;
import com.lyh.springboot.service.LoginService;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public Login login(String num, String pwd) {
		// TODO Auto-generated method stub
		Login login = loginMapper.login(num, pwd);
		return login;
	}

	@Override
	public void addUser(String num, String pwd, int type) {
		// TODO Auto-generated method stub
		loginMapper.addUser(num, pwd, type);
	}

	@Override
	public void perfectInformation_s(String name, String tel, String sex, String email, String age, String num) {
		// TODO Auto-generated method stub
		loginMapper.perfectInformation_s(name, tel, sex, email, age, num);
	}

	@Override
	public void perfectInformation_t(String name, String tel, String email, String num) {
		// TODO Auto-generated method stub
		loginMapper.perfectInformation_t(name, tel, email, num);
	}

	@Override
	public Login findpwdUser(String num) {
		// TODO Auto-generated method stub
		Login login_fU = loginMapper.findpwdUser(num);
		return login_fU;
	}

	@Override
	public void findpwd(String pwd, String num) {
		// TODO Auto-generated method stub
		loginMapper.findpwd(pwd, num);
	}

	@Override
	public Student findStudent(String num) {
		// TODO Auto-generated method stub
		Student student = loginMapper.findStudent(num);
		return student;
	}

	@Override
	public Teacher findTeacher(String num) {
		// TODO Auto-generated method stub
		Teacher teacher = loginMapper.findTeacher(num);
		return teacher;
	}

}
