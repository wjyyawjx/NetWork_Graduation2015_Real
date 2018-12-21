package com.qst.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.qst.bean.studentloginbean;
import com.qst.dao.studentlogindao;

/**
 * Servlet implementation class student_login
 */
@WebServlet("/student_login")
public class student_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public student_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				response.setContentType("text/html;charset=utf-8");
				// 从jsp页面读取用户名密码  括号里的名字需要和jsp页面的name属性一样（jsp中：name=username）
				String usernum = request.getParameter("student_num");
				String pwd = request.getParameter("student_password");
				
				
				System.err.println(usernum+pwd);
				//UserBean实例化一个对象，对象名（glybean）
				studentloginbean studentloginbean = new studentloginbean();
				
				//传值给glybean对象
				studentloginbean.setStudent_num(usernum);
				studentloginbean.setStudent_password(pwd);

				
				//UserDao实例化一个对象，对象名（glydao）
				studentlogindao userdao = new studentlogindao();
				
				//UserBean实例化一个对象，对象名（user）
				//并将userdao对象调用的login方法的返回值赋值给user
				studentloginbean user = studentlogindao.login(studentloginbean);
				
				
					if (user != null) {//判断用户名密码是否存在
						//成功则跳转index.jsp页面，失败返回Login.jsp
						
					
						//调用session的setAttribute方法，
			
					
						//重定向
						response.sendRedirect("student_index.jsp");
					
						}
					else {
						
						//页面弹框，提示错误，可以不用。
						JOptionPane.showMessageDialog(null, "学号或密码错误", null, JOptionPane.ERROR_MESSAGE);
						//重定向
						response.sendRedirect("student_login.jsp");
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
