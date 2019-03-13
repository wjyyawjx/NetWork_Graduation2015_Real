package com.neishida.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.neishida.bean.LoginBean;
import com.neishida.DBUtil.DBUtil;

public class LoginDao {
	public LoginBean login(LoginBean loginbean) {

		Connection conn = DBUtil.getConnection();
		String sql = "select * from  user where name=? and pwd = ?";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		LoginBean resultBean = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, loginbean.getName());
			pstm.setString(2, loginbean.getPwd());
			rs = pstm.executeQuery();
			while (rs.next()) {
				resultBean = new LoginBean();
				resultBean.setName(rs.getString("name"));
				resultBean.setPwd(rs.getString("pwd"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(conn, pstm, rs);
		}
		return resultBean;

	}

	public LoginBean addUser(LoginBean loginbean) {

		Connection conn = DBUtil.getConnection();
		String sql = "insert into user(name,pwd) values(?,?)";
		PreparedStatement pstm = null;

		LoginBean resultBean = null;
		try {
			pstm = conn.prepareStatement(sql);
			System.out.println("123456789");
			System.out.println(loginbean.getName());
			pstm.setString(1, loginbean.getName());
			pstm.setString(2, loginbean.getPwd());
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(conn, pstm, null);
		}
		return resultBean;

	}
}
