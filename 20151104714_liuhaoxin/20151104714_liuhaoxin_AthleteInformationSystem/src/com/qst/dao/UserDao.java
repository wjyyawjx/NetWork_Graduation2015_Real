package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.UserBean;


public class UserDao {

	//进行用户名密码验证
		public UserBean login(UserBean userbean) {
			
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			UserBean userbrean = null;
			
			String sql = "select * from user where username=? and pwd=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userbean.getUsername());
				pstmt.setString(2, userbean.getPwd());
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					userbrean = new UserBean();
					userbrean.setUsername(rs.getString("username"));
					userbrean.setUsername(rs.getString("pwd"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeJDBC(rs, pstmt, conn);
			}
			
			return userbrean;
		}

}
