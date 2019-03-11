package com.neishida.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neishida.bean.LoginBean;
import com.neishida.service.LoginService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		System.out.println(username);
		System.out.println(pwd);
		PrintWriter out = response.getWriter();
		LoginService login_service = new LoginService();
		LoginBean user = login_service.LoginValidate(username, pwd);
		if (user != null) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("pwd", pwd);
			request.setAttribute("user", user);
			//request.getRequestDispatcher("MessageListServlet").forward(request, response);
			//request.getRequestDispatcher("main.jsp").forward(request,response);
			response.sendRedirect("/students/page/stuList.jsp");
		} else {
			out.print("<script type='text/javascript'>");
			out.print("alert('”√ªß√˚√‹¬Î¥ÌŒÛ£°');");
			out.print("window.location='login.jsp';");
			out.print("</script>");
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
