package com.qst.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qst.bean.UserBean;

/**
 * Servlet Filter implementation class filter
 */
@WebFilter("/filter")
public class filter implements Filter {

	/**
	 * Default constructor.
	 */
	public filter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;cahrset=utf-8");
		HttpSession sess = req.getSession();
		String user = (String) sess.getAttribute("user");
		System.err.println(user);

		if (user != null) {
			chain.doFilter(request, response);
		} else {
			resp.sendRedirect("login.jsp");

		}
	}

	/**
	 * @see filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
