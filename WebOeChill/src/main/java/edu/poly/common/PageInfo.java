package edu.poly.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

public class PageInfo {
	public static Map<PageType, PageInfo> pageRoute = new HashedMap();

	static {
//		Admin
		pageRoute.put(PageType.USER_MANAGEMENT_PAGE, new PageInfo("User Management", "/admin/users/users.jsp",
				"admin/css/video_details.css", ""));
		pageRoute.put(PageType.REPORT_MANAGEMENT_PAGE, new PageInfo("Report", "/admin/reports/reports.jsp",
				"admin/css/video_details.css", ""));
		pageRoute.put(PageType.VIDEO_MANAGEMENT_PAGE, new PageInfo("Video Management", "/admin/videos/videos.jsp",
				"admin/css/video_details.css", ""));
//		User
		pageRoute.put(PageType.SITES_HOME_PAGE, new PageInfo("Trang chủ", "/sites/homes/home.jsp",
				"sites/css/style.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_FAVOURITES_PAGE, new PageInfo("Yêu thích", "/sites/videos/favourite.jsp",
				"sites/css/favourite.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_VIEW_HISTORY_PAGE, new PageInfo("Lịch sử xem", "/sites/videos/view-history.jsp",
				"sites/css/favourite.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_DETAIL_PAGE, new PageInfo("Chi tiết", "/sites/videos/detail.jsp",
				"sites/css/video_details.css", "sites/js/video_details.js"));
		pageRoute.put(PageType.SITES_CONTACT_PAGE, new PageInfo("Liên hệ", "/sites/users/contact.jsp",
				"sites/css/contact.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_LOGIN_PAGE, new PageInfo("Đăng nhập", "/sites/users/login.jsp",
				"sites/css/form.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_REGISTRATION_PAGE, new PageInfo("Đăng ký", "/sites/users/registration.jsp",
				"sites/css/form.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_CHANGE_PASSWORD_PAGE, new PageInfo("Thay đổi mật khẩu", "/sites/users/change-password.jsp",
				"sites/css/form.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_CONFIRM_PAGE, new PageInfo("Xác nhận", "/sites/users/confirm.jsp",
				"sites/css/form.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_FORGOT_PASSWORD_PAGE, new PageInfo("Quên mật khẩu", "/sites/users/forgot-password.jsp",
				"sites/css/form.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_EDIT_PROFILE_PAGE, new PageInfo("Thông tin cá nhân", "/sites/users/edit-profile.jsp",
				"sites/css/form.css", "sites/js/index.js"));
		pageRoute.put(PageType.SITES_SEARCH_VIDEOS_PAGE, new PageInfo("Tìm kiếm", "/sites/videos/listVideosSearched.jsp",
				"sites/css/video_details.css", "sites/js/video_details.js"));
	}

	public static void prepareAndForward(HttpServletRequest request, HttpServletResponse response, PageType pageType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	public static void prepareAndForwardSite(HttpServletRequest request, HttpServletResponse response, PageType pageType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/sites/layout.jsp").forward(request, response);
	}
	private String title;
	private String contentUrl;
	private String styleUrl;
	private String scriptUrl;

	public PageInfo(String title, String contentUrl, String styleUrl, String scriptUrl) {
		this.title = title;
		this.contentUrl = contentUrl;
		this.styleUrl = styleUrl;
		this.scriptUrl = scriptUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public String getStyleUrl() {
		return styleUrl;
	}

	public void setStyleUrl(String styleUrl) {
		this.styleUrl = styleUrl;
	}

	public String getScriptUrl() {
		return scriptUrl;
	}

	public void setScriptUrl(String scriptUrl) {
		this.scriptUrl = scriptUrl;
	}

}
