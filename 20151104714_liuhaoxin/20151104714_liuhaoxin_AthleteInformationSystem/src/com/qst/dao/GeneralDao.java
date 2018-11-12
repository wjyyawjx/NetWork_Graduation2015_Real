package com.qst.dao;

// 用于各个对申请的操作
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.ToapplyforBean;

public class GeneralDao {
	// 添加申请理由
	public void ToApplyFor(String reason, String username) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into toapplyfor (reason,username)" + "values(?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reason);
			pstmt.setString(2, username);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}

	}

	// 查看所有的申请
	public ArrayList<ToapplyforBean> ToApplyForView() {
		// TODO Auto-generated method stub
		ArrayList<ToapplyforBean> Array = new ArrayList<ToapplyforBean>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from toapplyfor  ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ToapplyforBean tag = new ToapplyforBean();
				tag.setAid(rs.getInt("aid"));
				tag.setUsername(rs.getString("username"));
				tag.setReason(rs.getString("reason"));
				tag.setState(rs.getString("state"));
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

	// 查看自己的申请
	public ArrayList<ToapplyforBean> ToApplyForView(String user) {
		// TODO Auto-generated method stub
		ArrayList<ToapplyforBean> Array = new ArrayList<ToapplyforBean>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from toapplyfor where username=? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ToapplyforBean tag = new ToapplyforBean();
				tag.setAid(rs.getInt("aid"));
				tag.setUsername(rs.getString("username"));
				tag.setReason(rs.getString("reason"));
				tag.setState(rs.getString("state"));
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

	// 删除申请
	public void ToApplyFordelete(String username) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "delete from toapplyfor where username=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
	}

	// 修改用户权限，在记录员和普通用户之间切换
	public void permissionupload(int uid, String qx) {
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
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	// 修改用户权限，用于普通用户通过审核。
	public void permissionupload(String username) {
	// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update user set permission='1' where username =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.executeUpdate();
			} catch (SQLException e)
		{
					// TODO Auto-generated catch block
					e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		}

	// 拒绝用户的申请
	public void permissionupload(String liyou, int aid) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update toapplyfor set state=? where aid =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, liyou);
			pstmt.setInt(2, aid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

}
