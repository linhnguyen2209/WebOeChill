<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="section-1 w-75 mx-auto" style="padding-top: 100px">
	<h4 class="title py-1  d-block px-2">Kết quả tìm kiếm
		(${totalVideos})</h4>

	<ul class="list__video list-unstyled w-100 py-2">
		<c:if test="${totalVideos > 0}">
			<c:forEach var="video" items="${videos}">
				<li class="item__poster p-2">
					<div class="d-flex">
						<div class="poster__head position-relative">
							<!-- Phần poster head -->
							<a href="Detail?videoId=${video.videoId}"
								class="text-decoration-none"> <img
								src="${video.poster}"
								class="object-fit-cover rounded-3" height="210px" width="170px"
								alt=""></a> <span class="badge position-absolute"
								style="background: #000000c4; right: 3%; bottom: 5px;">${video.duration}</span>
						</div>
						<!-- Phần poster body -->
						<div class="ms-3 d-flex flex-column text-start">
							<div class="item_title text-capitalize fs-4 text-light mb-3">
								<a href="Detail?videoId=${video.videoId}" class="text-decoration-none"
									style="color: var(--primary-color);">${video.title}</a>
							</div>
							<div class="item_content d-flex flex-column">
								<div
									class="item_year text-capitalize fw-bold text-white-50 d-flex mb-1"
									style="font-size: 16px;">
									Năm:<span class="ms-1 text-light">2024</span>
								</div>
								<div class="item_genre text-capitalize d-flex mb-1"
									style="font-size: 16px;">
									<span class="fw-bold text-white-50 text-nowrap">Thể
										loại:</span>
									<c:set var="genres" value="${video.genre.split(', ')}" />
									<ul
										class="box__category ms-2 list-unstyled d-flex align-items-center"
										style="font-size: 13px;">
										<c:forEach var="genre" items="${genres}">
											<li
												class="ategory__item text-capitalize d-flex align-items-center me-2 px-1">${genre}</li>
										</c:forEach>
									</ul>
								</div>
								<div
									class="item_rating text-capitalize fw-bold text-white-50 d-flex mb-1"
									style="font-size: 16px;">
									Đánh giá:
									<ul
										class="box_rating ms-2 list-unstyled d-flex align-items-center">
										<li class="star_item px-1"
											style="color: var(--primary-color);"><i
											class="bi bi-star-fill"></i></li>
										<li class="star_item px-1"
											style="color: var(--primary-color);"><i
											class="bi bi-star-fill"></i></li>
										<li class="star_item px-1"
											style="color: var(--primary-color);"><i
											class="bi bi-star-fill"></i></li>
										<li class="star_item px-1"
											style="color: var(--primary-color);"><i
											class="bi bi-star-fill"></i></li>
										<li class="star_item px-1"
											style="color: var(--primary-color);"><i
											class="bi bi-star"></i></li>
									</ul>
								</div>
								<div class="text-start fw-bold d-flex "
									style="width: 400px; font-size: 16px;">
									<span class="text-white-50 me-1 text-nowrap ">Mô tả:</span> <span
										class="text-light fw-normal text-truncate"
										style="font-size: 14px;">${video.description}</span>
								</div>
								<a href="Detail?videoId=${video.videoId}"
									class="btn btn-sm px-2 mt-3 px-0 btn-outline-danger w-25">Xem
									phim</a>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</c:if>
		<c:if test="${totalVideos <=0}">
			<h3 class="text-center text-white-50 mt-4">Không tìm thấy video nào giống với
				"${searchValue}" bạn đã nhập</h3>
		</c:if>
	</ul>
</section>