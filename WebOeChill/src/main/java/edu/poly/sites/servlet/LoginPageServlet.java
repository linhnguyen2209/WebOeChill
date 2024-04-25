package edu.poly.sites.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.CookieUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.UserDao;
import edu.poly.domain.LoginForm;
import edu.poly.model.User;

/**
 * Servlet implementation class LoginPageServlet
 */
@WebServlet("/Login")
public class LoginPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao dao = new UserDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Nhận các message or error nếu có
		String message = request.getParameter("message");
		String error = request.getParameter("error");
		if (message != null) {
			request.setAttribute("message", message);
		}
		if (error != null) {
			request.setAttribute("error", error);
		}
		// kiểm tra tài khoản đã lưu
		String username = CookieUtils.get("username", request);
		// kiểm tra tài khoản đã lưu
		if (username == null) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITES_LOGIN_PAGE);
			return;
		} else {
			User user = dao.findById(username);
			SessionUtils.add(request, "name", user.getFullName());
			SessionUtils.add(request, "username", username);
			SessionUtils.add(request, "role", user.isAdmin());
			response.sendRedirect("HomePage");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			LoginForm form = new LoginForm();
			BeanUtils.populate(form, request.getParameterMap());

			User user = dao.findById(form.getUsername());

			if (user != null) {
				if (user.getPassword().equals(form.getPassword())) {
					SessionUtils.add(request, "username", user.getUsername());
					SessionUtils.add(request, "role", user.isAdmin());
					if (form.isRemember()) {
						CookieUtils.add("username", form.getUsername(), 24, response);
					} else {
						CookieUtils.add("username", form.getUsername(), 0, response);
					}
					SessionUtils.add(request, "name", user.getFullName());
					// phân quyền
					if (!user.isAdmin()) {
						response.sendRedirect("HomePage");
					} else {
						response.sendRedirect("Admin/VideosManagement");
					}

					return;
				} else {
					request.setAttribute("error", "Mật khẩu không chính xác!");
				}
			} else {
				request.setAttribute("error", "Thông tin đăng nhập không chính xác!");
			}
			request.setAttribute("form", form); // nếu lỗi thì set username lại trên form
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			e.printStackTrace();
		}
		// lỗi thì quay lại đăng nhập
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_LOGIN_PAGE);
	}

}
