package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.UserBean;


public class AdminDao {

	//查询所有用户
	
	public ArrayList<UserBean> userList() {
		// TODO Auto-generated method stub
		ArrayList<UserBean> Array = new ArrayList<UserBean>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from user where username!='admin'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserBean tag = new UserBean();
				tag.setUid(rs.getInt("uid"));
				tag.setUsername(rs.getString("username"));
				tag.setPwd(rs.getString("pwd"));
				tag.setEmail(rs.getString("email"));
				tag.setPhone(rs.getString("phone"));
				tag.setPermission(rs.getString("permission"));
				Array.add(tag);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return Array;
	}
	//修改用户权限，在记录员和普通用户之间切换
		public void permissionupload(int uid,String qx) {
			// TODO Auto-generated method stub
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			String sql = "update user set permission=? where uid =?";
			try {	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, qx);
				pstmt.setInt(2, uid);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeJDBC(null, pstmt, conn);
			}
		}
		//修改用户权限，用于普通用户通过审核。
				public void permissionupload(String username) {
					// TODO Auto-generated method stub
					Connection conn = DBUtil.getConnection();
					PreparedStatement pstmt = null;
					String sql = "update user set permission='1' where username =?";
					try {	
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,username);
						pstmt.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						DBUtil.closeJDBC(null, pstmt, conn);
					}
				}
}
