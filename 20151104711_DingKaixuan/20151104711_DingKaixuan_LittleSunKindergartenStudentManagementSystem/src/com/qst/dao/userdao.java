package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.userbean;

public class userdao {
	public userbean login(userbean userbean){
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		userbean stubean1 = null;
		
		String sql = "select * from student where student_number=? and student_password=?";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userbean.getUsername());
			pstmt.setString(2, userbean.getPassword());
			rs = pstmt.executeQuery();
			while(rs.next()){
				stubean1 = new userbean();
				stubean1.setUsername(rs.getString("username"));
				stubean1.setPassword(rs.getString("password"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return stubean1;	
	}

}
