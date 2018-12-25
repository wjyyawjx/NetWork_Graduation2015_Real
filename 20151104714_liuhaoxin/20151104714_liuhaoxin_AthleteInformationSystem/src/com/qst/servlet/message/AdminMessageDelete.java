package com.qst.servlet.message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.dao.MessageDao;

/**
 * Servlet implementation class AdminMessageDelete
 */
@WebServlet("/AdminMessageDelete")
public class AdminMessageDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMessageDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 管理员删除留言
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		int mid =Integer.parseInt(request.getParameter("mid"));
	
		MessageDao mesdao = new MessageDao();
		mesdao.MessageDelete(mid);
		response.sendRedirect("AdminMessageView");	
		
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
