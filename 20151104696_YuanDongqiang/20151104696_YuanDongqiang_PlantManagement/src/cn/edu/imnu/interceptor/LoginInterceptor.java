package cn.edu.imnu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.imnu.po.User;
import cn.edu.imnu.web.controller.IndexController;

/**
 * 进入系统拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Autowired
	private IndexController indexController;

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object Handler, Exception ex)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler)
			throws Exception {
		User user = null;
		HttpSession session = request.getSession();
		String url = request.getRequestURI();
		if (url.indexOf("/JZIndex") >= 0) {
			if (session.getAttribute("USER_SESSION") == null) {
				String u_ip = java.net.InetAddress.getLocalHost().getHostAddress();
				user = indexController.IPFind(u_ip,session);
				if(user!=null) {
					System.out.println(user.getU_name());
					session.setAttribute("USER_SESSION", user);
				}
				session.setAttribute("KEY", 1);
			}
		}

		return true;
	}

}
