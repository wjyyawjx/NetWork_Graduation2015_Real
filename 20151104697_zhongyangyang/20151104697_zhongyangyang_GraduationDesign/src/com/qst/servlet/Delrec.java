package com.qst.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.RecommendBean;
import com.qst.service.RecommendService;
import com.qst.service.RecommendServiceimp;

/**
 * Servlet implementation class Delrec
 */
@WebServlet("/Delrec")
public class Delrec extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public Delrec() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecommendService recommendService= new RecommendServiceimp();
		
		int comid= Integer.parseInt(request.getParameter("comid"));
		System.out.println(comid);
		RecommendBean rec= new RecommendBean();
		rec.setComid(comid);
		
		recommendService.delRecommend(rec);
		System.out.println(rec);
		response.sendRedirect("html/recList.jsp");

	}

}
