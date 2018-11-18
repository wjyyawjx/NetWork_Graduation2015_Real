package com.qst.servlet.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.contactmanagementBean;
import com.qst.dao.UserDao;

/**
 * Servlet implementation class ContactManagementView
 */
@WebServlet("/ContactManagementView")
public class ContactManagementView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactManagementView() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 显示所有的申请信息
		ArrayList<contactmanagementBean> userdata = new ArrayList<contactmanagementBean>();
		UserDao userdao = new UserDao();
		userdata = (ArrayList<contactmanagementBean>) userdao.ContactManagementView();
		request.setAttribute("userdata", userdata);
		request.getRequestDispatcher("admin-ContactManagement-view.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
