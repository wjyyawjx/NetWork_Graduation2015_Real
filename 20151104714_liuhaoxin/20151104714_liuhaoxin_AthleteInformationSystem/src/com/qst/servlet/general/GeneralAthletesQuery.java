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
import com.qst.dao.GeneralQueryDao;

/**
 * Servlet implementation class GeneralAthletesQuery
 */
@WebServlet("/GeneralAthletesQuery")
public class GeneralAthletesQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GeneralAthletesQuery() {
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
		// 一般用户的分类查询
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		int sid = (int) session.getAttribute("generalsid");
		String events = request.getParameter("events");
		GeneralQueryDao rgdao = new GeneralQueryDao();
		if (events.equals("所有信息")) {
			ArrayList<AthletBean> abean = new ArrayList<AthletBean>();
			abean = (ArrayList<AthletBean>) rgdao.athletList(sid);
			request.setAttribute("mea", abean);
		} else {
			ArrayList<AthletBean> abean = new ArrayList<AthletBean>();
			abean = (ArrayList<AthletBean>) rgdao.athletclassifyList(sid, events);
			request.setAttribute("mea", abean);
		}
		// 返回一届运动会的所有项目信息
		ArrayList<AthletBean> abe = new ArrayList<AthletBean>();
		abe = (ArrayList<AthletBean>) rgdao.eventsList(sid);
		request.setAttribute("abe", abe);

		request.getRequestDispatcher("general-jsp/general-athlet.jsp").forward(request, response);
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
