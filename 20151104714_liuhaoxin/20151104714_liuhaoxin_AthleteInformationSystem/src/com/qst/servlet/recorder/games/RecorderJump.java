package com.qst.servlet.recorder.games;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qst.bean.AthletBean;
import com.qst.dao.RecorderGameDao;


/**
 * Servlet implementation class RecorderView
 */
@WebServlet("/RecorderJump")
public class RecorderJump extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecorderJump() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//用于记录员管理运动员学生信息的跳转，保存运动会id
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		int sid =Integer.parseInt(request.getParameter("sid"));
		HttpSession session = request.getSession();
		session.setAttribute("sid",sid);
		response.sendRedirect("RecorderJView");	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
