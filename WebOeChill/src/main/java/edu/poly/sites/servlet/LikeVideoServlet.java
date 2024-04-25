package edu.poly.sites.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.SessionUtils;
import edu.poly.dao.FavouriteDao;
import edu.poly.model.Favourite;
import edu.poly.model.User;
import edu.poly.model.Video;

/**
 * Servlet implementation class LikeVideoServlet
 */
@WebServlet("/LikeVideo")
public class LikeVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// kiểm tra đăng nhập chưa
		String username = SessionUtils.getLoginedUsername(request);

		if (username == null) {
			response.sendRedirect("Login");
			return;
		}

		String page = request.getParameter("page");// để lấy trang mà người dùng đang đứng like
		String videoId = request.getParameter("videoId");

		if (videoId == null) {
			response.sendRedirect("HomePage");
			return;
		}
		try {
			Favourite favourite;
			FavouriteDao dao = new FavouriteDao();
			// lấy ra yêu thích dựa trên 2 tham số này
			favourite = dao.findFavouriteByVideoIdAndUser(videoId, username);
			// nếu chưa có thì thêm còn có rồi thì xóa
			if (favourite == null) {
				favourite = new Favourite();
				favourite.setLikedDate(new Date());
				User user = new User();
				user.setUsername(username);
				favourite.setUser(user);
				Video video = new Video();
				video.setVideoId(videoId);
				favourite.setVideo(video);
				dao.insert(favourite);
			} else {
				dao.delete(favourite.getFavoriteId());
			}

			if (page == null) {
				page = "HomePage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
