package edu.poly.sites.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.UserDao;
import edu.poly.domain.ChangePasswordForm;

/**
 * Servlet implementation class Favourite
 */
@WebServlet("/ChangePassword")
public class ChangePasswordPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = SessionUtils.getLoginedUsername(request);
		
		if(username == null) {
			response.sendRedirect("Login");
			return;
		}
		request.setAttribute("username", username);
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_CHANGE_PASSWORD_PAGE);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username = SessionUtils.getLoginedUsername(request);
			
			ChangePasswordForm form = new ChangePasswordForm();
			BeanUtils.populate(form, request.getParameterMap());
			request.setAttribute("username", username);
			if(!form.getConfirmPassword().equals(form.getNewPassword())) {
				request.setAttribute("error", "Mật khẩu xác nhận không trùng khớp!");
			}else {
				UserDao dao = new UserDao();
				dao.changePassword(form.getUsername(), form.getOldPassword(), form.getNewPassword());
				request.setAttribute("message", "Đổi mật khẩu thành công");
 			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Mật khẩu không chính xác!");
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_CHANGE_PASSWORD_PAGE);
	}

}
