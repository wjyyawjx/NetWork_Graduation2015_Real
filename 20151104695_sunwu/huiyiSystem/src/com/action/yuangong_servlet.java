package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Twenjian;
import com.orm.Yuangong;
import com.service.liuService;

public class yuangong_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		String fangshi=req.getParameter("fangshi");
		if(type.endsWith("yuangongAdd"))
		{
			yuangongAdd(req, res);
		}
		if(type.endsWith("yuangongMana"))
		{
			yuangongMana(req, res);
		}
		if(type.endsWith("yuangongDel"))
		{
			yuangongDel(req, res);
		}
		if(type.endsWith("yuangongQuanxian"))
		{
			yuangongQuanxian(req, res);
		}
		
		if(type.endsWith("yuangongByOrg"))
		{
			yuangongByOrg(req, res);
		}
		if(type.endsWith("yuangongGet"))
		{
			yuangongGet(req, res);
		}
		if(type.endsWith("yuangongUpdate"))
		{
			yuangongUpdate(req,res);
		}
		if(type.endsWith("yuangongUpdate1"))
		{
			yuangongUpdate1(req,res);
		}
		if(type.endsWith("yuangongRegister"))
		{
			yuangongRegister(req,res);
		}
		if(type.endsWith("yuangongSuccess"))
		{
			yuangongSuccess(req,res);
		}
		if(type.endsWith("yuangongSerach"))
		{
			if (fangshi.equals("按学号搜索")) {
				yuangongSerach1(req, res);
			}
			else if(fangshi.equals("按姓名搜索"))
			{
				yuangongSerach2(req, res);
			}
			else
			{
				yuangongSerach3(req,res);
			}
		}
	}
	
	
	
	
	public void yuangongAdd(HttpServletRequest req,HttpServletResponse res)
	{
		int org_id=Integer.parseInt(req.getParameter("org_id"));
		String bianhao=req.getParameter("bianhao");
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
		String quanxian="成员";
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		String del="no";
		
		String sql="insert into t_yuangong(org_id,bianhao,name,sex,quanxian,loginname,loginpw,del) values(?,?,?,?,?,?,?,?)";
		Object[] params={org_id,bianhao,name,sex,quanxian,loginname,loginpw,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "添加成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void yuangongRegister(HttpServletRequest req,HttpServletResponse res)
	{
		int org_id=Integer.parseInt(req.getParameter("org_id"));
		String bianhao=req.getParameter("bianhao");
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
		String quanxian="成员";
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		String del="no";
		
		String sql="insert into t_yuangong(org_id,bianhao,name,sex,quanxian,loginname,loginpw,del) values(?,?,?,?,?,?,?,?)";
		Object[] params={org_id,bianhao,name,sex,quanxian,loginname,loginpw,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "注册成功");
		req.setAttribute("path", "yuangong?type=yuangongSuccess");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void yuangongUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		int org_id=Integer.parseInt(req.getParameter("org_id"));
		int id=Integer.parseInt(req.getParameter("id"));
		String bianhao=req.getParameter("bianhao");
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		
		
		String sql="update t_yuangong set org_id=?,bianhao=?,name=?,sex=?,loginname=?,loginpw=? where id=?";
		Object[] params={org_id,bianhao,name,sex,loginname,loginpw,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "修改成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
	}

	public void yuangongDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="update t_yuangong set del=? where id=?";
		Object[] params={"yes",id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void yuangongQuanxian(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String quanxian=req.getParameter("quanxian");
		
		String sql="update t_yuangong set quanxian=? where id=?";
		Object[] params={quanxian,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "设置成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void yuangongSuccess(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		req.getRequestDispatcher("/admin/register/tiao.jsp").forward(req, res);
	}
	
	public void yuangongUpdate1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
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
		
		req.setAttribute("yuangong", yuangong);
		req.getRequestDispatcher("admin/yuangong/yuangongUpdate.jsp").forward(req, res);
	}
	
	public void yuangongMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List yuangongList=new ArrayList();
		String sql="select * from t_yuangong where del='no' order by org_id desc";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Yuangong yuangong=new Yuangong();
				
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
				yuangongList.add(yuangong);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}
	
	public void yuangongSerach1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List yuangongList=new ArrayList();
		String content=req.getParameter("content");
		String sql="select * from t_yuangong where bianhao like \"%\"?\"%\" and del='no'";
		Object[] params={content};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
                Yuangong yuangong=new Yuangong();
				
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
				yuangongList.add(yuangong);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}
	
	public void yuangongSerach2(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List yuangongList=new ArrayList();
		String content=req.getParameter("content");
		String sql="select * from t_yuangong where name like \"%\"?\"%\" and del='no'";
		Object[] params={content};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
                Yuangong yuangong=new Yuangong();
				
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
				yuangongList.add(yuangong);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}
	
	public void yuangongSerach3(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List yuangongList=new ArrayList();
		String content=req.getParameter("content");
		String sql="select * from t_yuangong where t_yuangong.org_id in (select t_organization.id from t_organization where t_organization.name like \"%\"?\"%\") and t_yuangong.del='no'";
		Object[] params={content};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
                Yuangong yuangong=new Yuangong();
				
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
				yuangongList.add(yuangong);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}
	
	public void yuangongByOrg(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List yuangongList=new ArrayList();
		String sql="select * from t_yuangong where del='no' and org_id=? order by org_id desc";
		Object[] params={Integer.parseInt(req.getParameter("org_id"))};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Yuangong yuangong=new Yuangong();
				
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
				yuangongList.add(yuangong);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongByOrg.jsp").forward(req, res);
	}
	
	
	public void yuangongGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		Yuangong yuangong=liuService.getYuangong(Integer.parseInt(req.getParameter("yuangong_id")));
		String s=yuangong.getName()+"###"+yuangong.getOrganization().getName()+"###"+yuangong.getBianhao();
		res.getWriter().print(s);
	}
	
	
	/*public void yuangongEdit(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
		String age=req.getParameter("age");
		String tel=req.getParameter("tel");
		String address=req.getParameter("address");
		String zhiwei=req.getParameter("zhiwei");
		
		
		String sql="update t_yuangong set name=?,sex=?,age=?,tel=?,address=?,zhiwei=? where id="+id;
		Object[] params={name,sex,age,tel,address,zhiwei};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}*/
	
	
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
