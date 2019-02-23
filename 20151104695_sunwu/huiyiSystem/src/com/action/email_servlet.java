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
import com.orm.Caogaoxiang;
import com.orm.Fajianxiang;
import com.orm.Shoujianxiang;
import com.orm.TAdmin;
import com.orm.Tgonggao;
import com.orm.Yuangong;
import com.service.liuService;

public class email_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.equals("fajianxiangAdd"))
		{
			fajianxiangAdd(req, res);
		}
		
		
		
		
		
		if(type.equals("fajianxiangMana"))
		{
			fajianxiangMana(req, res);
		}
		if(type.equals("fajianxiangDel"))
		{
			fajianxiangDel(req, res);
		}
		if(type.equals("fajianxiangDetail"))
		{
			fajianxiangDetail(req, res);
		}
		
		
		
		
		
		
		
		if(type.equals("shoujianxiangMana"))
		{
			shoujianxiangMana(req, res);
		}
		if(type.equals("shoujianxiangDel"))
		{
			shoujianxiangDel(req, res);
		}
		if(type.equals("shoujianxiangDetail"))
		{
			shoujianxiangDetail(req, res);
		}
		
		
		
		
		
		if(type.equals("caogaoxiangAdd"))
		{
			caogaoxiangAdd(req, res);
		}
		if(type.equals("caogaoxiangMana"))
		{
			caogaoxiangMana(req, res);
		}
		if(type.equals("caogaoxiangDel"))
		{
			caogaoxiangDel(req, res);
		}
		if(type.equals("caogaoxiangDetail"))
		{
			caogaoxiangDetail(req, res);
		}
		if(type.equals("fromcaogaoxiangfajianxiangAdd"))
		{
			fromcaogaoxiangfajianxiangAdd(req, res);
		}
		
	}
	
	
	public void fajianxiangAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String fujian=req.getParameter("fujian");
		String fujianYuanshiming=req.getParameter("fujianYuanshiming");
		String shijian=new Date().toLocaleString();
		
		int to_yuangong_id=Integer.parseInt(req.getParameter("to_yuangong_id"));
		int from_yuangong_id=Integer.parseInt(req.getParameter("from_yuangong_id"));
		
		liuService.save_fajianxiang(title, content, fujian, fujianYuanshiming, shijian, from_yuangong_id, to_yuangong_id);
		liuService.save_shoujianxiang(title, content, fujian, fujianYuanshiming, shijian, from_yuangong_id, to_yuangong_id);
		
		
		req.setAttribute("msg", "文件发送成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void fajianxiangMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Yuangong yuangong=(Yuangong)session.getAttribute("yuangong");
		
		List fajianxiangList=new ArrayList();
		String sql="select * from t_fajianxiang where from_yuangong_id=?";
		Object[] params={yuangong.getId()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Fajianxiang fajianxiang=new Fajianxiang();
				
				fajianxiang.setId(rs.getInt("id"));
				fajianxiang.setTitle(rs.getString("title"));
				fajianxiang.setContent(rs.getString("content"));
				fajianxiang.setFujian(rs.getString("fujian"));
				fajianxiang.setFujianYuanshiming(rs.getString("fujianYuanshiming"));
				fajianxiang.setShijian(rs.getString("shijian"));
				fajianxiang.setFrom_yuangong_id(rs.getInt("from_yuangong_id"));
				fajianxiang.setTo_yuangong_id(rs.getInt("to_yuangong_id"));
				
				fajianxiang.setFromYuangong(liuService.getYuangong(rs.getInt("from_yuangong_id")));
				fajianxiang.setToYuangong(liuService.getYuangong(rs.getInt("to_yuangong_id")));
				
				fajianxiangList.add(fajianxiang);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("fajianxiangList", fajianxiangList);
		req.getRequestDispatcher("admin/email/fajianxiangMana.jsp").forward(req, res);
	}
	
	public void fajianxiangDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_fajianxiang where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "删除成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
		
	}
	
	public void fajianxiangDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Fajianxiang fajianxiang=new Fajianxiang();
		
		String sql="select * from t_fajianxiang where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			fajianxiang.setId(rs.getInt("id"));
			fajianxiang.setTitle(rs.getString("title"));
			fajianxiang.setContent(rs.getString("content"));
			fajianxiang.setFujian(rs.getString("fujian"));
			fajianxiang.setFujianYuanshiming(rs.getString("fujianYuanshiming"));
			fajianxiang.setShijian(rs.getString("shijian"));
			fajianxiang.setFrom_yuangong_id(rs.getInt("from_yuangong_id"));
			fajianxiang.setTo_yuangong_id(rs.getInt("to_yuangong_id"));
			
			fajianxiang.setFromYuangong(liuService.getYuangong(rs.getInt("from_yuangong_id")));
			fajianxiang.setToYuangong(liuService.getYuangong(rs.getInt("to_yuangong_id")));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("fajianxiang", fajianxiang);
		req.getRequestDispatcher("admin/email/fajianxiangDetail.jsp").forward(req, res);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public void shoujianxiangMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Yuangong yuangong=(Yuangong)session.getAttribute("yuangong");
		
		List shoujianxiangList=new ArrayList();
		String sql="select * from t_shoujianxiang where to_yuangong_id=?";
		Object[] params={yuangong.getId()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Shoujianxiang shoujianxiang=new Shoujianxiang();
				
				shoujianxiang.setId(rs.getInt("id"));
				shoujianxiang.setTitle(rs.getString("title"));
				shoujianxiang.setContent(rs.getString("content"));
				shoujianxiang.setFujian(rs.getString("fujian"));
				shoujianxiang.setFujianYuanshiming(rs.getString("fujianYuanshiming"));
				shoujianxiang.setShijian(rs.getString("shijian"));
				shoujianxiang.setFrom_yuangong_id(rs.getInt("from_yuangong_id"));
				shoujianxiang.setTo_yuangong_id(rs.getInt("to_yuangong_id"));
				
				shoujianxiang.setFromYuangong(liuService.getYuangong(rs.getInt("from_yuangong_id")));
				shoujianxiang.setToYuangong(liuService.getYuangong(rs.getInt("to_yuangong_id")));
				
				shoujianxiangList.add(shoujianxiang);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("shoujianxiangList", shoujianxiangList);
		req.getRequestDispatcher("admin/email/shoujianxiangMana.jsp").forward(req, res);
	}
	
	public void shoujianxiangDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_shoujianxiang where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "删除成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
		
	}
	
	public void shoujianxiangDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Shoujianxiang shoujianxiang=new Shoujianxiang();
		
		String sql="select * from t_shoujianxiang where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			shoujianxiang.setId(rs.getInt("id"));
			shoujianxiang.setTitle(rs.getString("title"));
			shoujianxiang.setContent(rs.getString("content"));
			shoujianxiang.setFujian(rs.getString("fujian"));
			shoujianxiang.setFujianYuanshiming(rs.getString("fujianYuanshiming"));
			shoujianxiang.setShijian(rs.getString("shijian"));
			shoujianxiang.setFrom_yuangong_id(rs.getInt("from_yuangong_id"));
			shoujianxiang.setTo_yuangong_id(rs.getInt("to_yuangong_id"));
			
			shoujianxiang.setFromYuangong(liuService.getYuangong(rs.getInt("from_yuangong_id")));
			shoujianxiang.setToYuangong(liuService.getYuangong(rs.getInt("to_yuangong_id")));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("shoujianxiang", shoujianxiang);
		req.getRequestDispatcher("admin/email/shoujianxiangDetail.jsp").forward(req, res);
	}
	
	
	
	
	
	
	
	
	
	
	
	public void caogaoxiangAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String fujian=req.getParameter("fujian");
		String fujianYuanshiming=req.getParameter("fujianYuanshiming");
		String shijian=new Date().toLocaleString();
		
		int to_yuangong_id=Integer.parseInt(req.getParameter("to_yuangong_id"));
		int from_yuangong_id=Integer.parseInt(req.getParameter("from_yuangong_id"));
		
		liuService.save_caogaoxiang(title, content, fujian, fujianYuanshiming, shijian, from_yuangong_id, to_yuangong_id);
		
		
		req.setAttribute("msg", "文件成功保存到草稿箱");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void caogaoxiangMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Yuangong yuangong=(Yuangong)session.getAttribute("yuangong");
		
		List caogaoxiangList=new ArrayList();
		String sql="select * from t_caogaoxiang where from_yuangong_id=?";
		Object[] params={yuangong.getId()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Caogaoxiang caogaoxiang=new Caogaoxiang();
				
				caogaoxiang.setId(rs.getInt("id"));
				caogaoxiang.setTitle(rs.getString("title"));
				caogaoxiang.setContent(rs.getString("content"));
				caogaoxiang.setFujian(rs.getString("fujian"));
				caogaoxiang.setFujianYuanshiming(rs.getString("fujianYuanshiming"));
				caogaoxiang.setShijian(rs.getString("shijian"));
				caogaoxiang.setFrom_yuangong_id(rs.getInt("from_yuangong_id"));
				caogaoxiang.setTo_yuangong_id(rs.getInt("to_yuangong_id"));
				
				caogaoxiang.setFromYuangong(liuService.getYuangong(rs.getInt("from_yuangong_id")));
				caogaoxiang.setToYuangong(liuService.getYuangong(rs.getInt("to_yuangong_id")));
				
				caogaoxiangList.add(caogaoxiang);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("caogaoxiangList", caogaoxiangList);
		req.getRequestDispatcher("admin/email/caogaoxiangMana.jsp").forward(req, res);
	}
	
	public void caogaoxiangDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_caogaoxiang where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "删除成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
		
	}
	
	public void caogaoxiangDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Caogaoxiang caogaoxiang=new Caogaoxiang();
		
		String sql="select * from t_caogaoxiang where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			caogaoxiang.setId(rs.getInt("id"));
			caogaoxiang.setTitle(rs.getString("title"));
			caogaoxiang.setContent(rs.getString("content"));
			caogaoxiang.setFujian(rs.getString("fujian"));
			caogaoxiang.setFujianYuanshiming(rs.getString("fujianYuanshiming"));
			caogaoxiang.setShijian(rs.getString("shijian"));
			caogaoxiang.setFrom_yuangong_id(rs.getInt("from_yuangong_id"));
			caogaoxiang.setTo_yuangong_id(rs.getInt("to_yuangong_id"));
			
			caogaoxiang.setFromYuangong(liuService.getYuangong(rs.getInt("from_yuangong_id")));
			caogaoxiang.setToYuangong(liuService.getYuangong(rs.getInt("to_yuangong_id")));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("caogaoxiang", caogaoxiang);
		req.getRequestDispatcher("admin/email/caogaoxiangDetail.jsp").forward(req, res);
	}
	
	public void fromcaogaoxiangfajianxiangAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String fujian=req.getParameter("fujian");
		String fujianYuanshiming=req.getParameter("fujianYuanshiming");
		String shijian=new Date().toLocaleString();
		
		int to_yuangong_id=Integer.parseInt(req.getParameter("to_yuangong_id"));
		int from_yuangong_id=Integer.parseInt(req.getParameter("from_yuangong_id"));
		
		liuService.save_fajianxiang(title, content, fujian, fujianYuanshiming, shijian, from_yuangong_id, to_yuangong_id);
		liuService.save_shoujianxiang(title, content, fujian, fujianYuanshiming, shijian, from_yuangong_id, to_yuangong_id);
		liuService.deletecaogaoxiang(req.getParameter("id"));
		
		req.setAttribute("msg", "文件发送成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
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
