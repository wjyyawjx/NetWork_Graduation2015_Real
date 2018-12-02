package com.qst.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.qst.bean.teacherloginbean;
import com.qst.dao.teacherlogindao;

/**
 * Servlet implementation class teacher_login
 */
@WebServlet("/teacher_login")
public class teacher_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public teacher_login() {
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
		String username = request.getParameter("teacher_name");
		String pwd = request.getParameter("teacher_password");
		
		//UserBean实例化一个对象，对象名（userbean）
		teacherloginbean teacherloginbean = new teacherloginbean();
		
		//传值给teacherloginbean对象
		teacherloginbean.setTeacher_name(username);
		teacherloginbean.setTeacher_password(pwd);
		
		
		//UserDao实例化一个对象，对象名（userdao）
		teacherlogindao teacherlogindao = new teacherlogindao();
		
		//UserBean实例化一个对象，对象名（user）
		//并将userdao对象调用的login方法的返回值赋值给user
		teacherloginbean user = teacherlogindao.login(teacherloginbean);
		
		
			if (user != null) {//判断用户名密码是否存在
				//成功则跳转index.jsp页面，失败返回Login.jsp
				
				//HttpSession实例化一个对象，对象名（session）
				HttpSession session = request.getSession(); 
				//调用session的setAttribute方法，
				//将username的值赋值给key，在jsp页面中可以取出。
				session.setAttribute("key",username);
				
				//重定向
				response.sendRedirect("teacher_index.jsp");
			
				}
			else {
				
				//页面弹框，提示错误，可以不用。
				JOptionPane.showMessageDialog(null, "用户名或密码错误", null, JOptionPane.ERROR_MESSAGE);
				//重定向
				response.sendRedirect("teacher_login.jsp");
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
