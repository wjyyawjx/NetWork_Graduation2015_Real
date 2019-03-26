package com.qst.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.LoginBean;
import com.qst.service.Loginservice;


@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		System.out.println(username);
		System.out.println(pwd);
		PrintWriter out = response.getWriter();
		Loginservice login_service = new Loginservice();
		LoginBean user = login_service.Loginvalidate(username,pwd);
		if(user!=null) {
			request.setAttribute("user", user);
			request.getRequestDispatcher("html/index.jsp").forward(request,response);
		}else{
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名或密码错误');");
			out.print("window.location='login.jsp'");
			out.print("</script>");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
