package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.entity.User;

public class UpdateServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //将编码改为utf-8
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		int userId = Integer.parseInt(id);
		
		String name = request.getParameter("name");
		String worknumber = request.getParameter("worknumber");
		String sex = request.getParameter("sex");

		String home = request.getParameter("home");
		String gangwei = request.getParameter("gangwei");
		String info = request.getParameter("info");
		
		
		UserDao ud = new UserDaoImpl();
		
		if(ud.update(userId, name, worknumber, sex, home, gangwei, info)){
			request.setAttribute("xiaoxi", "更新成功");
			request.getRequestDispatcher("/Searchall").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}

