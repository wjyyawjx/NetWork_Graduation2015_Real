package com.service;

import java.sql.ResultSet;

import com.dao.DB;
import com.orm.TOrganization;
import com.orm.Yuangong;

public class liuService
{

	public static TOrganization getOrg(int id)
	{
		TOrganization organization=new TOrganization();
		
		if(id==0)
		{
			organization.setId(0);
		}
		else
		{
			String sql="select * from t_organization where id=?";
			Object[] params={id};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				rs.next();
				organization.setId(rs.getInt("id"));
				organization.setName(rs.getString("name"));
				organization.setDescription(rs.getString("description"));
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
		}
		
		return organization;
	}
	
	
	
	public static Yuangong getYuangong(int id)
	{
		    Yuangong yuangong=new Yuangong();
		    String sql="select * from t_yuangong where id=?";
			Object[] params={id};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				rs.next();
				
				yuangong.setId(rs.getInt("id"));
				yuangong.setBianhao(rs.getString("bianhao"));
				yuangong.setName(rs.getString("name"));
				yuangong.setSex(rs.getString("sex"));
				yuangong.setQuanxian(rs.getString("quanxian"));
				yuangong.setLoginname(rs.getString("loginname"));
				yuangong.setLoginpw(rs.getString("loginpw"));
				yuangong.setOrg_id(rs.getInt("org_id"));
				yuangong.setDel(rs.getString("del"));
				yuangong.setOrganization(liuService.getOrg(rs.getInt("org_id")));
				
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
		
		return yuangong;
	}
	
	
	public static String getYuangong_id_list(int org_id)
	{
		    StringBuffer yuangong_id_list=new StringBuffer("");
		
		    String sql="select * from t_yuangong where org_id=?";
			Object[] params={org_id};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				while(rs.next())
				{
					yuangong_id_list.append(rs.getInt("id"));
					yuangong_id_list.append(",");
				}
				
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
			
		    return yuangong_id_list.substring(0,yuangong_id_list.length()-1);
	}
	
	
	public static void save_fajianxiang(String title,String content,String fujian,String fujianYuanshiming,String shijian,int from_yuangong_id,int to_yuangong_id)
	{
		String sql="insert into t_fajianxiang(title,content,fujian,fujianYuanshiming,shijian,from_yuangong_id,to_yuangong_id) values(?,?,?,?,?,?,?)";
		Object[] params={title,content,fujian,fujianYuanshiming,shijian,from_yuangong_id,to_yuangong_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	public static void save_shoujianxiang(String title,String content,String fujian,String fujianYuanshiming,String shijian,int from_yuangong_id,int to_yuangong_id)
	{
		String sql="insert into t_shoujianxiang(title,content,fujian,fujianYuanshiming,shijian,from_yuangong_id,to_yuangong_id) values(?,?,?,?,?,?,?)";
		Object[] params={title,content,fujian,fujianYuanshiming,shijian,from_yuangong_id,to_yuangong_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	public static void save_caogaoxiang(String title,String content,String fujian,String fujianYuanshiming,String shijian,int from_yuangong_id,int to_yuangong_id)
	{
		String sql="insert into t_caogaoxiang(title,content,fujian,fujianYuanshiming,shijian,from_yuangong_id,to_yuangong_id) values(?,?,?,?,?,?,?)";
		Object[] params={title,content,fujian,fujianYuanshiming,shijian,from_yuangong_id,to_yuangong_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	public static void deletecaogaoxiang(String id)
	{
		
		String sql="delete from t_caogaoxiang where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	
	public static String getCatelogName(int id)
	{
		String catelog_name="";
		
		String sql="select * from t_catelog where id="+id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			catelog_name=rs.getString("name");
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return catelog_name;
	}
	public static String getGoodsName(int id)
	{
		String name="";
		
		String sql="select * from t_goods where id="+id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			name=rs.getString("name");
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return name;
	}
	
	
	public static String getKehumingcheng(int id)
	{
		String mingcheng="";
		
		String sql="select * from t_kehu where id="+id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			mingcheng=rs.getString("mingcheng");
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return mingcheng;
	}
}
