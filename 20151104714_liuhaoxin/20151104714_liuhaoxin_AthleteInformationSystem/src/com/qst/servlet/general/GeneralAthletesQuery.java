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
		String eventss = request.getParameter("events");
		String theclassa = request.getParameter("theclass");
		String college = request.getParameter("college");
		String username = request.getParameter("username");
		String sql = "select * from athlet where tsid="+sid+" ";
		
		if (!eventss.equals("所有项目")) {
		sql=sql+"and events='"+eventss+"'";

		}
		if (!theclassa.equals("所有班级")) {
			sql=sql+"and theclass='"+theclassa+"'";
		}
		if (!college.equals("所有学院")) {
			sql=sql+"and college='"+college+"'";
		}
		if (!username.equals("null")  || !username.equals("null") ) {
			sql=sql+"and athletusername like '%"+username+"%'";
		}
		
		
		GeneralQueryDao rgdao = new GeneralQueryDao();
		ArrayList<AthletBean> abean = new ArrayList<AthletBean>();
		abean = (ArrayList<AthletBean>) rgdao.athletclassifyList(sql);
		request.setAttribute("mea", abean);
		
		FormationReturn ret = new FormationReturn();
		ret.doPost(request, response);

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
