package com.qst.servlet.information;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.qst.bean.UserBean;
import com.qst.dao.UserDao;

/**
 * Servlet implementation class InformationView
 */
@WebServlet("/InformationView")
public class InformationView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformationView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//显示自己的信息

		// 获取用户名，密码
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("user");
		String pwd = (String) session.getAttribute("pwd");
		
		//查询信息
		ArrayList<UserBean> userdata = new ArrayList<UserBean>();
		
		UserDao userdao = new UserDao();
		userdata = (ArrayList<UserBean>) userdao.userInformation(username,pwd);
		request.setAttribute("userdata", userdata);

		//查看权限
		String qx=userdao.permission(username,pwd);
		
		if(qx.equals("0")) 
		{
			//普通用户
			
			
			request.getRequestDispatcher("general-jsp/general-information.jsp").forward(request, response);
		}
		else if(qx.equals("1")) {
			//记录员用户
			
			
			request.getRequestDispatcher("recorder-jsp/information.jsp").forward(request, response);
		}
		else if(qx.equals("2")) {
			//管理员用户
			
			request.getRequestDispatcher("admin-jsp/information.jsp").forward(request, response);	
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
