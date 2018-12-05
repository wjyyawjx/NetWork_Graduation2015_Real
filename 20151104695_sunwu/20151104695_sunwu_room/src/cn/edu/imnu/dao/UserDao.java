package cn.edu.imnu.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import cn.edu.imnu.bean.UserBean;
import cn.edu.imnu.util.DBUtil;


public class UserDao {

	public UserBean login(UserBean userbean) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserBean userbrean = null;

		String sql = "select * from user where username=? and password=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userbean.getUsername());
			pstmt.setString(2, userbean.getPassword());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				userbrean = new UserBean();
				userbrean.setUsername(rs.getString("username"));
				userbrean.setType(rs.getString("type"));
				userbrean.setPassword(rs.getString("password"));
				userbrean.setU_id(rs.getInt("u_id"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(conn, pstmt, rs);
		}

		return userbrean;
	}
}
