package edu.poly.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.SessionUtils;
import edu.poly.dao.UserDao;

/**
 * Servlet Filter implementation class UserRoleFilter
 */
@WebFilter("/*")
public class UserRoleFilter extends HttpFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

//		 Kiểm tra URL yêu cầu để xác định điều hướng
		String requestURL = httpRequest.getRequestURI();
		// Kiểm tra vai trò của người dùng khi truy cập vào admin
		if (requestURL.startsWith("/WebOeChill/Admin")) {
			String username = SessionUtils.getLoginedUsername(httpRequest);
			if (username != null) {
				UserDao dao = new UserDao();
				boolean isAdmin = dao.findById(username).isAdmin();
				if (isAdmin) {
					// Nếu là admin, cho phép truy cập vào tất cả
					chain.doFilter(request, response);
				} else if (!isAdmin) {
					httpResponse.sendRedirect("/WebOeChill/Login?error=You can not access this page");
				}
			} else {
				httpResponse.sendRedirect("/WebOeChill/Login?error=Please login to continue");
			}
		} else {
			chain.doFilter(httpRequest, httpResponse);
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
