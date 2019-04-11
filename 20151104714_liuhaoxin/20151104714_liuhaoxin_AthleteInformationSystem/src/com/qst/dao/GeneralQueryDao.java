package com.qst.dao;
//用于一般用户查看运动会信息

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.AthletBean;
import com.qst.bean.GameBean;

public class GeneralQueryDao {
	// 一般用户查看所有的运动会
	public ArrayList<GameBean> generalgameList() {
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

	// 一般用户查看运动员信息
	public ArrayList<AthletBean> athletList(int tsid) {
		// TODO Auto-generated method stub
		ArrayList<AthletBean> Array = new ArrayList<AthletBean>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from athlet where tsid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tsid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AthletBean tag = new AthletBean();
				tag.setTid(rs.getInt("tid"));
				tag.setAthletusername(rs.getString("athletusername"));
				tag.setRanking(rs.getString("ranking"));
				tag.setResults(rs.getString("results"));
				tag.setEvents(rs.getString("events"));
				tag.setTheclass(rs.getString("theclass"));
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

	// 一般用户查看项目信息
	public ArrayList<AthletBean> eventsList(int tsid) {
		// TODO Auto-generated method stub
		ArrayList<AthletBean> Array = new ArrayList<AthletBean>();
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT DISTINCT events FROM athlet where tsid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tsid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AthletBean tag = new AthletBean();
				tag.setEvents(rs.getString("events"));
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

	// 一般用户分类查看运动员信息
	public ArrayList<AthletBean> athletclassifyList(int sid,String events) {
		// TODO Auto-generated method stub
		ArrayList<AthletBean> Array = new ArrayList<AthletBean>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from athlet where tsid=? and events=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			pstmt.setString(2, events);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AthletBean tag = new AthletBean();
				tag.setTid(rs.getInt("tid"));
				tag.setAthletusername(rs.getString("athletusername"));
				tag.setRanking(rs.getString("ranking"));
				tag.setResults(rs.getString("results"));
				tag.setEvents(rs.getString("events"));
				tag.setTheclass(rs.getString("theclass"));
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
