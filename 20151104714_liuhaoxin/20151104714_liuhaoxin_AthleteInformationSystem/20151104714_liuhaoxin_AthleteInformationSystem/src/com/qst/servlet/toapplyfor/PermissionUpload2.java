package com.qst.servlet.toapplyfor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qst.dao.GeneralDao;

/**
 * Servlet implementation class PermissionUpload
 */
@WebServlet("/PermissionUpload2")
public class PermissionUpload2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PermissionUpload2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//修改用户的权限,用于普通用户通过审核，成为记录员
		
		String username =request.getParameter("username");
		GeneralDao geldao = new GeneralDao();
		//修改用户权限
		geldao.permissionupload(username);
		
		//删除申请用户的所有申请
	
		geldao.ToApplyFordelete(username);
		
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
