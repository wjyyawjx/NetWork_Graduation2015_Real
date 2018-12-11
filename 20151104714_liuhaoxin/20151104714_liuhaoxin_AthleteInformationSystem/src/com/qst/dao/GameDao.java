package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.GameBean;
import com.qst.bean.MessageBean;
import com.qst.bean.UserBean;

//用于对管理员对运动会的操作
public class GameDao {
	
	//添加运动会
		public void gameadd(String username, String gamesname, String startTime, String stopTime) {
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;

			String sql = "insert into game (username,gamesname,startTime,stopTime)" + "values(?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, username);
				pstmt.setString(2, gamesname);
				pstmt.setString(3, startTime);
				pstmt.setString(4, stopTime);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(null, pstmt, conn);
			}

		}

		// 查所有运动会
			public ArrayList<GameBean>gameList() {
				// TODO Auto-generated method stub
				ArrayList<GameBean> Array = new ArrayList<GameBean>();
				Connection conn = DBUtil.getConnection();
				String sql = "select * from game";
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {

					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						GameBean tag = new GameBean();
						tag.setSid(rs.getInt("sid"));
						tag.setUsername(rs.getString("username"));
						tag.setGamesname(rs.getString("gamesname"));
						tag.setStartTime(rs.getString("startTime"));
						tag.setStopTime(rs.getString("stopTime"));
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
			
			// 查所有记录员
			public ArrayList<UserBean>usernameList() {
				// TODO Auto-generated method stub
				ArrayList<UserBean> Array = new ArrayList<UserBean>();
				Connection conn = DBUtil.getConnection();
				String sql = "select * from user where permission='1' ";
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {

					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						UserBean tag = new UserBean();
						tag.setUid(rs.getInt("uid"));
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


}				
