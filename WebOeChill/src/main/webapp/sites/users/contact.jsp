<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="container w-100">
	<div class="row p-3">
		<div class="contact-info col-12 col-lg-6 container px-3">
			<h4 class="fw-bold title">Thông tin liên hê:</h4>
			<div class="info-inner row mx-0">
				<p class="col-6 my-auto text-light">
					<i class="fa-solid fa-map-location-dot"></i> 15 Mộc Bài 7, Hòa
					Minh, Liên Chiểu, Đà Nẵng
				</p>
				<p class="col-6 text-light">
					<i class="fa-regular fa-envelope"></i> <a href="">linhli2k4@gmail.com</a>
				</p>
			</div>

			<div class="info-inner row py-5 mx-0 ">
				<p class="col-6 my-auto text-light">
					<i class="fa-solid fa-phone"></i> <a href="">0888372325</a>
				</p>
				<p class="col-6 my-auto text-light">
					<i class="fa-brands fa-skype"></i> <a href="">oechillcompany</a>
				</p>
			</div>

			<div class="box-icon">
				<a href="https://www.facebook.com/anhtruong.nguyenvan.39"><i
					class="fa-brands fa-facebook"></i></a> <a href="#"><i
					class="fa-brands fa-instagram"></i></a> <a href="#"><i
					class="fa-brands fa-twitter"></i></a>
			</div>
		</div>
		<div class="map col-12 col-lg-6 px-3">
			<h4 class="fw-bold title">Vị trí trên bản đồ:</h4>
			<div class="ratio ratio-16x9">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1917.0272881865262!2d108.16107463641428!3d16.062657452123165!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421923de7dd32f%3A0x68cdfba72c14773b!2zTeG7mWMgQsOgaSA3LCBMacOqbiBDaGnhu4N1LCDEkMOgIE7hurVuZyA1NTAwMDAsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1677081036929!5m2!1svi!2s"
					style="border: 0;" allowfullscreen="" loading="lazy"
					referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
		</div>
	</div>
	<div class="row p-3">
		<div class="container col-12 col-lg-6 px-3">
			<h4 class="fw-bold title pt-0">Ý kiến đóng gióp:</h4>
			<div class="row mb-5">
				<div class="col-6 p-2">
					<input type="text" class="form-control py-2" required
						placeholder="Họ và Tên">
				</div>
				<div class="col-6 p-2">
					<input type="email" class="form-control py-2" required
						placeholder="Email">
				</div>
				<div class="col-6 p-2">
					<input type="text" class="form-control py-2"
						placeholder="Số điện thoại">
				</div>
				<div class="col-6 p-2">
					<input type="text" class="form-control py-2" placeholder="Địa chỉ">
				</div>
				<div class="col-12 p-2">
					<textarea placeholder="Lời nhắn" name="note" class="form-control"
						rows="4"></textarea>
				</div>
				<div class="col-12 p-2 mt-1 ">
					<button class="btn btn-success  fw-bold w-50 d-block m-auto"
						type="submit">Gửi</button>
				</div>
			</div>
		</div>
		<div class="col-12 col-lg-6 px-3 ">
			<img class="object-fit-cover ratio ratio-16x9"
				src="images/bg-nhanxet.jpg" alt="" height="350px">
		</div>
	</div>
</section>