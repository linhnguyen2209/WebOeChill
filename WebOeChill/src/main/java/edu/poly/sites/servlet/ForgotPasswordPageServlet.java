package edu.poly.sites.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.UserDao;
import edu.poly.model.User;

/**
 * Servlet implementation class Favourite
 */
@WebServlet("/ForgotPassword")
public class ForgotPasswordPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PageInfo.prepareAndForwardSite(request, response, PageType.SITES_FORGOT_PASSWORD_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String emailAddress = request.getParameter("email");
		String username = request.getParameter("username");

		UserDao dao = new UserDao();
		User user = dao.findByUsernameAndEmail(username, emailAddress);

		if (user == null) {
			request.setAttribute("error", "Tên đăng nhập hoặc email không chính xác!");
		} else {
			sendEmail(emailAddress, user.getFullName(), user.getPassword(), request);
			PageInfo.prepareAndForwardSite(request, response, PageType.SITES_FORGOT_PASSWORD_PAGE);
		}

	}

	private void sendEmail(String recipientEmail, String recipientName, String passwordOfUser,
			HttpServletRequest request) {
		// I.Đăng nhập email
		// Thông tin
		final String username = "linhli2k4@gmail.com";
		final String password = "ichn chre jevj mwqe";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
			message.setSubject("Password Forgoted");

			// Xây dựng nội dung email bằng HTML
			String emailContent = "<html>" + "<body>" + "<h2>Dear " + recipientName + ",</h2>"
					+ "<p style=\"font-size: 16px;\">Your password is:</p>" + "<h3 style=\"color: blue;\">" + passwordOfUser + "</h3>"
					+ "<p style=\"font-size: 16px;\">Sincerely,</p>" + "<p style=\"font-size: 16px;\">Admin</p>" + "</body>" + "</html>";

			message.setContent(emailContent, "text/html; charset=utf-8");

			Transport.send(message);
			request.setAttribute("message", "Vui lòng kiểm tra email. Mật khẩu đã được gửi đến email của bạn!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Gửi email không thành công!");
		}
	}

}
