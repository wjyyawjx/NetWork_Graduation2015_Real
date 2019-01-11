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
 * Servlet implementation class RecorderAdd
 */
@WebServlet("/RecorderAdd")
public class RecorderAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecorderAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		//记录员添加运动员信息
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		int tsid = (int) session.getAttribute("sid");
		String athletusername = request.getParameter("athletusername");
		String ranking = request.getParameter("ranking");
		String results = request.getParameter("results");
		String events = request.getParameter("events");
		RecorderGameDao redao = new RecorderGameDao();
		redao.recorderAdd(tsid,athletusername,ranking,results,events);
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
