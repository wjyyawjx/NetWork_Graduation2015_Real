package com.qst.service;

import java.util.List;

import com.qst.dao.StudentDao;
import com.qst.dao.StudentDaoimp;
import com.qst.bean.Student;
import com.qst.service.StudentService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作学生
 *
 */
public class StudentServiceimp implements StudentService{
	private StudentDao studentDao = null;
	
	public StudentServiceimp(){
		studentDao = new StudentDaoimp();
	}

	@Override
	//获取所有学生信息
	public List<Student> getAllStudent() {
		return studentDao.getAllStudent();
	}

	@Override
	//获取指定学生信息
	public Student getStudentMoreInfo(Student stu) {
		return studentDao.getStudentMoreInfo(stu);
	}

	@Override
	//添加学生
	public int addStudent(Student stu) {
		return studentDao.addStudent(stu);
	}

	@Override
	//删除学生
	public int delStudent(Student stu) {
		return studentDao.delStudent(stu);
	}

	@Override
	//修改学生信息
	public int modifyStudent(Student stu) {
		return studentDao.modifyStudent(stu);
	}
	
	//查找有没有指定的学生
	public boolean findStudent(Student stu){
		return studentDao.findStudent(stu);
				
	}

}


