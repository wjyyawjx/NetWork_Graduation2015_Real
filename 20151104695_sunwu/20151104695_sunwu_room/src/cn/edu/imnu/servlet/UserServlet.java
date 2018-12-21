package cn.edu.imnu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import cn.edu.imnu.bean.UserBean;
import cn.edu.imnu.service.UserService;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");//编码格式
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = null;
		String checkcode = request.getParameter("validateCode");
		HttpSession session=request.getSession(true);  
		
		UserService userservice = new UserService();
		UserBean user = userservice.LoginValidate(username, password, type);
		session.setAttribute("user", user);
		
		
		if (checkcode.equalsIgnoreCase((String) session.getAttribute("randCheckCode")) && checkcode != "") {
			if (user != null) {
					response.sendRedirect("common.jsp");
			} else {
				System.out.println("用户名或密码错误！");
				JOptionPane.showMessageDialog(null, "用户名或密码错误");
				response.sendRedirect("sign-in.jsp");
				
			}
		} else {
			System.out.println("验证码错误！");
			JOptionPane.showMessageDialog(null, "验证码错误");
			response.sendRedirect("sign-in.jsp");
			
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
