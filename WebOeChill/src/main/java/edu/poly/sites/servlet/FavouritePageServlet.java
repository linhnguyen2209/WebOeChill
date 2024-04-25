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
@WebServlet("/Favourite")
public class FavouritePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = SessionUtils.getLoginedUsername(request);
		if(username == null) {
			response.sendRedirect("Login");
			return;
		}
		// Xử lý show video lên page theo phân trang
				try {
					VideoDao dao = new VideoDao();

					// Lấy tham số pageNumber từ request, mặc định là 1 nếu không có
					int pageNumber = 1;
					String pageNumberStr = request.getParameter("pageNumber");
					if (pageNumberStr != null && !pageNumberStr.isEmpty()) {
						// đổi sang double trước rồi đổi sang int để không bị lỗi khi đổi sang int nhưng đang là
						// kiểu double
						pageNumber = (int) Double.parseDouble(pageNumberStr);
					}

					// Số lượng box trên mỗi trang
					int pageSize = 12;
					String pageSizeStr = request.getParameter("pageSize");
					if (pageSizeStr != null && !pageSizeStr.isEmpty()) {
						pageSize = Integer.parseInt(pageSizeStr);
					}
					// Lấy danh sách video cho trang yeu thích
					List<VideoFull> listByPageFull = dao.findFavouriteVideoFullByPage(pageNumber, pageSize, username);
					System.out.println(listByPageFull.size());
					request.setAttribute("videos", listByPageFull);

					// tổng số trang
					request.setAttribute("totalPage", Math.ceil((double) listByPageFull.size() / pageSize));

					request.setAttribute("pageCurrent", pageNumber);// set trang hiện tại để hiển thị active cho nút
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("error", e.getMessage());
				}
		
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_FAVOURITES_PAGE);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
