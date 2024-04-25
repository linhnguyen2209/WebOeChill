<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div
	class="d-flex justify-content-center align-items-center w-100 vh-100">
	<div class="row h-100 w-100">
		<div
			class="col-12 col-md-10 col-lg-7 col-xl-4 d-flex justify-content-center align-items-center m-auto">
			<form action="ChangePassword" method="post" class="form p-5 rounded-3 border border-3 mx-3 mx-lg-0">
				<h2 class="mb-4 p-2 text-center fs-2 fw-bold ">Đổi mật khẩu</h2>
				<div class="position-relative input__item"
					style="margin-bottom: 20px;">
					<label for="username" class="form-label fs-3 position-absolute"><i
						class="bi bi-person-fill"></i></label> <input type="text"
						class="w-100 rounded-5" id="username" name="username" value="${username}"
						aria-describedby="usernameHelp" placeholder="Tên đăng nhập"
						required readonly>
					<div id="usernameHelp" class="form-text"></div>
				</div>
				<div class="position-relative input__item"
					style="margin-bottom: 20px;">
					<label for="currentPass" class="form-label fs-4 position-absolute"><i
						class="fa-solid fa-lock"></i></label> <input type="password"
						class="w-100 rounded-5" id="currentPass" name="oldPassword"
						aria-describedby="currentPassHelp" placeholder="Mật khẩu hiện tại"
						required>
					<div id="currentPassHelp" class="form-text"></div>
				</div>
				<div class="position-relative input__item"
					style="margin-bottom: 20px;">
					<label for="newPass" class="form-label fs-4 position-absolute"><i
						class="fa-solid fa-user-lock"></i></label> <input type="password"
						class="w-100 rounded-5" id="newPass" name="newPassword"
						aria-describedby="newPassHelp" placeholder="Mật khẩu mới" required>
					<div id="newPassHelp" class="form-text"></div>
				</div>
				<div class="position-relative input__item"
					style="margin-bottom: 20px;">
					<label for="confirmNewPass"
						class="form-label fs-4 position-absolute"><i
						class="bi bi-check-circle"></i></label> <input type="password"
						class="w-100 rounded-5" id="confirmNewPass" name="confirmPassword"
						aria-describedby="confirmNewPassHelp"
						placeholder="Xác nhận mật khẩu" required>
					<div id="confirmNewPassHelp" class="form-text"></div>
				</div>
				<div class="mb-3 text-center">
					<button type="submit"
						class="btn btn-primary fw-bold rounded-5 fs-5 w-100"
						style="padding: 12px 0;">Tiếp theo</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/sites/commons/modalMessage.jsp"></jsp:include>