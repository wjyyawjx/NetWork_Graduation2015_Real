package com.qst.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qst.dao.BaseDao;
import com.qst.dao.StudentDao;
import com.qst.bean.Student;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description对学生表的操作类
 *
 */
public class StudentDaoimp extends BaseDao implements StudentDao {

	@Override
	//获取所有学生信息
	public List<Student> getAllStudent() {
		List<Student> list = new ArrayList<Student>();
		String sql = "select`name`,`sex`,`age` from student ";
		Object[] params = {};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				Student stu = new Student();
				stu.setAge(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setName(rs.getString("age"));
				list.add(stu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	//获取指定学生信息
	public Student getStudentMoreInfo(Student stu) {
		Student student = new Student();
		String sql = "select `name`,`sex`,`age`from student where `id`=?";
		Object[] params = { stu.getId() };
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				
				student.setName(rs.getString("name"));
				student.setSex(rs.getString("sex"));
				student.setAge(rs.getString("age"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return student;
	}

	@Override
	//添加学生信息
	public int addStudent(Student stu) {
		System.out.println(stu.getName());
		int row = 0;
		String sql = "insert into student(`file`,`name`,`sex`,`age`,`fileName`) values(?,?,?,?,?)";
		Object[] params = {stu.getFile(),stu.getName(),stu.getSex(),stu.getAge(),stu.getFileName()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("添加学生信息成功");
		}else{
			System.out.println("添加学生信息失败");
		}
		return row;
	}

	@Override
	//删除学生信息
	public int delStudent(Student stu) {
		int row = 0;
		String sql = "delete from student where `id`=?";
		Object[] params = {stu.getId()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("success");
		}else{
			System.out.println("erro");
		}
		return row;
	}

	@Override
	//修改学生信息
	public int modifyStudent(Student stu) {
		int row = 0;
		String sql = "update student set name=?,age=?,sex=?, where id=?";
		Object[] params = {stu.getName(),stu.getSex(),stu.getAge(),stu.getId()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("修改学生信息成功");
		}else{
			System.out.println("修改学生信息失败");
		}
		
		return row;
	}
	
	
	//查询学生信息
	public boolean findStudent(Student stu){
		boolean flag = true;
		int row = 0;
		String sql = "select count(1) from student where  `name`=? and `sex`=? and `age`=?";
		Object[] params = {stu.getName(),stu.getAge(),stu.getSex()};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while(rs.next()){
				row = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(row>0){
			System.out.println("查询学生信息成功");
			flag = true;
		}else{
			System.out.println("查询学生信息失败");
			flag = false;
		}
		
		return flag;
		
	}
}
