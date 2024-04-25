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
import edu.poly.dao.UserDao;
import edu.poly.model.User;

/**
 * Servlet implementation class UsersManagementServerlet
 */
@WebServlet({ "/Admin/UsersManagement", "/Admin/UsersManagement/update", "/Admin/UsersManagement/delete",
		"/Admin/UsersManagement/edit" })
public class UsersManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int currentPageNumber = 1;
	int currentTab = 1;
	UserDao dao = new UserDao();

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
		// để thực hiện fill theo phân trang
		String currentPageParam = request.getParameter("currentPageNumberParam");
		if (currentPageParam == null) {
			request.setAttribute("currentPageAttr", currentPageNumber);
		} else {
			currentPageNumber = Integer.parseInt(currentPageParam);
			request.setAttribute("currentPageAttr", currentPageNumber);
		}
		
		// giữ cho tab hiển thị ở trang đang truy cập
				String currentTabParam = request.getParameter("currentTab");
				if (currentTabParam == null) {
					request.setAttribute("currentTabAttr", currentTab);
				} else {
					currentTab = Integer.parseInt(currentTabParam);
					request.setAttribute("currentTabAttr", currentTab);
				}
		fillTable(currentPageNumber, 10, request, response);
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("delete")) {
			delete(request, response);
			reset(request, response);
		}
		if (url.contains("update")) {
			update(request, response);
		}
		// thực hiện hành động này để vô hiệu hóa 1 số nút chức năng sau khi thực hiện
		// chức năng trên
		request.setAttribute("currentPageAttr", currentPageNumber);
		fillTable(currentPageNumber, 10, request, response);
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");

		User user = dao.findById(username);
		request.setAttribute("user", user);
	}

	private void reset(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("user", new User());
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			User userData = dao.findById(user.getUsername());
			System.out.println(userData);
			user.setAdmin(userData.isAdmin());
			dao.update(user);
			request.setAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Cập nhật thất bại:" + e.getMessage());
		}
		request.setAttribute("user", user);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			String username = request.getParameter("username");
			dao.delete(username);
			request.setAttribute("message", "Xóa thành công!!!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
	}

	private void fillTable(int pageNumber, int pageSize, HttpServletRequest request, HttpServletResponse response) {
		List<User> list = dao.findUsersByPage(pageNumber, pageSize);
		System.out.println("fillAll:" + list.get(0).getUsername());
		request.setAttribute("users", list);

		List<User> allList = dao.findAll();
		// Total videos
		request.setAttribute("totalUsers", allList.size());
		// Total Page
		request.setAttribute("totalPage", Math.ceil((double) allList.size() / pageSize));
	}
}
