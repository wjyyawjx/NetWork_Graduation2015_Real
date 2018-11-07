package com.qst.DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	static String name = "root";
	static String password = "123456";
	static String url = "jdbc:mysql://localhost:3306/biyesheji";
	static {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection conn = null;
		try{
			conn = DriverManager.getConnection(url, name, password);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeJDBC(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if(rs !=null){
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(pstmt !=null){
			try{
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(conn != null)
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
