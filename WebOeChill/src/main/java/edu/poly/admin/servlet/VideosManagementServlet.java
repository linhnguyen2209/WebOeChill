package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.UploadUtils;
import edu.poly.dao.VideoDao;
import edu.poly.model.Video;

/**
 * Servlet implementation class VideosManagementServlet
 */
@WebServlet({ "/Admin/VideosManagement", "/Admin/VideosManagement/create", "/Admin/VideosManagement/update",
		"/Admin/VideosManagement/delete", "/Admin/VideosManagement/reset", "/Admin/VideosManagement/edit" })
@MultipartConfig
public class VideosManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int currentPageNumber = 1;
	int currentTab = 1;
	VideoDao dao = new VideoDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("edit")) {
			edit(request, response);
		}
		if (url.contains("delete")) {
			delete(request, response);
			reset(request, response);
		}
		if (url.contains("reset")) {
			reset(request, response);
		}
		// để thực hiện chuyển trang
		String currentPageParam = request.getParameter("currentPageNumberParam");
		if (currentPageParam == null) {
			request.setAttribute("currentPageAttr", currentPageNumber);
		} else {
			currentPageNumber = Integer.parseInt(currentPageParam);
			request.setAttribute("currentPageAttr", currentPageNumber);
		}
		// để thực hiện fill theo phân trang
		fillTable(currentPageNumber, 10, request, response);

		// giữ cho tab hiển thị ở trang đang truy cập
		String currentTabParam = request.getParameter("currentTab");
		if (currentTabParam == null) {
			request.setAttribute("currentTabAttr", currentTab);
		} else {
			currentTab = Integer.parseInt(currentTabParam);
			request.setAttribute("currentTabAttr", currentTab);
		}
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("create")) {
			create(request, response);
		}
		if (url.contains("delete")) {
			delete(request, response);
			reset(request, response);
		}
		if (url.contains("update")) {
			update(request, response);
		}
		if (url.contains("reset")) {
			reset(request, response);
		}
		// thực hiện hành động này để vô hiệu hóa 1 số nút chức năng sau khi thực hiện
		// chức năng trên
		request.setAttribute("currentPageAttr", currentPageNumber);
		fillTable(currentPageNumber, 10, request, response);
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		String videoId = request.getParameter("videoId");

		Video video = dao.findById(videoId);
		request.setAttribute("video", video);
	}

	private void reset(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("video", new Video());
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		try {
			BeanUtils.populate(video, request.getParameterMap());
			Video videoInput = dao.findById(video.getVideoId());
			if (videoInput == null) {
				video.setPoster(
						"uploads/" + UploadUtils.processUploadField("cover", request, "/uploads", video.getVideoId()));

				dao.insert(video);
				request.setAttribute("message", "Thêm mới thành công!");
			} else {
				request.setAttribute("error", "VideoID này đã tồn tại!");
			}
		} catch (Exception e) {
			e.printStackTrace();
//			request.setAttribute("error", "Thêm mới thất bại:" + e.getMessage());
		}
		request.setAttribute("video", video);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		try {
			BeanUtils.populate(video, request.getParameterMap());
			Video videoInput = dao.findById(video.getVideoId());
			if (videoInput != null) {
				if (videoInput.getPoster().equals("uploads/")) {
					// nếu đường dẫn ảnh chưa có lấy từ ngoài vào lại
					video.setPoster("uploads/"
							+ UploadUtils.processUploadField("cover", request, "/uploads", video.getVideoId()));
				}else {
					// nếu có r thì lấy từ csdl
					video.setPoster(videoInput.getPoster());
				}
				dao.update(video);
				request.setAttribute("message", "Cập nhật thành công!");
			} else {
				request.setAttribute("error", "VideoID này không tồn tại!");
			}
		} catch (Exception e) {
			e.printStackTrace();
//			request.setAttribute("error", "Cập nhật thất bại:" + e.getMessage());
		}
		request.setAttribute("video", video);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			String videoId = request.getParameter("videoId");
			Video videoInput = dao.findById(videoId);
			if (videoInput != null) {
				dao.delete(videoId);
				request.setAttribute("message", "Xóa thành công!!!");
			} else {
				request.setAttribute("error", "VideoID này không tồn tại!");
			}
		} catch (Exception e) {
			e.printStackTrace();
//			request.setAttribute("error", e.getMessage());
		}
	}

	private void fillTable(int pageNumber, int pageSize, HttpServletRequest request, HttpServletResponse response) {
		List<Video> list = dao.findVideosByPage(pageNumber, pageSize);
		request.setAttribute("videos", list);

		List<Video> allList = dao.findAll();
		// Total videos
		request.setAttribute("totalVideos", allList.size());
		// Total Page
		request.setAttribute("totalPage", Math.ceil((double) allList.size() / pageSize));
	}

}
