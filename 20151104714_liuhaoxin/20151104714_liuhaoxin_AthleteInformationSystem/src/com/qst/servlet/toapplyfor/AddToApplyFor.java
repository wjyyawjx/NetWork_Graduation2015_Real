package com.qst.servlet.toapplyfor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.dao.GeneralDao;


/**
 * Servlet implementation class AddToApplyFor
 */
@WebServlet("/AddToApplyFor")
public class AddToApplyFor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToApplyFor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		//用户申请成为记录员
		String reason = request.getParameter("reason");
		String username = request.getParameter("username");
		if(username.equals("null")) {
			response.sendRedirect("Login.jsp");	
		}else {
			
		
		GeneralDao galdao = new GeneralDao();
		galdao.ToApplyFor(reason,username);
		response.sendRedirect("ToApplyForView");	
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
