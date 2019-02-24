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
import javax.servlet.http.HttpSession;

import com.dao.DB;
import com.orm.Huiyishi;
import com.orm.Shiyong;
import com.orm.TAdmin;
import com.orm.Twenjian;
import com.orm.Yuangong;
import com.service.liuService;

public class shiyong_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        if(type.endsWith("shiyongAddto"))
		{
        	shiyongAddto(req, res);
		}
		if(type.endsWith("shiyongAdd"))
		{
			shiyongAdd(req, res);
		}
		if(type.endsWith("shiyongMana"))
		{
			shiyongMana(req, res);
		}
		if(type.endsWith("shiyongDel"))
		{
			shiyongDel(req, res);
		}
		if(type.endsWith("shiyongDetail"))
		{
			shiyongDetail(req, res);
		}
		
		if(type.endsWith("shiyongAll"))
		{
			shiyongAll(req, res);
		}
		if(type.endsWith("shiyongUpdate"))
		{
			shiyongUpdate(req, res);
		}
		if(type.endsWith("shiyongUpdate1"))
		{
			shiyongUpdate1(req, res);
		}
		if(type.endsWith("shiyongUpdate2"))
		{
			shiyongUpdate2(req, res);
		}
	}
	
	public void shiyongAddto(HttpServletRequest request,HttpServletResponse res) throws ServletException, IOException
	{
		List list2=new ArrayList();
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
				list2.add(huiyi);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		request.setAttribute("list2",list2);
		request.getRequestDispatcher("admin/shiyong/shiyongAdd.jsp").forward(request, res);
		
		
	}
	public void shiyongAdd(HttpServletRequest request,HttpServletResponse res)
	{
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String cailiao = request.getParameter("cailiao");
	
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String chulijieguo="未处理";
		
		HttpSession session=request.getSession();
		Yuangong yuangong=(Yuangong)session.getAttribute("yuangong");
		String lingliaoren = yuangong.getName();
		
		String sql="insert into t_shiyong(content,title,cailiao,lingliaoren,startdate,enddate,chulijieguo) values(?,?,?,?,?,?,?)";
		Object[] params={content,title,cailiao,lingliaoren,startdate,enddate,chulijieguo};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		request.setAttribute("message", "发布成功");
		request.setAttribute("path", "shiyong?type=shiyongAll");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, request, res);
        
	}
	
	public void shiyongUpdate(HttpServletRequest request,HttpServletResponse res)
	{
		String id=request.getParameter("id");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String cailiao = request.getParameter("cailiao");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		
		String sql="update t_shiyong set content=?,title=?,cailiao=?,startdate=?,enddate=? where id=?";
		Object[] params={content,title,cailiao,startdate,enddate,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		request.setAttribute("message", "修改成功");
		request.setAttribute("path", "shiyong?type=shiyongAll");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, request, res);   
       
	}
	
	
	public void shiyongUpdate2(HttpServletRequest request,HttpServletResponse res)
	{
		String id=request.getParameter("id");
		
		
		String chulijieguo = request.getParameter("chulijieguo");
		String chulifankui = request.getParameter("chulifankui");
		
		String sql="update t_shiyong set chulijieguo=?,chulifankui=? where id=?";
		Object[] params={chulijieguo,chulifankui,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		request.setAttribute("message", "审批成功");
		request.setAttribute("path", "shiyong?type=shiyongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, request, res);   
       
	}
	
	public void shiyongDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_shiyong where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "shiyong?type=shiyongAll");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void shiyongMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List shiyongList=new ArrayList();
		String sql="select * from t_shiyong";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Shiyong bean=new Shiyong();
				
				bean.setId(rs.getInt("id"));
				bean.setContent(rs.getString("content"));
				bean.setTitle(rs.getString("title"));
				bean.setCailiao(rs.getString("cailiao"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
				bean.setLingliaoren(rs.getString("lingliaoren"));
				bean.setChulijieguo(rs.getString("chulijieguo"));
				
				shiyongList.add(bean);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("shiyongList", shiyongList);
		req.getRequestDispatcher("admin/shiyong/shiyongMana.jsp").forward(req, res);
	}
	
	public void shiyongUpdate1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Shiyong bean=new Shiyong();
		
		String sql="select * from t_shiyong where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			bean.setId(rs.getInt("id"));
			bean.setContent(rs.getString("content"));
			bean.setTitle(rs.getString("title"));
			bean.setCailiao(rs.getString("cailiao"));
			bean.setStartdate(rs.getString("startdate"));
			bean.setEnddate(rs.getString("enddate"));
			bean.setLingliaoren(rs.getString("lingliaoren"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		List list2=new ArrayList();
		String sql1="select * from t_huiyi";
		Object[] params1={};
		
		try
		{
			mydb.doPstm(sql1, params1);
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
				list2.add(huiyi);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("list2",list2);
		
		
		mydb.closed();
		
		req.setAttribute("bean", bean);
		req.getRequestDispatcher("admin/shiyong/shiyongUpdate.jsp").forward(req, res);
	}
	
	public void shiyongDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Shiyong bean=new Shiyong();
		
		String sql="select * from t_shiyong where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			bean.setId(rs.getInt("id"));
			bean.setContent(rs.getString("content"));
			bean.setTitle(rs.getString("title"));
			bean.setCailiao(rs.getString("cailiao"));
			bean.setStartdate(rs.getString("startdate"));
			bean.setEnddate(rs.getString("enddate"));
			bean.setLingliaoren(rs.getString("lingliaoren"));
			bean.setChulijieguo(rs.getString("chulijieguo"));
			
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("bean", bean);
		req.getRequestDispatcher("admin/shiyong/shiyongDetail.jsp").forward(req, res);
	}
	
	public void shiyongAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Yuangong yuangong=(Yuangong)session.getAttribute("yuangong");
		String lingliaoren = yuangong.getName();
		List shiyongList=new ArrayList();
		String sql="select * from t_shiyong where  lingliaoren=?";
		Object[] params={lingliaoren};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Shiyong bean=new Shiyong();
				
				bean.setId(rs.getInt("id"));
				bean.setContent(rs.getString("content"));
				bean.setTitle(rs.getString("title"));
				bean.setCailiao(rs.getString("cailiao"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
				bean.setLingliaoren(rs.getString("lingliaoren"));
				bean.setChulijieguo(rs.getString("chulijieguo"));
				
				
				shiyongList.add(bean);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("shiyongList", shiyongList);
		req.getRequestDispatcher("admin/shiyong/shiyongAll.jsp").forward(req, res);
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
