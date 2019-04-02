package com.neishida.service;

import com.neishida.bean.UserInformationBean;
import com.neishida.dao.InforAddDao;

public class RegisterService {
	public void informationAdd(String user_name, String user_pwd) {
		// TODO Auto-generated method stub
		UserInformationBean userinfor = new UserInformationBean();
		userinfor.setUsername(user_name);
		userinfor.setPassword(user_pwd);
		System.out.println(user_pwd);
		InforAddDao infordao = new InforAddDao();
		infordao.register(userinfor);
	}
}
