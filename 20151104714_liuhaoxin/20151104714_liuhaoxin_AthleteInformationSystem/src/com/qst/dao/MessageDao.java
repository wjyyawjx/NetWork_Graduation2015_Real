package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.MessageBean;
import com.qst.bean.UserBean;

public class MessageDao {
	//添加留言
	public void messageadd(String message, String username) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into message (message,username)" + "values(?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message);
			pstmt.setString(2, username);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}

	}

	// 查所有留言
		public ArrayList<MessageBean> messageList() {
			// TODO Auto-generated method stub
			ArrayList<MessageBean> Array = new ArrayList<MessageBean>();
			Connection conn = DBUtil.getConnection();
			String sql = "select * from Message";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {

				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					MessageBean tag = new MessageBean();
					tag.setMid(rs.getInt("mid"));
					tag.setMessage(rs.getString("message"));
					tag.setUsername(rs.getString("username"));
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
		
		// 删除留言
		public void MessageDelete(int mid) {
			// TODO Auto-generated method stub
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "delete from message where mid=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mid);
				pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(rs, pstmt, conn);
			}
		}

}
