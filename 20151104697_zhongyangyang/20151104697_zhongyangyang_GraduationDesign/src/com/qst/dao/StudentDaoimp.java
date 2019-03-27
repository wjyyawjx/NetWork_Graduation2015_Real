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
	public Student getStudentMoreInfo(Student student) {
		Student stu = new Student();
		String sql = "select `name`,`sex`,`age`from student where `id`=?";
		Object[] params = { student.getId() };
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				
				stu.setName(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setAge(rs.getString("age"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stu;
	}

	@Override
	//添加学生信息
	public int addStudent(Student student) {
		int row = 0;
		String sql = "insert into student(`file`,`name`,`sex`,`age`,`fileName`) values(?,?,?)";
		Object[] params = {student.getName(),student.getSex(),student.getAge()};
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
	public int delStudent(Student student) {
		int row = 0;
		String sql = "delete from student where `id`=?";
		Object[] params = {student.getId()};
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
	public int modifyStudent(Student student) {
		int row = 0;
		String sql = "update student set name=?,age=?,sex=?, where id=?";
		Object[] params = {student.getName(),student.getSex(),student.getAge(),student.getId()};
		System.out.println(student.getName());
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("修改学生信息成功");
		}else{
			System.out.println("修改学生信息失败");
		}
		
		return row;
	}
	
	
	//查询学生信息
	public boolean findStudent(Student student){
		boolean flag = true;
		int row = 0;
		String sql = "select count(1) from student where  `name`=? and `sex`=? and `age`=?";
		Object[] params = {student.getName(),student.getAge(),student.getSex()};
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
