package edu.poly.sites.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
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

import org.hibernate.query.Page;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.ShareDao;
import edu.poly.dao.UserDao;
import edu.poly.model.Share;
import edu.poly.model.User;
import edu.poly.model.Video;

/**
 * Servlet implementation class ShareVideoServlet
 */
@WebServlet("/ShareVideo")
public class ShareVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// kiểm tra đăng nhập chưa
		String username = SessionUtils.getLoginedUsername(request);

		if (username == null) {
			response.sendRedirect("Login");
			return;
		}
		
		String emailAddress = request.getParameter("email");
		String videoId = request.getParameter("videoId");

		if (emailAddress != null) {
			sendEmail(emailAddress, videoId, username, request);
		}
		response.sendRedirect("HomePage");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void sendEmail(String recipientEmail, String videoId, String usernameLogin, HttpServletRequest request) {
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
			message.setSubject("Video shared by a friend");

			// Xây dựng nội dung email bằng HTML
			String emailContent = "<html>" + "<body>" + "<h2>Dear client" + ",</h2>"
					+ "<p style=\"font-size: 16px;\">A friend shared this video with you: click</p>"
					+ "<a href=\"http://localhost:8080/WebOeChill/Detail?videoId=" + videoId
					+ "\" style=\"color: blue;\">here</a>" + "<p style=\"font-size: 16px;\">Sincerely,</p>"
					+ "<p style=\"font-size: 16px;\">Admin</p>" + "</body>" + "</html>";

			message.setContent(emailContent, "text/html; charset=utf-8");

			Transport.send(message);
			request.setAttribute("message", "Chia sẻ thành công!");
		
			//Thêm dl share vào csdl
			User user = new User();
			user.setUsername(usernameLogin);
			Video video = new Video();
			video.setVideoId(videoId);
			
			ShareDao dao = new ShareDao();
			Share share =  new Share();
			share.setSharedDate(new Date());
			share.setUser(user);
			share.setVideo(video);
			share.setEmails(recipientEmail);
			
			dao.insert(share);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Gửi email không thành công!");
		}
	}
}
