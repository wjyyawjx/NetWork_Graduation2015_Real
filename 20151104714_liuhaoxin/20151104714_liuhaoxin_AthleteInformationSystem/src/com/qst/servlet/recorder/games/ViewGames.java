package com.qst.servlet.recorder.games;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qst.bean.GameBean;
import com.qst.bean.UserBean;
import com.qst.dao.GameDao;
import com.qst.dao.RecorderGameDao;

/**
 * Servlet implementation class ViewGames
 */
@WebServlet("/ViewGames")
public class ViewGames extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewGames() {
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
		// 记录员查看自己可以管理运动会
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("user");
		System.err.println(username);
		ArrayList<GameBean> gambean = new ArrayList<GameBean>();
		RecorderGameDao rgdao = new RecorderGameDao();
		gambean = (ArrayList<GameBean>) rgdao.recordergameList(username);
		request.setAttribute("gambean", gambean);
		request.getRequestDispatcher("recorder-games.jsp").forward(request, response);
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
