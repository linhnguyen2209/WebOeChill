package edu.poly.sites.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.query.Page;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.VideoDao;
import edu.poly.domain.VideoFull;

@WebServlet("/SearchVideo")
public class SearchVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = SessionUtils.getLoginedUsername(request);		
		String searchValue = request.getParameter("searchValue");
		System.out.println(searchValue);
		if(searchValue != null && !searchValue.equals("")) {
			VideoDao dao = new VideoDao();
			List<VideoFull> list = dao.findVideoFullBySearchValue(username, searchValue);
			request.setAttribute("videos", list);
			request.setAttribute("totalVideos", list.size());
			request.setAttribute("searchValue", searchValue);
		}else {
			response.sendRedirect("HomePage");
			return;
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_SEARCH_VIDEOS_PAGE);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
