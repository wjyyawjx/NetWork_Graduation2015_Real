package com.qst.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qst.DButil.LoginDButil;
import com.qst.bean.LoginBean;

public class LoginDao {
public LoginBean login(LoginBean loginbean) {
		
		Connection conn = LoginDButil.getConnection();
		String sql = "select * from  user where username=? and password = ?";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		LoginBean resultBean = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, loginbean.getUsername());
			pstm.setString(2, loginbean.getPassword());
			rs = pstm.executeQuery();
			while (rs.next()) {
				resultBean = new LoginBean();
				resultBean.setUsername(rs.getString("username"));
				resultBean.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			LoginDButil.CloseDB(conn, pstm, rs);
		}
		return resultBean;

	}

	public LoginBean addUser(LoginBean loginbean) {

		Connection conn = LoginDButil.getConnection();
		String sql = "insert into user(username,password) values(?,?)";
		PreparedStatement pstm = null;
		LoginBean resultBean = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, loginbean.getUsername());
			pstm.setString(2, loginbean.getPassword());
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			LoginDButil.CloseDB(conn, pstm, null);
		}
		return resultBean;

	}

	public LoginBean findUsername(LoginBean loginbean) {
		// TODO Auto-generated method stub
		Connection conn = LoginDButil.getConnection();
		String sql = "select * from  user where username=?";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		LoginBean resultBean = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, loginbean.getUsername());
			rs = pstm.executeQuery();
			while (rs.next()) {
				resultBean = new LoginBean();
				resultBean.setUsername(rs.getString("username"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			LoginDButil.CloseDB(conn, pstm, rs);
		}
		return resultBean;
	}
}
