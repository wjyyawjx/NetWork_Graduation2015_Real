package com.qst.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.dao.AdminDao;

/**
 * Servlet implementation class UserPwdUpdate
 */
@WebServlet("/UserPwdUpdate")
public class UserPwdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPwdUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//管理员修改用户密码
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
	
		String pwd= request.getParameter("pwd");
		int uid=Integer.parseInt( request.getParameter("uid"));
		
		AdminDao adao = new AdminDao();
		adao.UploadPwd(uid, pwd);
		response.sendRedirect("UserView");
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
