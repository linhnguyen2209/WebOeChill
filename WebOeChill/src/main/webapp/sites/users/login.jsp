<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div
	class="container d-flex justify-content-center align-items-center vh-100">
	<div class="row h-100 w-100 pt-2">
		<div
			class="col-xl-7 d-none d-xl-flex justify-content-center align-items-center">
			<img class="object-fit-cover w-75"
				src="images/login_img-removebg.png" alt="login">
		</div>
		<div
			class="col-12 col-md-10 col-lg-7 col-xl-5 d-flex justify-content-center align-items-center m-auto">
			<form action="Login" method="post" class="form p-5 rounded-3">
				<h2 class="mb-4 p-2 text-center fs-2 fw-bold ">ĐĂNG NHẬP</h2>
				<jsp:include page="/sites/commons/alert.jsp"></jsp:include>
				<div class="position-relative input__item"
					style="margin-bottom: 20px;">
					<label for="username" class="form-label fs-3 position-absolute"><i
						class="bi bi-person-fill"></i></label> <input type="text"
						class="w-100 rounded-5" id="username" name="username" value="${form.username}"
						aria-describedby="usernameHelp" placeholder="Tên đăng nhập"
						required>
					<div id="usernameHelp" class="form-text"></div>
				</div>
				<div class="position-relative input__item"
					style="margin-bottom: 20px;">
					<label for="password" class="form-label fs-4 position-absolute"><i
						class="fa-solid fa-lock"></i></label> <input type="password"
						class="w-100 rounded-5" id="password" name="password" aria-describedby="passHelp"
						placeholder="Mật khẩu" required>
					<div id="passHelp" class="form-text"></div>
				</div>
				<div class="mb-3 d-flex justify-content-between">
					<div class="form-check ms-2">
						<input type="checkbox"
							class="form-check-input border-0 rounded-0 p-2" name="remember"
							id="exampleCheck1"> <label
							class="form-check-label text-secondary" for="exampleCheck1">Nhớ
							tài khoản</label>
					</div>
					<div class="forgot">
						<a class="text-secondary" href="ForgotPassword">Quên mật khẩu?</a>
					</div>
				</div>
				<div class="mb-3  text-center">
					<button type="submit"
						class="btn btn-primary fw-bold rounded-5 fs-5 w-100"
						style="padding: 12px 0;">Đăng nhập</button>
				</div>
				<div class="">
					<div class="w-100 position-relative p-2">
						<div class="position-absolute z-1 text-secondary text-center"
							style="right: 25%; top: 12px; left: 25%; background-color: #fff;">Hoặc
							đăng nhập với</div>
						<hr>
					</div>
				</div>

				<div class="box__icon mb-4 d-flex justify-content-center">
					<a href="#" class="btn fw-bold border-0 fs-6 me-3"> <img
						src="images/facebook.png" class="" alt="" width="30px"></a> <a
						href="#" class="btn fw-bold border-0 fs-6 me-3"> <img
						src="images/google.png" class="" alt="" width="30px"></a> <a
						href="#" class="btn fw-bold border-0 fs-6"> <img
						src="images/twitter.png" class="" alt="" width="30px"></a>
				</div>

				<div class=" text-center text-secondary">
					Bạn chưa có tài khoản? <a class="fw-bold text-secondary ms-1"
						href="Registration">Đăng ký</a>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/sites/commons/modalMessage.jsp"></jsp:include>