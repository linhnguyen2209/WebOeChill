package edu.poly.sites.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

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
import edu.poly.model.User;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class RegistrationPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_REGISTRATION_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		UserDao dao = new UserDao();
		try {
			// Lấy danh sách các tham số từ request
			Map<String, String[]> parameterMap = request.getParameterMap();

			// Tạo một HashMap mới để lưu trữ các tham số chỉnh sửa
			Map<String, String[]> modifiedParams = new HashMap<String, String[]>(parameterMap);

			// Kiểm tra và loại bỏ thuộc tính không mong muốn khỏi danh sách tham số
			if (modifiedParams.containsKey("agreedTermsAndConditions")) {
				modifiedParams.remove("agreedTermsAndConditions");
			}

			// Populate user từ danh sách tham số đã chỉnh sửa
			BeanUtils.populate(user, modifiedParams);
			String agreedTermsAndConditions = request.getParameter("agreedTermsAndConditions");
			if (agreedTermsAndConditions != null) {
				User userInput = dao.findById(user.getUsername());
				if (userInput == null) {
					dao.insert(user);

					// Chuyển hướng đến trang login sau khi thêm user thành công
					// Mã hóa thông điệp để có thể gắn vào URL
					String encodedMessage = URLEncoder.encode("Đăng ký thành công, vui lòng đăng nhập để tiếp tục!",
							"UTF-8");

					// Chuyển hướng tới trang Login với thông điệp được gắn vào URL
					response.sendRedirect("Login?message=" + encodedMessage);
					return;
				} else {
					request.setAttribute("error", "Tên đăng nhập đã tồn tại!");
				}
			} else {
				request.setAttribute("error", "Bạn chưa đồng ý với điều khoản & điều kiện của chúng tôi!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());

		}
		// Đặt thuộc tính "user" để hiển thị lại trên giao diện nếu cần
		request.setAttribute("user", user);
		// Điều hướng đến trang đăng ký (registration page) nếu có lỗi xảy ra
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_REGISTRATION_PAGE);

	}
}
