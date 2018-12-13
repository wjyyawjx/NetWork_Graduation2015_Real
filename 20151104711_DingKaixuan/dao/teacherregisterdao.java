package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qst.DBUtil.DBUtil;

public class teacherregisterdao {
	
	//以下就是sql语句的差别，不做解释了
		//注册中查询用户名是否一样
		public boolean isExitEmail1(String teacherid) {
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
			String sql = "select * from teacher where teacher_name=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, teacherid);
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
	
	public void save(String teacher_name,String teacher_password, String teacher_num, String teacher_email, String teacher_qq, String teacher_phone_num) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into teacher (teacher_name,teacher_password,teacher_num,teacher_email,teacher_qq,teacher_phone_num)" +"values(?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacher_name);
			pstmt.setString(2, teacher_password);
			pstmt.setString(3, teacher_num);
			pstmt.setString(4, teacher_email);
			pstmt.setString(5, teacher_qq);
			pstmt.setString(6, teacher_phone_num);
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
