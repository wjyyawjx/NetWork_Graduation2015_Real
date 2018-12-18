package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.GameBean;

public class RecorderGameDao {

	// 记录员查看自己的运动会
	public ArrayList<GameBean> recordergameList(String username) {
		// TODO Auto-generated method stub
		ArrayList<GameBean> Array = new ArrayList<GameBean>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from game where username=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
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
	
	// 添加运动员信息
	public void recorderAdd(String athletusername, String ranking, String results, String events) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into athlet (athletusername,ranking,results,events)" + "values(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, athletusername);
			pstmt.setString(2, ranking);
			pstmt.setString(3, results);
			pstmt.setString(4, events);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}

	}
}
