package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.studentloginbean;

public class studentlogindao {
	//登录  
			//try  catch  finally  表示异常处理
			//try中包含可能出现异常的语句
			//catch 表示异常处理
			//finally  包含必须执行的语句
			public static studentloginbean login(studentloginbean studentloginbean) {
				//实例化Connection对象conn，连接数据库
				Connection conn = DBUtil.getConnection();
				//实例化PreparedStatement对象pstmt，用于传递sql语句
				PreparedStatement pstmt = null;
				//实例化ResultSet对象rs，用于返回结果
				ResultSet rs = null;
				//实例化UserBean对象userbrean，用于返回结果
				studentloginbean studentloginbean1 = null;
				
				//sql语句   ？代表占位符
				String sql = "select * from student where student_num=? and student_password=?";
				
				try {
					//运行sql语句
					pstmt = conn.prepareStatement(sql);
					//第一个问号的值
					pstmt.setString(1, studentloginbean.getStudent_num());
					//第二个问号的值
					pstmt.setString(2, studentloginbean.getStudent_password());
					//返回结果集
					rs = pstmt.executeQuery();
					
					while(rs.next())//遍历结果集
					{
						//将结果返回到teacherloginbean，用于最后的return返回到login。
						studentloginbean1 = new studentloginbean();
						studentloginbean1.setStudent_num(rs.getString("setStudent_num"));
						studentloginbean1.setStudent_password(rs.getString("setStudent_password"));
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					//关闭
					DBUtil.closeJDBC(rs, pstmt, conn);
				}
				
				return studentloginbean1;
			}
			//以下就是sql语句的差别，不做解释了
			//注册中查询用户名是否一样
			public boolean isExitEmail(String userid) {
				Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			
				String sql = "select * from student where student_num=?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					rs = pstmt.executeQuery();
					
					while(rs.next())
					{
						//用户名重复
						return true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					DBUtil.closeJDBC(rs, pstmt, conn);
				}
				//用户名没重复
				return false;
			}

}
