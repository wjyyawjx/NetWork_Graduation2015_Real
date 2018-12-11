package com.qst.admin.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.UserBean;
import com.qst.dao.AdminDao;

/**
 * Servlet implementation class UserQuery
 */
@WebServlet("/UserQuery")
public class UserQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//用于管理员根据用户名查询用户信息和查询各个权限的用户
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		String username="";
		
		username= request.getParameter("username");
		String permission = request.getParameter("type");
		
		ArrayList<UserBean> userdata = new ArrayList<UserBean>();
		AdminDao userdao = new AdminDao();
		
		
		if(username.equals("") && permission.equals("3")) {
			userdata = (ArrayList<UserBean>)userdao.userList();
		}
		else if(username.equals("") && permission.equals("1")) {
			userdata = (ArrayList<UserBean>)userdao.usertypeList(permission);
		}else if(username.equals("") && permission.equals("0")) {
			userdata = (ArrayList<UserBean>)userdao.usertypeList(permission);
		}else if(username !="" && permission.equals("3")) {
			userdata = (ArrayList<UserBean>)userdao.userList(username);
		}
		else if(username !="" && permission.equals("1") || permission.equals("0")) {
			userdata = (ArrayList<UserBean>)userdao.userList(username,permission);
		}
		
		request.setAttribute("userdata", userdata);
		request.getRequestDispatcher("admin-user.jsp").forward(request, response);


	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
