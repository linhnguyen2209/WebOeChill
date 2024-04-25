package edu.poly.sites.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.VideoDao;
import edu.poly.domain.VideoFull;
import edu.poly.model.Video;

/**
 * Servlet implementation class Favourite
 */
@WebServlet("/Detail")
public class DetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionUtils.getLoginedUsername(request);
		VideoDao dao = new VideoDao();
		String videoId = request.getParameter("videoId");
		if (videoId == null) {
			response.sendRedirect("HomePage");
			return;
		}
		VideoFull videofull = dao.findVideoFullById(videoId , username);
		List<Video> list = dao.findAll();
		if (videofull == null || list == null) {
			PageInfo.prepareAndForwardSite(request, response, PageType.SITES_HOME_PAGE);
			return;
		}
		request.setAttribute("videos", list);
		// Xử lý genre
		String[] genres = videofull.getGenre().split(", ");
		request.setAttribute("genres", genres);
		request.setAttribute("video", videofull);
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_DETAIL_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
