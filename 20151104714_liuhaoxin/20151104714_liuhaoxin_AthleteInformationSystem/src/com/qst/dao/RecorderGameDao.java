package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qst.DBUtil.DBUtil;
import com.qst.bean.AthletBean;
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
	public void recorderAdd(int tsid,String athletusername, String college,String ranking, String results, String events,String theclass) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		int a=0;
		String sql = "insert into athlet (tsid,athletusername,ranking,results,events,theclass,college)" + "values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tsid);
			pstmt.setString(2, athletusername);
			pstmt.setString(3, ranking);
			pstmt.setString(4, results);
			pstmt.setString(5, events);
			pstmt.setString(6, theclass);
			pstmt.setString(7, college);
			a=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		if(a==1) {
			System.err.println();
		}else {
			
		}

	}
	
	// 修改运动员信息
		public void recorderUpdate(int tid,String athletusername, String college,String ranking, String results, String events,String theclass) {
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;

			String sql = "update athlet set athletusername=?,ranking=?,results=?,events=?,theclass=?,college=? where tid=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, athletusername);
				pstmt.setString(2, ranking);
				pstmt.setString(3, results);
				pstmt.setString(4, events);
				pstmt.setString(5, theclass);
				pstmt.setString(6, college);
				pstmt.setInt(7, tid);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(null, pstmt, conn);
			}

		}
		
		// 修改运动员信息
				public AthletBean recorderUpdate(int tid) {
					// TODO Auto-generated method stub
					AthletBean Array = new AthletBean();
					Connection conn = DBUtil.getConnection();
					String sql = "select * from athlet where tid=?";
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, tid);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							Array.setTid(rs.getInt("tid"));
							Array.setAthletusername(rs.getString("athletusername"));
							Array.setCollege(rs.getString("college"));
							Array.setRanking(rs.getString("ranking"));
							Array.setResults(rs.getString("results"));
							Array.setEvents(rs.getString("events"));
							Array.setTheclass(rs.getString("theclass"));
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						DBUtil.closeJDBC(rs, pstmt, conn);
					}
					return Array;
				}

		
		// 删除运动员信息
		public void recorderDelete(int tid) {
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;

			String sql = "delete from athlet where tid=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, tid);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(null, pstmt, conn);
			}

		}
	
	
	// 记录员查看运动员信息
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
					tag.setCollege(rs.getString("college"));
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
