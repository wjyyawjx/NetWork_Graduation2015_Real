package com.qst.servlet.information;
//用户修改自己的密码
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

import com.qst.dao.UserDao;

/**
 * Servlet implementation class PwdUpload
 */
@WebServlet("/PwdUpload")
public class PwdUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdUpload() {
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
		// 获取要修改的密码
		String pwdupload = request.getParameter("password");
		// 进行修改
		UserDao uploaddao = new UserDao();
		uploaddao.UploadPwd(username, pwd, pwdupload);
		JOptionPane.showMessageDialog(null, "你的密码修改成功了，需要重新登录","ok!!",JOptionPane.ERROR_MESSAGE); 

		response.sendRedirect("LoginView");
	
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
