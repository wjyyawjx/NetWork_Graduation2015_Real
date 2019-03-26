package com.qst.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qst.DButil.ConfigManager;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-09  All rights reserved.
 *
 * @ class description：数据库操作的基类，连接、查询、释放资源
 *
 */
public class BaseDao {
	Connection connection = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	
	//获取数据库连接
	public boolean getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/project?useSSL=false&useUnicode=true&characterEncoding=utf-8";
			String username = "root";
			String password = "123456";
			
			connection = DriverManager.getConnection(url, username, password);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	//对数据库的增加、删除、修改，返回SQL语句影响的行数
	public int executeUpdateSQL(String sql,Object[] params){
		int row = 0;
		if(getConnection()){
			try {
				pstm = connection.prepareStatement(sql);
				for(int i = 0; i < params.length; i++){
					pstm.setObject(i+1, params[i]);
				}
				row = pstm.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//对数据库的查询，返回查询结果集合
	public ResultSet executeQuerySQL(String sql, Object[] params){
		if(getConnection()){
			try {
				pstm = connection.prepareStatement(sql);
				for(int i = 0; i < params.length; i++){
					pstm.setObject(i+1, params[i]);
				}
				rs = pstm.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}
	
	
	//关闭资源
	public void closeAllResource(){
		if(connection != null){
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstm != null){
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	

}


