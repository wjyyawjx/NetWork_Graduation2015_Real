package com.qst.servlet.general;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.GameBean;
import com.qst.dao.GeneralQueryDao;

/**
 * Servlet implementation class GeneralGameView
 */
@WebServlet("/GeneralGameView")
public class GeneralGameView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneralGameView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//一般用户查看所有的运动会信息
		ArrayList<GameBean> gambean = new ArrayList<GameBean>();
		GeneralQueryDao rgdao = new GeneralQueryDao();
		gambean = (ArrayList<GameBean>) rgdao.generalgameList();
		request.setAttribute("gambean", gambean);
		request.getRequestDispatcher("general-jsp/general-view.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
