package com.neishida.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.neishida.DBUtil.DBUtil;
import com.neishida.bean.ActivityBean;
import com.neishida.bean.UserInformationBean;

public class InforAddDao {
	Connection conn=DBUtil.getConnection();                                      //数据库连接对象  
    PreparedStatement pstm;  
	
	
	
    public String getName(String name){  
        String NAME=null;  
        try{  
            pstm=conn.prepareStatement("select name from user where name=?");  
            pstm.setString(1, name);  
            ResultSet rs=pstm.executeQuery();  
            while(rs.next()){  
                 NAME=rs.getString(1);  
            }  
            return NAME;  
        }catch(Exception e){  
            e.printStackTrace();  
            return null;  
        }  
    }



	public void register(UserInformationBean userinfor) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "insert into user(name,pwd) values (?,?)";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,userinfor.getUsername());
			pstm.setString(2,userinfor.getPassword());
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.CloseDB(conn,pstm,rs);
		}
	}



	public void actadd(ActivityBean act) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "insert into activity(actname,des) values (?,?)";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,act.getActname());
			pstm.setString(2,act.getDes());
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.CloseDB(conn,pstm,rs);
		}
	}
	
	public List<UserInformationBean> getalluser() {
		List<UserInformationBean> list = new ArrayList<UserInformationBean>();
		String sql = "select `id`,`name`,`age`,`sex`,`profile` from user ";
		Object[] params = {};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				Student stu = new Student();
				stu.setId(rs.getInt("id"));
				stu.setAge(rs.getInt("age"));
				stu.setSex(rs.getString("sex"));
				stu.setName(rs.getString("name"));
				stu.setProfile(rs.getString("profile"));
				list.add(stu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
