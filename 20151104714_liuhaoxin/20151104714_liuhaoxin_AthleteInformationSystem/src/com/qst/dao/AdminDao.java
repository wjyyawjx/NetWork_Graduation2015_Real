package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.UserBean;

public class AdminDao {

	// 查询所有用户信息
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
	// 按用户名查询用户信息
	public ArrayList<UserBean> userList(String username) {
		// TODO Auto-generated method stub
		ArrayList<UserBean> Array = new ArrayList<UserBean>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from user where username=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
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
	// 按用户名类型用户信息
		public ArrayList<UserBean> usertypeList(String permission) {
			// TODO Auto-generated method stub
			ArrayList<UserBean> Array = new ArrayList<UserBean>();
			Connection conn = DBUtil.getConnection();
			String sql = "select * from user where permission=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, permission);
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
		// 按用户名和用户类型查询用户信息
		public ArrayList<UserBean> userList(String username,String permission) {
			// TODO Auto-generated method stub
			ArrayList<UserBean> Array = new ArrayList<UserBean>();
			Connection conn = DBUtil.getConnection();
			String sql = "select * from user where username=? && permission=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, username);
				pstmt.setString(2, permission);
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
	
}

	
