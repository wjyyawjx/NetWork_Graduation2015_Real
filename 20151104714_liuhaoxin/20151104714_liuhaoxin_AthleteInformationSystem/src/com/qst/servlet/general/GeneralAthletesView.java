package com.qst.servlet.general;

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
 * Servlet implementation class GeneralAthletesView
 */
@WebServlet("/GeneralAthletesView")
public class GeneralAthletesView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneralAthletesView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//一般用户查看运动会中运动员的信息
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		int sid =Integer.parseInt(request.getParameter("sid"));
		HttpSession session = request.getSession();
		RecorderGameDao rgdao = new RecorderGameDao();
		ArrayList<AthletBean> abean = new ArrayList<AthletBean>();
		abean = (ArrayList<AthletBean>)rgdao.athletList(sid);
		request.setAttribute("mea", abean);
		request.getRequestDispatcher("general-jsp/general-athlet.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
