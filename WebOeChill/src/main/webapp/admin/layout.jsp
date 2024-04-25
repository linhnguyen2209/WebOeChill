<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="/WebOeChill/">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${page.title}</title>
<c:if test="${not empty page.styleUrl}">
	<link rel="stylesheet" href="${page.styleUrl}">
</c:if>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- Javascript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<!-- ICon bs5 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://kit.fontawesome.com/d524d8e031.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<header id="head" class="py-4">
		<nav id="nav" class="navbar navbar-expand-lg fixed-top ">
			<div class="container-fluid py-1">
				<a class="logo navbar-brand fw-bold fs-3"
					href="Admin/VideosManagement">OE<span class="ms-1">CHILL</span>
					ADMIN
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex ms-auto rounded-2" style="padding: 2px 0;"
						role="search">
						<input class="ps-3" type="search" placeholder="Tìm kiếm"
							aria-label="Search">
						<button class="btn" type="submit">
							<i class="bi bi-search me-1"></i>
						</button>
					</form>
					<ul class="navbar-nav ms-auto mb-lg-0">
						<li class="nav-item me-3"><a
							class="nav-link ${page.title eq 'Video Management'?'active':''}"
							href="Admin/VideosManagement">Quản lý video</a></li>
						<li class="nav-item me-3"><a
							class="nav-link ${page.title eq 'User Management'?'active':''}"
							href="Admin/UsersManagement">Quản lý người dùng</a></li>
						<li class="nav-item me-3"><a
							class="nav-link ${page.title eq 'Report'?'active':''}"
							href="Admin/Reports">Báo cáo</a></li>
						<c:if test="${!isLogin}">
							<li class="nav-item ms-3 dropdown position-relative"><a
								class="nav-link" href="Login" role="button"
								aria-expanded="false"> <i class="bi bi-person-circle fs-3"></i>
							</a>
								<ul class="dropdown-menu position-absolute end-0">
									<li><a class="dropdown-item text-capitalize" href="Login">Đăng
											nhập</a></li>
									<li><a class="dropdown-item text-capitalize"
										href="Registration">Đăng ký</a></li>
								</ul></li>
						</c:if>
						<c:if test="${isLogin}">
							<li class="nav-item ms-3 dropdown position-relative"><a
								class="nav-link d-flex align-items-center fw-bold"
								style="color: var(--text-orange);" href="EditProfile"
								role="button" aria-expanded="false"> <i
									class="bi bi-person-circle fs-3 me-3"></i> ${name}
							</a>
								<ul class="dropdown-menu position-absolute end-0">
									<li><a class="dropdown-item text-capitalize"
										href="EditProfile">Thông tin cá nhân</a></li>
									<li><a class="dropdown-item text-capitalize"
										href="ChangePassword">Đổi mật khẩu</a></li>
									<li><a class="dropdown-item text-capitalize"
										href="HomePage">Chuyển sang người dùng</a></li>
									<li><a class="dropdown-item text-capitalize" href="Logout">Đăng
											xuất</a></li>
								</ul></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<main class=" overflow-hidden container-fluid py-2">
		<jsp:include page="${page.contentUrl}"></jsp:include>
	</main>
	<footer class="bg-dark">
		<div class="container pt-5 px-5 px-sm-0">
			<div class="row">
				<div class="footernav col-12 col-lg-3 mb-5 mb-lg-0">
					<h4 class="text-light fw-bold mb-3 ">GIỚI THIỆU</h4>
					<div class="text">
						<p>OE CHILL - nơi bạn khám phá thế giới của điện ảnh thông qua
							một thư viện phim đa dạng, chất lượng cao và trải nghiệm giải trí
							tuyệt vời...</p>
					</div>
					<div class="d-flex box__icon ">
						<a href="#" class="fs-5 me-3 "><i class="bi bi-twitter"></i></a> <a
							href="#" class="fs-5 me-3 "><i class="bi bi-github"></i></a> <a
							href="#" class="fs-5 me-3 "><i class="bi bi-instagram"></i></a> <a
							href="#" class="fs-5 me-3 "><i class="bi bi-facebook"></i></a>
					</div>
				</div>
				<div class="footernav col-12 col-sm-4 col-lg-2 mb-3 mb-lg-0">
					<h4 class="text-light fw-bold mb-3">LIÊN KẾT</h4>

					<ul class="list-unstyled">
						<li><a href="index.html">Trang chủ</a></li>
						<li><a href="introduce.html">Giới thiệu</a></li>
						<li><a href="study.html">Khóa học</a></li>
						<li><a href="study.html">Làm bài thi</a></li>
						<li><a href="contact.html">Liên hệ</a></li>
					</ul>

				</div>
				<div class="footernav col-12 col-sm-4 col-lg-2 mb-3 mb-lg-0">
					<h4 class="text-light fw-bold mb-3">SẢN PHẨM</h4>

					<ul class="list-unstyled">
						<li><a href="#">Game Nester</a></li>
						<li><a href="#">Game Css Diner</a></li>
						<li><a href="#">Game CSS Selectors</a></li>
						<li><a href="#">Game Froggy</a></li>
						<li><a href="#">Game Froggy Pro</a></li>
						<li><a href="#">Game Scoops</a></li>
					</ul>

				</div>
				<div class="footernav col-12 col-sm-4 col-lg-2 mb-3 mb-lg-0">
					<h4 class="text-light fw-bold mb-3">CÔNG CỤ</h4>

					<ul class="list-unstyled">
						<li><a href="#">Tạo CV xin việc</a></li>
						<li><a href="#">Rút gọn liên kết</a></li>
						<li><a href="#">Clip-path maker</a></li>
						<li><a href="#">Snippet generator</a></li>
						<li><a href="#">CSS Grid generator</a></li>
						<li><a href="#">Cảnh báo sờ tay lên mặt</a></li>
					</ul>
				</div>
				<div class="footernav col-12 col-lg-3 mb-3 mb-lg-0">
					<h4 class="text-light fw-bold mb-3">THÔNG TIN LIÊN HỆ</h4>

					<ul class="list-unstyled">
						<li><i class="fa-solid fa-location-dot"></i> Mộc Bài 7, Hòa
							Minh, Liên Chiểu, Đà Nẵng</li>
						<li><i class="fa-solid fa-phone"></i> 0888372325</li>
						<li><i class="fa-regular fa-envelope"></i>
							linhli2k4@gmail.com</li>
					</ul>
				</div>
				<div class="footernav col-12 col-md-6 pt-5">
					<p>&copy; 2024 LINH EDU. Nền tảng học lập trình hàng đầu Việt
						Nam</p>
				</div>
				<div
					class="footernav col-12 col-md-6 d-flex justify-content-md-end pt-3 pe-4">
					<a href="#" class="fs-1 me-4 my-auto"><i
						class="bi bi-youtube text-danger"></i></a> <a href="#"
						class="icon__tiktok fs-4 me-4 my-auto shadow bg-black rounded-circle d-flex justify-content-center align-items-center"
						style="width: 40px; height: 40px;"><i
						class="bi bi-tiktok text-light"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<a
		class="btn__go-up rounded-circle d-none d-md-flex justify-content-center align-items-center"
		href="#head"><i class="bi bi-caret-up-fill fs-5"></i></a>
	<c:if test="${not empty page.scriptUrl}">
		<script type="text/javascript" src="${page.scriptUrl}"></script>
	</c:if>
</body>

</html>