<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="section-1 row d-flex" style="padding-top: 100px">
	<div class="box__left col-12 col-lg-8">
		<iframe width="100%" height="500" src="${video.videoLink}"
			title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
			referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

		<div class="box__video-content">
			<div class="box__title d-flex align-items-center  ">
				<h3 class="title__video text-white text-capitalize py-3">${video.title}</h3>
				<div class="box_icon ms-auto">
					<a
						href="LikeVideo?videoId=${video.videoId}&page=Detail?videoId=${video.videoId}"
						class="me-3 like-button text-decoration-none"> <c:if
							test="${video.liked}">
							<i class="fa-solid fa-heart fs-4"
								style="color: var(--primary-color);"></i>
						</c:if> <c:if test="${!video.liked}">
							<i class="fa-regular fa-heart fs-4"
								style="color: var(--primary-color);"></i>
						</c:if>
					</a>
					<button class="bg-transparent border-0" data-bs-toggle="modal"
						data-bs-target="#shareModal" data-video-id="${video.videoId}">
						<i class="bi bi-share-fill fs-5"
							style="color: var(--primary-color);"></i>
					</button>
				</div>
			</div>
			<div class="box__content mt-2">
				<div class="box__hot d-flex mb-3">
					<div class="box__left d-flex">
						<div class="item-1 px-2">Top 1</div>
						<div class="item-2 text-capitalize text-white px-2">Top phim
							thịnh hành</div>
					</div>
					<div class="box__right fw-bold text-dark px-2 ms-2">VIP</div>
					<a href="#" class="review text-decoration-none">Tôi muốn đánh
						giá</a>
				</div>
				<div class="box__info d-flex align-items-center mb-3">
					<span class="item__rating" style="color: var(--primary-color);"><i
						class="bi bi-star-fill me-2"></i>9.2</span>
					<div class="vertical__brick mx-3"></div>
					<span class="item__year">2024</span>
					<div class="vertical__brick mx-3"></div>
					<span class="item_time">45 phút</span>
					<div class="vertical__brick mx-3"></div>
					<span class="item__update">Trọn bộ 12 tập</span>
				</div>
				<ul class="box__category list-unstyled mb-3 d-sm-flex d-none"
					style="font-size: 14px;">
					<c:forEach var="g" items="${genres}">
						<li class="category__item text-capitalize me-2 px-1"><a
							href="#">${g}</a></li>
					</c:forEach>
				</ul>
				<div class="box__description text-start mt-4 position-relative">
					<span class="text-white-50 me-1">Miêu tả:</span> <small
						class="text-light hidden d-flex">${video.description}</small>
					<button
						class="btn btn-sm position-absolute end-0 dropdown-toggle px-2">Hiển
						thị thêm</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-lg-4">
		<h4 class="title py-1  d-block px-2">Đề xuất cho bạn</h4>
		<ul class="list__video list-unstyled w-100 overflow-y-auto py-1">
			<c:forEach var="item" items="${videos}">
				<li class="item__poster"><a
					href="Detail?videoId=${item.videoId}"
					class="text-decoration-none d-flex p-2 "> <span
						class="poster__head position-relative"><img
							src="${item.poster}" class="object-fit-cover rounded-3"
							height="60px" width="110px" alt=""> <span
							class="badge position-absolute"
							style="background: #000000c4; right: 3%; bottom: 5px;">${item.duration}</span>
					</span> <span
						class="poster__body  text-capitalize ms-2 fw-bold text-light">${item.title}</span>
				</a></li>
			</c:forEach>
		</ul>
	</div>
</section>