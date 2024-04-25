<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section id="animation__videos" class="section-4 w-100 ">
	<h3 class="title fw-bold mb-3 text-start">Video đã thích</h3>
	<div class="box__videos">
		<div class="row">
			<c:forEach var="video" items="${videos}">
				<div class="col-6 col-sm-4 col-md-3 col-lg-2 mb-3">
					<div class="card text-decoration-none" style="width: 100%;">
						<div class="card__head">
							<div class="overlay">
								<div class="btn d-flex align-items-center"
									style="cursor: inherit;">
									<a href="LikeVideo?videoId=${video.videoId}&page=Favourite"
										class="me-4 like-button"> <c:if test="${video.liked}">
											<i class="fa-solid fa-heart fs-4 text-danger"></i>
										</c:if> <c:if test="${!video.liked}">
											<i class="fa-regular fa-heart fs-4"
												style="color: rgb(187, 183, 183);"></i>
										</c:if>
									</a> <a href="Detail?videoId=${video.videoId}" class="me-4"> <i
										class="fa-solid fa-circle-play fs-4"
										style="color: var(--text-orange);"></i></a>
									<button class="bg-transparent border-0" data-bs-toggle="modal"
										data-bs-target="#shareModal" data-video-id="${video.videoId}">
										<i class="bi bi-share-fill fs-5"
											style="color: var(--primary-color);"></i>
									</button>
								</div>
							</div>
							<img src="${video.poster}"
								class="card-img-top object-fit-cover rounded-2"
								alt="Image_course" height="250">
						</div>
						<div class="card__body mt-3 ">
							<h6
								class="card__title text-truncate text-capitalize text-capitalize mb-1">
								${video.title}</h6>
							<small class=""> <i class="bi bi-eye me-2"></i>${video.views}
							</small>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${totalPage!=0}">
			<nav aria-label="Page navigation example"
				class="w-100 d-flex justify-content-center py-5">
				<ul class="pagination" id="pagination">
					<li class="page-item"><a id="firstPageLink"
						class="page-link text-white"
						href="Favourite?pageNumber=1&pageSize=12">First</a></li>
					<c:forEach begin="1" end="${totalPage}" var="index">
						<li class="page-item"><a id="pageLink${index}"
							class="page-link text-white ${index==pageCurrent?'active':''}"
							href="Favourite?pageNumber=${index}&pageSize=12">${index}</a></li>
					</c:forEach>
					<li class="page-item"><a id="lastPageLink"
						class="page-link text-white"
						href="Favourite?pageNumber=${totalPage}&pageSize=12">Last</a></li>
				</ul>
			</nav>
		</c:if>
		<c:if test="${totalPage==0}">
			<h5 class="text-center my-4 text-white-50">Chưa có video nào được yêu thích.</h5>
		</c:if>
	</div>
</section>

