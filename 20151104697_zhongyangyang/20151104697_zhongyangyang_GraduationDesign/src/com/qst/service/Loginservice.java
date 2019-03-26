package com.qst.service;

import com.qst.bean.LoginBean;
import com.qst.dao.LoginDao;

public class Loginservice {
	public LoginBean Loginvalidate(String username, String password) {
		// TODO Auto-generated method stub
		LoginBean loginbean = new LoginBean();
		loginbean.setUsername(username);
		loginbean.setPassword(password);
		LoginDao ld = new LoginDao();
		LoginBean rs = ld.login(loginbean);
		return rs;
	}
	public LoginBean RegisternValidate(String username, String password) {
		LoginBean loginbean = new LoginBean();
		loginbean.setUsername(username);
		loginbean.setPassword(password);
		LoginDao ld = new LoginDao();
		LoginBean rs = ld.addUser(loginbean);
		return rs;
	}

	public LoginBean findUsername(String username) {
		// TODO Auto-generated method stub
		LoginBean loginbean = new LoginBean();
		loginbean.setUsername(username);
		LoginDao ld = new LoginDao();
		LoginBean rs = ld.findUsername(loginbean);
		return rs;
	}

}
