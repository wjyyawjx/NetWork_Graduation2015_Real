package com.qst.servlet.recorder.games;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.AthletBean;
import com.qst.dao.RecorderGameDao;

/**
 * Servlet implementation class RecorderUpdateJump
 */
@WebServlet("/RecorderUpdateJump")
public class RecorderUpdateJump extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecorderUpdateJump() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//记录员修改运动员信息
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		int tid = Integer.parseInt( request.getParameter("tid"));
		
		AthletBean abe = new AthletBean();
		RecorderGameDao edao = new RecorderGameDao();
		abe=edao.recorderUpdate(tid);
		request.setAttribute("w", abe);
		request.getRequestDispatcher("recorder-jsp/recorder-athletupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
