package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;
import com.util.DBconn;

public class UserDaoImpl implements UserDao{
	
	public boolean register(User user) {
		
		boolean flag = false;
		DBconn.init();
		int i =DBconn.addUpdDel("insert into user(name,worknumber,sex,home,gangwei,info) " +
				"values('"+user.getName()+"','"+user.getWorknumber()+"','"+user.getSex()+"','"+user.getHome()+"','"+user.getGangwei()+"','"+user.getInfo()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public boolean login(String name, String pwd) {
		boolean flag = false;
		try {
			    DBconn.init();
				ResultSet rs = DBconn.selectSql("select * from user where name='"+name+"' and pwd='"+pwd+"'");
				while(rs.next()){
					if(rs.getString("name").equals(name) && rs.getString("pwd").equals(pwd)){
						flag = true;
					}
				}
				DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public List<User> getUserAll() {
		List<User> list = new ArrayList<User>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from user");
			while(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setWorknumber(rs.getString("worknumber"));
				user.setSex(rs.getString("sex"));
				user.setHome(rs.getString("home"));
				user.setGangwei(rs.getString("gangwei"));
				user.setInfo(rs.getString("info"));
				list.add(user);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean update(int id,String name, String worknumber,String sex, String home,String gangwei,String info) {
		boolean flag = false;
		DBconn.init();
		String sql ="update user set name ='"+name
				+"' , worknumber ='"+worknumber
				+"' , sex ='"+sex
				+"' , home ='"+home
				+"' , gangwei ='"+gangwei
				+"' , info ='"+info+"' where id = "+id;
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean delete(int id) {
		boolean flag = false;
		DBconn.init();
		String sql = "delete  from user where id="+id;
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean update1(int id, String name, String worknumber, String sex, String home,String gangwei, String info) {
		// TODO Auto-generated method stub
		return false;
	}
    
}
