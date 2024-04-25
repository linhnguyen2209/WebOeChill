<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div
	class="container d-flex justify-content-center align-items-center min-vh-100">
	<div class="row h-100 w-100">
		<div
			class="col-xl-7 d-none d-xl-flex justify-content-center align-items-center">
			<img class="object-fit-cover w-75"
				src="images/login_img-removebg.png" alt="login">
		</div>
		<div
			class="col-12 col-md-10 col-lg-7 col-xl-5 d-flex justify-content-center align-items-center m-auto">
			<form action="Registration" method="post"
				class="form p-5 rounded-3">
				<h2 class="mb-4 p-2 text-center fs-2 fw-bold">ĐĂNG KÝ</h2>
				<jsp:include page="/sites/commons/alert.jsp"></jsp:include>
				<div class="position-relative input__item"
					style="margin-bottom: 20px;">
					<label for="username" class="form-label fs-4 position-absolute"><i
						class="bi bi-person-fill"></i></label> <input type="text"
						class="w-100 rounded-5" id="username" name="username" value="${user.username}"
						aria-describedby="usernameHelp" placeholder="Tên đăng nhập"
						required>
					<div id="usernameHelp" class="form-text"></div>
				</div>
				<div class=" position-relative input__item"
					style="margin-bottom: 25px;">
					<label for="fullname" class="form-label fs-4 position-absolute"><i
						class="fa-solid fa-signature"></i></label> <input type="text"
						class="w-100 rounded-5 " id="fullname" name="fullName" value="${user.fullName}"
						aria-describedby="fullnameHelp" placeholder="Họ và tên" required>
					<div id="fullnameHelp" class="form-text"></div>
				</div>
				<div class=" position-relative input__item"
					style="margin-bottom: 25px;">
					<label for="email" class="form-label fs-4 position-absolute"><i
						class="bi bi-envelope-fill"></i></label> <input type="email"
						class="w-100 rounded-5 " id="email" name="email" value="${user.email}"
						aria-describedby="emailHelp" placeholder="Email" required>
					<div id="emailHelp" class="form-text"></div>
				</div>
				<div class="position-relative input__item"
					style="margin-bottom: 25px;">
					<label for="password" class="form-label fs-4 position-absolute"><i
						class="fa-solid fa-lock"></i></label> <input type="password"
						class="w-100 rounded-5" id="password" name="password"
						aria-describedby="passHelp" placeholder="Mật khẩu" required>
					<div id="passHelp" class="form-text"></div>
				</div>
				<div class="form-check ms-2 mb-3">
					<input type="checkbox"
						class="form-check-input border-0 rounded-0 border-black p-2"
						id="checkbox" name="agreedTermsAndConditions"> <label
						class="form-check-label text-secondary" for="checkbox">Tôi
						đồng ý với <a href="#" class="fw-bold text-secondary">điều
							khoản & điều kiện</a>
					</label>
				</div>
				<div class="mb-4 text-center">
					<button type="submit"
						class="btn btn-primary fw-bold rounded-5 fs-5 w-100"
						style="padding: 12px 0;">Đăng ký</button>
				</div>
				<div class=" text-center text-secondary">
					Bạn đã có tài khoản? <a class="fw-bold text-secondary ms-1"
						href="Login">Đăng nhập</a>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/sites/commons/modalMessage.jsp"></jsp:include>