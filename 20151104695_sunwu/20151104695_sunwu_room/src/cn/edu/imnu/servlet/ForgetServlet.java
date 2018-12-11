package cn.edu.imnu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.imnu.dao.UserDao;

/**
 * Servlet implementation class ForgetServlet
 */
@WebServlet("/ForgetServlet")
public class ForgetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forget_username = request.getParameter("forget-username");
		String forget_email = request.getParameter("forget-email");
		String forget_password = request.getParameter("forget-password");
		
		UserDao dao = new UserDao();
		boolean flag = dao.forgetusername(forget_username);
		if(flag){
			boolean flaag = dao.forgetemail(forget_email);
			if(flaag) {
				dao.amend(forget_username,forget_email,forget_password);
				JOptionPane.showMessageDialog(null, "修改密码成功！", null, JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("sign-in.jsp");
				System.out.println("修改密码成功！");
			}
			else {
				JOptionPane.showMessageDialog(null, "邮箱输入错误！", null, JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("forget-password.jsp");
				System.out.println("邮箱输入错误！");
			}
		}
		else {
			JOptionPane.showMessageDialog(null, "用户名输入错误！", null, JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("forget-password.jsp");
			System.out.println("用户名输入错误！");
		}
	}

}
