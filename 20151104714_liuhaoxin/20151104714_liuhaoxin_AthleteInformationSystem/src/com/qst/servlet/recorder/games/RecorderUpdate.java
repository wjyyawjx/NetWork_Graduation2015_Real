package com.qst.servlet.recorder.games;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qst.dao.RecorderGameDao;

/**
 * Servlet implementation class RecorderUpdate
 */
@WebServlet("/RecorderUpdate")
public class RecorderUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecorderUpdate() {
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
		String athletusername = request.getParameter("athletusername");
		String ranking = request.getParameter("ranking");
		String results = request.getParameter("results");
		String events = request.getParameter("events");
		String theclass = request.getParameter("theclass");
		RecorderGameDao redao = new RecorderGameDao();
		redao.recorderUpdate(tid,athletusername,ranking,results,events,theclass);
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
