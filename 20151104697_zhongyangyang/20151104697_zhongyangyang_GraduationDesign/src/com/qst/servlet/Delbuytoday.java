package com.qst.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.BuytodayBean;
import com.qst.service.BuytodayService;
import com.qst.service.BuytodayServiceimp;
/**
 * Servlet implementation class Delbuytoday
 */
@WebServlet("/Delbuytoday")
public class Delbuytoday extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delbuytoday() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BuytodayService buytodayService= new BuytodayServiceimp();
		
		int todayid= Integer.parseInt(request.getParameter("todayid"));
		System.out.println(todayid);
		BuytodayBean buy= new BuytodayBean();
		buy.setTodayid(todayid);
		
		buytodayService.delBuytoday(buy);
		response.sendRedirect("html/buytodayList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
