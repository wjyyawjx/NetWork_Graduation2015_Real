package cn.edu.imnu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import cn.edu.imnu.dao.UserDao;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String telephone = request.getParameter("telephone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao dao = new UserDao();
		boolean flag = dao.isExitEmail(username);

		if(flag ){
			JOptionPane.showMessageDialog(null, "账号已被注册，请重新输入！", null, JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("sign-up.jsp");
			System.out.println("账号已被注册，请重新输入！");	
		}
		else{
			dao.save(username,telephone,email,password);
			JOptionPane.showMessageDialog(null, "注册成功！请登录！", null, JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("sign-in.jsp");
			System.out.println("注册成功！");
		}
	}
	}
