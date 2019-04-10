package com.neishida.service;

import com.neishida.bean.UserInformationBean;
import com.neishida.dao.InforAddDao;

import java.util.List;

import com.neishida.bean.ActivityBean;

public class InforAddService {
	public void informationAdd(String user_name, String user_pwd) {
		// TODO Auto-generated method stub
		UserInformationBean userinfor = new UserInformationBean();
		userinfor.setUsername(user_name);
		userinfor.setPassword(user_pwd);
		System.out.println(user_pwd);
		InforAddDao infordao = new InforAddDao();
		infordao.register(userinfor);
	}

	public void actAdd(String actname, String des) {
		// TODO Auto-generated method stub
		ActivityBean act = new ActivityBean();
		act.setActname(actname);
		act.setDes(des);
		InforAddDao infordao = new InforAddDao();
		infordao.actadd(act);
	}
	
	//获取所有学生信息
		public List<UserInformationBean> getalluser() {
			return InforAddDao.getalluser();
		}
}
