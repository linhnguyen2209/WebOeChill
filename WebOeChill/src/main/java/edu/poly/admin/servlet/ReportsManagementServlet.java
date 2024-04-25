package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.FavouriteDao;
import edu.poly.dao.ShareDao;
import edu.poly.dao.VideoDao;
import edu.poly.domain.FavouriteReport;
import edu.poly.domain.FavouriteUserReport;
import edu.poly.domain.ShareReport;
import edu.poly.model.Video;

/**
 * Servlet implementation class ReportsManagementServlet
 */
@WebServlet("/Admin/Reports")
public class ReportsManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String selectedTab = request.getParameter("selectedTab");
		if (selectedTab != null) {
			request.getSession().setAttribute("selectedTab", selectedTab);
		}

		// Gửi dữ liệu báo cáo và forward tới trang JSP
		reportFavouriteByVideos(request, response);
		reportFavouriteUsersByVideos(request, response);
		reportShareUsersByVideo(request, response);
		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void reportFavouriteByVideos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			FavouriteDao dao = new FavouriteDao();
			List<FavouriteReport> list = dao.reportFavouriteOfVideos();
			request.setAttribute("favList", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
	}

	protected void reportFavouriteUsersByVideos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoUserId = request.getParameter("cboVideoTitle");

			VideoDao vDao = new VideoDao();
			List<Video> vList = vDao.findAll();

			if (videoUserId == null && vList.size() > 0) {
				videoUserId = vList.get(0).getVideoId();
			}

			FavouriteDao fDao = new FavouriteDao();
			List<FavouriteUserReport> list = fDao.reportFavouriteUsersByVideo(videoUserId);
			request.setAttribute("videoUserId", videoUserId);
			request.setAttribute("vList", vList);
			request.setAttribute("favUsers", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
	}

	protected void reportShareUsersByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoShareId = request.getParameter("cboVideoTitleShare");
			VideoDao vdao = new VideoDao();
			List<Video> vlist = vdao.findAll();
			if (videoShareId == null && vlist.size() > 0) {
				videoShareId = vlist.get(0).getVideoId();
			}
			ShareDao dao = new ShareDao();
			List<ShareReport> list = dao.reportShareByVideo(videoShareId);
			request.setAttribute("videoShareId", videoShareId);
			request.setAttribute("vidList", vlist);
			request.setAttribute("shareUsers", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
