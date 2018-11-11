package com.qst.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.qst.dao.UserDao;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//注册
		String username = request.getParameter("username");
		System.err.println(username);
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		UserDao dao = new UserDao();
		boolean flag = dao.query(username);
		if(flag){
			
			JOptionPane.showMessageDialog(null, "用户名已被注册，请重新注册", null, JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("Register.jsp");
		}
		else{
			
			
			//JOptionPane.showMessageDialog(null, "注册成功！", null, JOptionPane.ERROR_MESSAGE);
			dao.save(username,pwd,email,phone);
			response.sendRedirect("Login.jsp");
			
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
