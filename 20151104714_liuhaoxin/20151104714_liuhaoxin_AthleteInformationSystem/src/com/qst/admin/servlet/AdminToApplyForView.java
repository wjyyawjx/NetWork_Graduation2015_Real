package com.qst.admin.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qst.bean.ToapplyforBean;
import com.qst.dao.GeneralDao;

/**
 * Servlet implementation class AddToApplyForView
 */
@WebServlet("/AdminToApplyForView")
public class AdminToApplyForView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminToApplyForView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//管理员查看所有的申请
		ArrayList<ToapplyforBean> gelbean = new ArrayList<ToapplyforBean>();
		GeneralDao geldao = new GeneralDao();
		gelbean = (ArrayList<ToapplyforBean>)geldao.ToApplyForView();
		request.setAttribute("gel", gelbean);
		request.getRequestDispatcher("admin-to-apply-for-view.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
