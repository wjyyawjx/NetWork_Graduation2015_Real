package com.neishida.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neishida.service.RegisterService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		
		String user_name = request.getParameter("username");
		String user_pwd = request.getParameter("password");
		String name = request.getParameter("name");
		String meon= request.getParameter("meon");

		String sessionValidateCode = (String)request.getSession().getAttribute("SESSION_VALIDATECODE");
		String verifyCode = request.getParameter("verifyCode");
		
		PrintWriter out = response.getWriter();
		
		if(!sessionValidateCode.equals(verifyCode)){
			out.print("<script type='text/javascript'>");
			out.print("alert('Code Error');");
			out.print("window.location='register.jsp';");
			out.print("</script>");
		}else{
				RegisterService rese = new RegisterService();
				rese.informationAdd(user_name, user_pwd, name,meon );
				response.sendRedirect("index.jsp");
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
