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
 * Servlet implementation class FormationReturn
 */
@WebServlet("/FormationReturn")
public class FormationReturn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormationReturn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//返回信息
		
		GeneralQueryDao rgdao = new GeneralQueryDao();
		HttpSession session = request.getSession();
		int sid = (int) session.getAttribute("generalsid");
		
		//返回一届运动会的所有项目信息
		ArrayList<AthletBean> events = new ArrayList<AthletBean>();
		events = (ArrayList<AthletBean>)rgdao.eventsList(sid);
		request.setAttribute("events", events);
		
		//返回一届运动会的所有学院信息
		ArrayList<AthletBean> college = new ArrayList<AthletBean>();
		college = (ArrayList<AthletBean>)rgdao.collegeList(sid);
		request.setAttribute("college", college);

		//返回一届运动会的所有班级信息
		ArrayList<AthletBean> theclass = new ArrayList<AthletBean>();
		theclass = (ArrayList<AthletBean>)rgdao.theclassList(sid);
		request.setAttribute("theclass", theclass);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
