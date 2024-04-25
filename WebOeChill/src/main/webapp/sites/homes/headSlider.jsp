<%@page import="edu.poly.model.Video"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-fluid p-0 overflow-hidden ">
	<div id="slideHead" class="carousel slide" data-bs-ride="carousel"
		data-interval="4000" data-bs-pause="false">
		<div class="carousel-indicators d-none d-md-flex justify-content-end"
			style="margin: 0 80px 90px 0;">
			<c:forEach var="i" begin="0" end="5">
				<button type="button" data-bs-target="#slideHead"
					data-bs-slide-to="${i}" class="${i==0?'active':''}"
					aria-current="${i==0?'true':''}" aria-label="Slide ${i+1}"></button>
			</c:forEach>
		</div>
		<div class="carousel-inner">
			<c:forEach var="slide" items="${slides}">
				<div class="carousel-item ${slide.videoId==firstSlide?'active':''}">
					<a href="Detail?videoId=${slide.videoId}"
						class="item__wrapper text-white" style="text-decoration: none;">
						<img src="${slide.poster}"
						class="d-block w-100 vh-100 object-fit-cover" alt="Slide">

						<div
							class="carousel-caption text-start w-75 d-flex flex-column align-items-start">
							<h1 class="video__title text-capitalize text-white mb-3"
								style="font-family: cursive;">${slide.title}</h1>
							<div class="box__hot d-flex mb-3">
								<div class="box__left d-flex">
									<div class="item-1 px-2">HOT</div>
									<div class="item-2 text-capitalize text-white px-2">Top
										phim thịnh hành</div>
								</div>
								<div class="box__right fw-bold text-dark px-2 ms-2">VIP</div>
							</div>
							<div class="box__info d-flex align-items-center mb-3">
								<span class="item__rating" style="color: var(--primary-color);"><i
									class="bi bi-star-fill me-2"></i>${slide.reviewCount}</span>
								<div class="vertical__brick mx-3"></div>
								<span class="item__year">2024</span>
								<div class="vertical__brick mx-3"></div>
								<span class="item_time">45 phút</span>
								<div class="vertical__brick mx-3"></div>
								<span class="item__update">Phim bộ</span>
							</div>
							<c:set var="genres" value="${slide.genre.split(', ')}" />

							<!-- Hiển thị danh sách thể loại -->
							<ul class="box__category list-unstyled mb-3 d-sm-flex d-none"
								style="font-size: 14px;">
								<c:forEach var="genre" items="${genres}">
									<li class="category__item text-capitalize me-2 px-1">${genre}</li>
								</c:forEach>
							</ul>
							<div
								class="box__description overflow-y-hidden text-start mb-4 d-none d-sm-block"
								style="width: 500px; max-height: 98px;">${slide.description}</div>
							<div class="box__btn d-flex align-items-center">
								<a href="Detail?videoId=${slide.videoId}"
									class="btn_watch btn me-4 d-flex justify-content-center align-items-center fs-4 rounded-circle"
									style="background-color: var(--primary-color); width: 55px; height: 55px;"><i
									class="fa-solid fa-play text-white ms-1 "></i></a> <a
									href="LikeVideo?videoId=${slide.videoId}&page=HomePage"
									title="Thích video này"
									class="btn__like btn me-4 d-flex justify-content-center align-items-center fs-3 rounded-circle bg-primary"
									style="width: 55px; height: 55px;"> <c:if
										test="${!slide.liked}">
										<i class="fa-solid fa-thumbs-up text-white"></i>
									</c:if> <c:if test="${slide.liked}">
										<i class="fa-solid fa-thumbs-down text-white"></i>
									</c:if>
								</a>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>

			<button class="btn__control carousel-control-prev my-auto"
				type="button" data-bs-target="#slideHead" data-bs-slide="prev">
				<i class="fa-solid fa-chevron-left fs-1"></i>
			</button>
			<button class="btn__control carousel-control-next my-auto"
				type="button" data-bs-target="#slideHead" data-bs-slide="next">
				<i class="fa-solid fa-chevron-right fs-1 "></i>
			</button>
		</div>

	</div>
</div>