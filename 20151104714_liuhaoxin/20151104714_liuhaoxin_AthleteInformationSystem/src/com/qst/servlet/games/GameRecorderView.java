package com.qst.servlet.games;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.UserBean;
import com.qst.dao.GameDao;

/**
 * Servlet implementation class GameRecorderView
 */
@WebServlet("/GameRecorderView")
public class GameRecorderView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameRecorderView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//记录所有的记录员，用于管理员创建运动会
		GameDao gamdao = new GameDao();
		ArrayList<UserBean> userbean = new ArrayList<UserBean>();
		userbean = (ArrayList<UserBean>)gamdao.usernameList();
		request.setAttribute("userbean", userbean);
		request.getRequestDispatcher("admin-jsp/admin-newgames.jsp").forward(request, response);

		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
