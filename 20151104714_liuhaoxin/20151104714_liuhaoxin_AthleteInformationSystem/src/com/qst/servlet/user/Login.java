package com.qst.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

import com.qst.bean.UserBean;
import com.qst.dao.UserDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//用户登录
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");

		UserBean userbean = new UserBean();
		userbean.setUsername(username);
		userbean.setPwd(pwd);
		
		UserDao sd = new UserDao();
		UserBean rs = sd.login(userbean);
		

			if (rs != null) 
				{
				HttpSession session = request.getSession(); 
				session.setAttribute("user",username);
				//获取我的头像图片地址
				ImageIcon icon= new ImageIcon(request.getSession().getServletContext().getRealPath("/img/touxiang.png"));        
				System.err.println(icon);
				//查看权限
				String qx=sd.pmission(userbean);
				
				if(qx.equals("0")) 
				{
					//普通用户
					
					JOptionPane.showMessageDialog(null, "欢迎访问我设计的系统","欢迎访问",JOptionPane.ERROR_MESSAGE,icon); 
					
					request.getRequestDispatcher("general-index.jsp").forward(request, response);
				}
				else if(qx.equals("1")) {
					//记录员用户
					
					JOptionPane.showMessageDialog(null, "欢迎访问我设计的系统","欢迎访问",JOptionPane.ERROR_MESSAGE,icon); 
					
					request.getRequestDispatcher("recorder-index.jsp").forward(request, response);
				}
				else if(qx.equals("2")) {
					//管理员用户
					JOptionPane.showMessageDialog(null, "欢迎访问我设计的系统","欢迎访问",JOptionPane.ERROR_MESSAGE,icon); 

					request.getRequestDispatcher("admin-index.jsp").forward(request, response);	
				}
				else {
					// 受限制用户，或出错用户
					request.getRequestDispatcher("error.jsp").forward(request, response);	
						
				}
				}
			else
				{
				response.sendRedirect("Login.jsp");
				}
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
