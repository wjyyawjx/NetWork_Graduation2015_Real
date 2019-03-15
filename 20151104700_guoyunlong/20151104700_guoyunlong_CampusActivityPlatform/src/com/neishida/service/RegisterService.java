package com.neishida.service;

import com.neishida.bean.UserInformationBean;
import com.neishida.dao.InforAddDao;

public class RegisterService {
	public void informationAdd(String user_name, String user_pwd, String name,String meon) {
		// TODO Auto-generated method stub
		UserInformationBean userinfor = new UserInformationBean();
		userinfor.setUsername(user_name);
		userinfor.setPassword(user_pwd);
		userinfor.setName(name);
		userinfor.setMeon(meon);
		InforAddDao infordao = new InforAddDao();
		infordao.register(userinfor);
	}
}
