package com.qst.servlet.games;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.GameBean;
import com.qst.bean.UserBean;
import com.qst.dao.AdminDao;
import com.qst.dao.GameDao;

/**
 * Servlet implementation class GameView
 */
@WebServlet("/GameView")
public class GameView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查看所有运动会
		ArrayList<GameBean> gambean = new ArrayList<GameBean>();
		GameDao gamdao = new GameDao();
		gambean = (ArrayList<GameBean>)gamdao.gameList();
		request.setAttribute("gambean", gambean);
		request.getRequestDispatcher("admin-games.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
