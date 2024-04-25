<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div
	class="d-flex justify-content-center align-items-center w-100 vh-100">
	<div class="row h-100 w-100">
		<div
			class="col-12 col-md-10 col-lg-7 col-xl-4  d-flex justify-content-center align-items-center m-auto">
			<form action="EditProfile" method="post"
				class="form p-5 rounded-3 border border-3 mx-3 mx-lg-0">
				<h2 class="mb-4 p-2 text-center fs-2 fw-bold ">Hồ sơ của bạn</h2>
				<div class="position-relative input__item"
					style="margin-bottom: 20px;">
					<label for="username" class="form-label fs-3 position-absolute"><i
						class="bi bi-person-fill"></i></label> <input type="text"
						class="w-100 rounded-5" name="username" value="${user.username}"
						id="username" aria-describedby="usernameHelp"
						placeholder="Tên đăng nhập" required readonly>
					<div id="usernameHelp" class="form-text"></div>
				</div>
				<div class=" position-relative input__item"
					style="margin-bottom: 25px;">
					<label for="fullname" class="form-label fs-4 position-absolute"><i
						class="fa-solid fa-signature"></i></label> <input type="text"
						class="w-100 rounded-5" name="fullName" value="${user.fullName}"
						id="fullname" aria-describedby="fullnameHelp"
						placeholder="Họ và tên" required>
					<div id="fullnameHelp" class="form-text"></div>
				</div>
				<div class=" position-relative input__item"
					style="margin-bottom: 25px;">
					<label for="email" class="form-label fs-4 position-absolute"><i
						class="bi bi-envelope-fill"></i></label> <input type="email"
						class="w-100 rounded-5" name="email" value="${user.email}"
						id="email" aria-describedby="emailHelp" placeholder="Email"
						required>
					<div id="emailHelp" class="form-text"></div>
				</div>
				<div class="position-relative input__item"
					style="margin-bottom: 15px;">
					<label for="currentPass" class="form-label fs-4 position-absolute"><i
						class="fa-solid fa-lock"></i></label> <input type="password"
						class="w-100 rounded-5" name="password" value="${user.password}"
						id="currentPass" aria-describedby="currentPassHelp"
						placeholder="Mật khẩu" required readonly>
					<div id="currentPassHelp" class="form-text"></div>
				</div>
				<div class="changePass mb-3 w-100 d-flex justify-content-end">
					<a class="text-secondary me-2" href="ChangePassword">Đổi mật khẩu?</a>
				</div>
				<div class="mb-3 text-center">
					<button type="submit"
						class="btn btn-primary fw-bold rounded-5 fs-5 w-100"
						style="padding: 12px 0;">Cập nhật</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/sites/commons/modalMessage.jsp"></jsp:include>
