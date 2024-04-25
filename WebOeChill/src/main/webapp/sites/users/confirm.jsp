<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div
	class="container vh-100 d-flex justify-content-center align-items-center">
	<div class="row h-100 w-100">
		<div
			class="col-xl-7 d-none d-xl-flex justify-content-center align-items-center">
			<img class="object-fit-cover w-75"
				src="images/login_img-removebg.png" alt="login">
		</div>
		<div
			class="col-12 col-md-10 col-lg-7 col-xl-5 d-flex justify-content-center align-items-center m-auto">
			<div class="form p-5 rounded-3">
				<h2 class="mb-4 p-2 text-center fs-2 fw-bold">XÁC NHẬN</h2>
				<div class=" position-relative input__item"
					style="margin-bottom: 15px;">
					<label for="confirm" class="form-label fs-4 position-absolute"><i
						class="fa-solid fa-code-compare"></i></label> <input type="text"
						class="w-100 rounded-5 " id="confirm"
						aria-describedby="confirmHelp" placeholder="Nhập mã xác nhận"
						required>
					<div id="confirmHelp" class="message form-text ms-3">Vui lòng
						nhập mã xác nhận đã được gửi về email của bạn!</div>
				</div>
				<div class="mb-3  text-center">
					<button type="submit"
						class="btn btn-primary fw-bold rounded-5 fs-5 w-100"
						style="padding: 12px 0;">Xác nhận</button>
				</div>
			</div>
		</div>
	</div>
</div>