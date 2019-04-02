package com.bs.sxd.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.bs.sxd.po.User;
public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {	
		String url = request.getRequestURI();	
		if (url.indexOf("/login.action") >= 0) {
			return true;
		}	
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_SESSION");	
		if (user != null) {
			return true;
		}
		if (url.indexOf("/register.action") >= 0){
			return true;
		}
		if (url.indexOf("/main.action") >= 0){
			return true;
		}
		if (url.indexOf("/add.action") >= 0){
			return true;
		}
		if (url.indexOf("/addgoods.action") >= 0){
			return true;
		}
		if (url.indexOf("/findgoodslist.action") >= 0){
			return true;
		}
		if (url.indexOf("/findgoodslist_a.action") >= 0){
			return true;
		}
		if (url.indexOf("/finduserlist.action") >= 0){
			return true;
		}
		if (url.indexOf("/findper.action") >= 0){
			return true;
		}
		if (url.indexOf("/findeval.action") >= 0){
			return true;
		}
		if (url.indexOf("/evaluation.action") >= 0){
			return true;
		}
	
		if (url.indexOf("/person.action") >= 0){
			return true;
		}
		if (url.indexOf("/mygoods.action") >= 0){
			return true;
		}
		if (url.indexOf("/table-user-list.action") >= 0){
			return true;
		}
		if (url.indexOf("/table-goods-list-admin.action") >= 0){
			return true;
		}
		if (url.indexOf("/form-news.action") >= 0){
			return true;
		}
		if (url.indexOf("/form-show-goods.action") >= 0){
			return true;
		}
		if (url.indexOf("/form-show-goods-user.action") >= 0){
			return true;
		}
		if (url.indexOf("/form-lease.action") >= 0){
			return true;
		}
		if (url.indexOf("/personalinformation_user.action") >= 0){
			return true;
		}
		if (url.indexOf("/commodity_information.action") >= 0){
			return true;
		}
		if (url.indexOf("/updateUser_a.action") >= 0){
			return true;
		}
		if (url.indexOf("/updateUser_p.action") >= 0){
			return true;
		}
		if (url.indexOf("/deleteUser.action") >= 0){
			return true;
		}
		if (url.indexOf("/deleteGoods.action") >= 0){
			return true;
		}
		if (url.indexOf("/updategools_xiajia.action") >= 0){
			return true;
		}
		request.setAttribute("msg", "用户名或密码错误！！");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);	
		return false;	
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
