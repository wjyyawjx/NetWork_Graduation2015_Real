package com.qst.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.LoginBean;
import com.qst.service.Loginservice;

/**
 * Servlet implementation class UserCheckServlet
 */
@WebServlet("/UserCheckServlet")
public class UserCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletResponse response;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		boolean mark=false;
		Loginservice login_service = new Loginservice();
		LoginBean user = login_service.findUsername(username);
		System.out.println(user.getUsername());
		System.out.println(username);
		if(user.getUsername().equals(username)){
			mark=true;
		}

		response.setCharacterEncoding("utf-8");
		response.setContentType("register.jsp");
		PrintWriter out=response.getWriter();
		if(mark) {
			out.println("<font color='red'>该账号已经存在，请重新输入</font>");
		}else{
			out.println("<font color='red'>可以使用</font>");
		}
		out.flush();
		out.close();
	}
}
