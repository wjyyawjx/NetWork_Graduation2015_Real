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
 * Servlet implementation class RecorderJView
 */
@WebServlet("/RecorderJView")
public class RecorderJView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecorderJView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//记录员查看运动员信息
		HttpSession session = request.getSession();
		int tsid = (int) session.getAttribute("sid");
		RecorderGameDao rgdao = new RecorderGameDao();
		ArrayList<AthletBean> abean = new ArrayList<AthletBean>();
		abean = (ArrayList<AthletBean>)rgdao.athletList(tsid);
		request.setAttribute("mea", abean);
		request.getRequestDispatcher("recorder-jsp/athlet.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
