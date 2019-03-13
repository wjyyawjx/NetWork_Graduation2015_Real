package com.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnDB {
	public Connection conn = null;//数据库链接对象
	public Statement stmt = null;//Statement对象，用于执行SQL语句
	public ResultSet rs = null;//结果集对象
	//驱动类的类名
	private static String dbClassName = "com.mysql.jdbc.Driver";
	private static String dbUrl = "jdbc:mysql://localhost:3306/db_shop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	private static String dbUser = "root";
	private static String dbPwd = "root";
	
	/**
	 * 创建与数据库的链接
	 * 
	 * @return
	 * 
	 */
	public static Connection getConnection(){
		Connection conn = null;                                  //声明数据库链接对象
		try {                                                    //捕获异常
			Class.forName(dbClassName).newInstance();            //装载数据库驱动
			//获取数据库链接对象
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPwd);
		} catch (Exception ee) {                                  //处理异常
			// TODO: handle exception
			ee.printStackTrace();                                //输出异常信息
		}
		if(conn == null){
			 System.err.println("DbConnectionManager.getConnection():"
			 		+ dbClassName + "\r\n :" + dbUrl + "\r\n "
			 		+ dbUser + "/" + dbPwd);                     //输出链接信息，方便调试
		} 
		return conn;                                             //返回数据库链接
	}
	
	/**
	 * 更新数据
	 * 
	 * @param sql
	 * 
	 * @return
	 */	
	public int executeUpdate(String sql){
		int result = 0;                                     //更新数据的记录条数
		try {                                               //捕获异常
			conn = getConnection();//获取数据库链接
			//创建用于执行SQL语句的Statement对象
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);//执行SQL语句
		} catch (SQLException ex) {                          //处理异常
			// TODO: handle exception
			result = 0;                                      //指定更新数据的记录条数为0，表示没有更新数据
			ex.printStackTrace();                            // 输出异常信息
		}
		try {                                                 //捕获异常
			stmt.close();                                     //关闭用于执行SQL语句的Statement对象
		} catch (SQLException ex1) {
			// TODO: handle exception
			ex1.printStackTrace();                            //输出异常信息
		}
		return result;                                         //返回更新数据条数
	}
	/**
	 * 根据指定的SQL语句查询数据
	 * 
	 * @param sql
	 * 
	 * @return
	 */ 
	public ResultSet executeQuery(String sql){
		try {
			conn = getConnection();//获取数据库链接
			//创建用于执行SQL语句的Statement对象
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);   //执行SQL语句
		} catch (SQLException ex) {
			// TODO: handle exception
			ex.printStackTrace();          //输出异常信息
		}
		return rs;                         //返回查询结果
	}
	
	/**
	 * 关闭数据库链接
	 * 
	 */ 
	public void close(){
		try {
			if(rs != null){
				rs.close();           //关闭结果集对象
			}
			if(stmt != null){
				stmt.close();         //关闭Statement对象
			}
			if(conn != null){
				conn.close();         //关闭数据库链接对象
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(System.err);//输出异常信息
		}
	}
	
	/**
	 * 测试数据库是否连接成功
	 * @param args
	 */ 
	public static void main(String[] args){
		if(getConnection() != null){              //如果获取数据库链接
			System.out.println("数据库链接成功！");
		}
	}
	
	/**
	 * 功能：更新数据后获取生成的自动编号
	 * 
	 * @param sql
	 * @return
	 */
	public int executeUpdate_id(String sql) {
		int result = 0;
		try {// 捕捉异常
			conn = getConnection();// 获取数据库连接
			// 创建用于执行SQL语句的Statement对象
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);// 执行SQL语句
			String ID = "select @@IDENTITY as id";// 定义用于获取刚刚生成的自动编号的SQL语句
			rs = stmt.executeQuery(ID);// 获取刚刚生成的自动编号
			if (rs.next()) {// 如果存在数据
				int autoID = rs.getInt("id");// 把获取到的自动编号保存到变量autoID中
				result = autoID;
			}
		} catch (SQLException ex) {// 处理异常
			result = 0;
		}
		return result;// 返回获取结果
	}
	
}

	


