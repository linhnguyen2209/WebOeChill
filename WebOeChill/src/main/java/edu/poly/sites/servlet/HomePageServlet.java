package edu.poly.sites.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.CookieUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.UserDao;
import edu.poly.dao.VideoDao;
import edu.poly.domain.VideoFull;
import edu.poly.model.User;
import edu.poly.model.Video;

@WebServlet("/HomePage")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	VideoDao dao = new VideoDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Kiểm tra người dùng đã login chưa,
		// Nếu chưa thì kiểm tra có lưu tài khoản không và tự động login khi có tài
		// khoản
		String usernameLogin = SessionUtils.getLoginedUsername(request);
		if (usernameLogin == null) {
			UserDao uDao = new UserDao();
			String username = CookieUtils.get("username", request);
			if (username != null) {
				User user = uDao.findById(username);
				SessionUtils.add(request, "name", user.getFullName());
				SessionUtils.add(request, "username", username);
				SessionUtils.add(request, "role", user.isAdmin());
			}
		}

		// Xử lý show video lên page theo phân trang
		try {

			// Lấy tham số pageNumber từ request, mặc định là 1 nếu không có
			int pageNumber = 1;
			String pageNumberStr = request.getParameter("pageNumber");
			if (pageNumberStr != null && !pageNumberStr.isEmpty()) {
				// đổi sang double trước rồi đổi sang int để không bị lỗi khi đổi snag int nhưng
				// kiểu double
				pageNumber = Integer.parseInt(pageNumberStr);
			}

			// Số lượng sản phẩm trên mỗi trang
			int pageSize = 6;
			String pageSizeStr = request.getParameter("pageSize");
			if (pageSizeStr != null && !pageSizeStr.isEmpty()) {
				pageSize = Integer.parseInt(pageSizeStr);
			}
			// Lấy danh sách video cho trang hiện tại và hện lên cả trạng thái các nut like
			List<VideoFull> listByPageFull = dao.findVideoFullByPage(pageNumber, pageSize, usernameLogin);
			request.setAttribute("videos", listByPageFull);

			List<Video> list = dao.findAll();
			int totalPage = 0;
			int totalVideo = 0;
			if (list != null) {
				// tổng số trang
				totalVideo = list.size();
				totalPage = (int) Math.ceil((double) totalVideo / pageSize);
				request.setAttribute("totalPage", totalPage);
			}
			request.setAttribute("pageCurrent", pageNumber);// set trang hiện tại để hiển thị active cho nút

			// Show video slider
			List<VideoFull> listSlide = dao.findVideoFullForSlide(6, usernameLogin);
			request.setAttribute("slides", listSlide);
			// Lấy video đầu tiên để thêm active trên carousel
			request.setAttribute("firstSlide", listSlide.get(0).getVideoId());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_HOME_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
