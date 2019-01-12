package com.qst.servlet.message;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.MessageBean;
import com.qst.dao.MessageDao;

/**
 * Servlet implementation class AdminMessageView
 */
@WebServlet("/AdminMessageView")
public class AdminMessageView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMessageView() {
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
		// 显示所有用户的留言  管理员查看所有的留言
		ArrayList<MessageBean> mesdata = new ArrayList<MessageBean>();
		MessageDao mesdao = new MessageDao();
		mesdata = (ArrayList<MessageBean>) mesdao.messageList();
		request.setAttribute("mes", mesdata);
		request.getRequestDispatcher("admin-jsp/message.jsp").forward(request, response);
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
