package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;

/**
 * 登录后的个人主页
 */
@SuppressWarnings("serial")
public class ProfileServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, java.io.IOException {
		//验证会话是否是登录状态，如果是没有登录，则跳转到登录页面去；否则，取出用户信息进行展示
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			//未登录，跳转到登录页面去
			response.sendRedirect("/login");
			return;
		}
		RequestDispatcher welcomeDispatcher = request.getRequestDispatcher("/views/profile.jsp");
		welcomeDispatcher.forward(request, response);
	}
}