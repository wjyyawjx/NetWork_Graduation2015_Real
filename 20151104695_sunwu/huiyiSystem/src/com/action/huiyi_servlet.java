package com.action;

import java.io.IOException;
import java.sql.ResultSet;
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
import com.orm.Huiyishi;

public class huiyi_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("huiyiAdd"))
		{
			huiyiAdd(req, res);
		}
		if(type.endsWith("huiyiMana"))
		{
			huiyiMana(req, res);
		}
		if(type.endsWith("huiyiDel"))
		{
			huiyiDel(req, res);
		}
		if(type.endsWith("huiyiDetail"))
		{
			huiyiDetail(req, res);
		}
		
		if(type.endsWith("huiyiAll"))
		{
			huiyiAll(req, res);
		}
		if(type.endsWith("huiyiUpdate"))
		{
			huiyiUpdate(req, res);
		}
		if(type.endsWith("huiyiUpdate1"))
		{
			huiyiUpdate1(req, res);
		}
	}
	
	
	public void huiyiAdd(HttpServletRequest request,HttpServletResponse res)
	{
		String beizhu = request.getParameter("beizhu");
		String fangwujiegou = request.getParameter("fangwujiegou");
		String menpaihao = request.getParameter("menpaihao");
		String shebei = request.getParameter("shebei");
		String mianji = request.getParameter("mianji");
		String zhuzhi = request.getParameter("zhuzhi");
		String salestate = request.getParameter("salestate");
		String price = request.getParameter("price");
		String createtime=new Date().toLocaleString();
		
		String sql="insert into t_huiyi(beizhu,fangwujiegou,menpaihao,shebei,mianji,zhuzhi,salestate,price,createtime) values(?,?,?,?,?,?,?,?,?)";
		Object[] params={beizhu,fangwujiegou,menpaihao,shebei,mianji,zhuzhi,salestate,price,createtime};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		request.setAttribute("message", "会议室发布成功");
		request.setAttribute("path", "huiyi?type=huiyiMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, request, res);
        
	}
	
	public void huiyiUpdate(HttpServletRequest request,HttpServletResponse res)
	{
		String beizhu = request.getParameter("beizhu");
		String fangwujiegou = request.getParameter("fangwujiegou");
		String menpaihao = request.getParameter("menpaihao");
		String shebei = request.getParameter("shebei");
		String mianji = request.getParameter("mianji");
		String zhuzhi = request.getParameter("zhuzhi");
		String salestate = request.getParameter("salestate");
		String price = request.getParameter("price");
		String id=request.getParameter("id");
		String sql="update t_huiyi set beizhu=?,fangwujiegou=?,menpaihao=?,shebei=?,mianji=?,zhuzhi=?,salestate=?,price=? where id=?";
		Object[] params={beizhu,fangwujiegou,menpaihao,shebei,mianji,zhuzhi,salestate,price,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		request.setAttribute("message", "修改成功");
		request.setAttribute("path", "huiyi?type=huiyiMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, request, res);   
       
	}
	
	
	public void huiyiDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_huiyi where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "huiyi?type=huiyiMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void huiyiMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List huiyiList=new ArrayList();
		String sql="select * from t_huiyi";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Huiyishi huiyi=new Huiyishi();
				
				huiyi.setId(rs.getInt("id"));
				huiyi.setBeizhu(rs.getString("beizhu"));
				huiyi.setFangwujiegou(rs.getString("fangwujiegou"));
				huiyi.setMenpaihao(rs.getString("menpaihao"));
				huiyi.setMianji(rs.getString("mianji"));
				huiyi.setShebei(rs.getString("shebei"));
				huiyi.setZhuzhi(rs.getString("zhuzhi"));
				huiyi.setSalestate(rs.getString("salestate"));
				huiyi.setPrice(rs.getString("price"));
				huiyiList.add(huiyi);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("huiyiList", huiyiList);
		req.getRequestDispatcher("admin/huiyi/huiyiMana.jsp").forward(req, res);
	}
	
	public void huiyiUpdate1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Huiyishi huiyi=new Huiyishi();
		
		String sql="select * from t_huiyi where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			huiyi.setId(rs.getInt("id"));
			huiyi.setBeizhu(rs.getString("beizhu"));
			huiyi.setFangwujiegou(rs.getString("fangwujiegou"));
			huiyi.setMenpaihao(rs.getString("menpaihao"));
			huiyi.setMianji(rs.getString("mianji"));
			huiyi.setShebei(rs.getString("shebei"));
			huiyi.setZhuzhi(rs.getString("zhuzhi"));
			huiyi.setSalestate(rs.getString("salestate"));
			huiyi.setPrice(rs.getString("price"));
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("bean", huiyi);
		req.getRequestDispatcher("admin/huiyi/huiyiUpdate.jsp").forward(req, res);
	}
	
	public void huiyiDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Huiyishi huiyi=new Huiyishi();
		
		String sql="select * from t_huiyi where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			huiyi.setId(rs.getInt("id"));
			huiyi.setBeizhu(rs.getString("beizhu"));
			huiyi.setFangwujiegou(rs.getString("fangwujiegou"));
			huiyi.setMenpaihao(rs.getString("menpaihao"));
			huiyi.setMianji(rs.getString("mianji"));
			huiyi.setShebei(rs.getString("shebei"));
			huiyi.setZhuzhi(rs.getString("zhuzhi"));
			huiyi.setSalestate(rs.getString("salestate"));
			huiyi.setPrice(rs.getString("price"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("bean", huiyi);
		req.getRequestDispatcher("admin/huiyi/huiyiDetail.jsp").forward(req, res);
	}
	
	public void huiyiAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List huiyiList=new ArrayList();
		String sql="select * from t_huiyi";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Huiyishi huiyi=new Huiyishi();
				
				huiyi.setId(rs.getInt("id"));
				huiyi.setBeizhu(rs.getString("beizhu"));
				huiyi.setFangwujiegou(rs.getString("fangwujiegou"));
				huiyi.setMenpaihao(rs.getString("menpaihao"));
				huiyi.setMianji(rs.getString("mianji"));
				huiyi.setShebei(rs.getString("shebei"));
				huiyi.setZhuzhi(rs.getString("zhuzhi"));
				huiyi.setSalestate(rs.getString("salestate"));
				huiyi.setPrice(rs.getString("price"));
				
				huiyiList.add(huiyi);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("huiyiList", huiyiList);
		req.getRequestDispatcher("admin/huiyi/huiyiAll.jsp").forward(req, res);
	}
	
	
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
