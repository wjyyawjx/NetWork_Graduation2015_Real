package com.qst.servlet.information;
//用户修改自己的email
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qst.dao.UserDao;

/**
 * Servlet implementation class EmailUpload
 */
@WebServlet("/EmailUpload")
public class EmailUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		// 获取用户名，密码
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("user");
		String pwd = (String) session.getAttribute("pwd");
		// 获取要修改的email
		String email = request.getParameter("email");
		// 进行修改
		UserDao uploaddao = new UserDao();
		uploaddao.UploadEmail(username, pwd, email);
		response.sendRedirect("InformationView");}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
