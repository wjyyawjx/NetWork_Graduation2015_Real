package com.qst.servlet.toapplyfor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qst.dao.AdminDao;
import com.qst.dao.GeneralDao;

/**
 * Servlet implementation class PermissionUpload
 */
@WebServlet("/PermissionUpload3")
public class PermissionUpload3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PermissionUpload3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//修改用户的权限,用于拒绝通过用户的申请
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		String liyou ="已审核，未通过，理由如下："+request.getParameter("liyou");
		int aid =Integer.parseInt(request.getParameter("aid"));
		GeneralDao geldao = new GeneralDao();
		geldao.permissionupload(liyou,aid);
		
		response.sendRedirect("AdminToApplyForView");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
