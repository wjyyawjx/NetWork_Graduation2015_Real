package com.lyh.springboot.service;

import com.lyh.springboot.pojo.Login;
import com.lyh.springboot.pojo.Student;
import com.lyh.springboot.pojo.Teacher;

public interface LoginService {

	Login login(String num, String pwd);

	void addUser(String num, String pwd, int type);

	void perfectInformation_s(String name, String tel, String sex, String email, String age, String num);

	void perfectInformation_t(String name, String tel, String email, String num);

	Login findpwdUser(String num);

	void findpwd(String pwd, String num);

	Student findStudent(String num);

	Teacher findTeacher(String num);


}
