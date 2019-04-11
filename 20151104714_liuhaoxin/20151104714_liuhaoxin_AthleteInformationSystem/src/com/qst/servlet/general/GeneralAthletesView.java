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
		//记录sid
		HttpSession session = request.getSession();
		session.setAttribute("generalsid",sid);
		
		
		GeneralQueryDao rgdao = new GeneralQueryDao();
		
		//返回一届运动会的所有运动员信息
		ArrayList<AthletBean> abean = new ArrayList<AthletBean>();
		abean = (ArrayList<AthletBean>)rgdao.athletList(sid);
		request.setAttribute("mea", abean);
		
		//返回一届运动会的所有项目信息
		ArrayList<AthletBean> abe = new ArrayList<AthletBean>();
		abe = (ArrayList<AthletBean>)rgdao.eventsList(sid);
		request.setAttribute("abe", abe);
		
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
