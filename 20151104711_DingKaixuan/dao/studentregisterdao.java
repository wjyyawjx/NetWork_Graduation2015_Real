package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qst.DBUtil.DBUtil;

public class studentregisterdao {
	//以下就是sql语句的差别，不做解释了
			//注册中查询用户名是否一样
			public boolean isExitEmail1(String studentid) {
				Connection conn = DBUtil.getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			
				String sql = "select * from student where student_name=?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, studentid);
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
		
		public void save(String student_name,String student_password, String student_num, String student_email, String student_qq, String student_phone_num) {
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "insert into student (student_name,student_password,student_num,student_email,student_qq,student_phone_num)" +"values(?,?,?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, student_name);
				pstmt.setString(2, student_password);
				pstmt.setString(3, student_num);
				pstmt.setString(4, student_email);
				pstmt.setString(5, student_qq);
				pstmt.setString(6, student_phone_num);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeJDBC(null, pstmt, conn);
			}
			
		}

		public boolean isExitEmail(String username) {
			// TODO Auto-generated method stub
			return false;
		}


}
