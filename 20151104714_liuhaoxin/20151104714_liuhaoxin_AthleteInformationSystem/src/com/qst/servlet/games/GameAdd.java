package com.qst.servlet.games;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

import com.qst.dao.GameDao;
import com.qst.dao.UserDao;

/**
 * Servlet implementation class GameAdd
 */
@WebServlet("/GameAdd")
public class GameAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		//创建新的运动会
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		String gamesname = request.getParameter("gamesname");
		String username = request.getParameter("username");
		String startTime = request.getParameter("date1");
		String stopTime = request.getParameter("date2");
		GameDao dao = new GameDao();
		dao.gameadd(username, gamesname, startTime, stopTime);
		//获取我的头像图片地址
		ImageIcon icon= new ImageIcon(request.getSession().getServletContext().getRealPath("/img/touxiang.png"));        	
		JOptionPane.showMessageDialog(null, "创建成功，在管理页面查看","成功",JOptionPane.ERROR_MESSAGE,icon); 
		response.sendRedirect("admin-jsp/newgames.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
