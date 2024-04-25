<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<section class="section-1 w-100 mt-3 ">
	<h3 class="title fw-bold mb-3 text-start">
		Đề xuất hot <i class="bi bi-fire text-danger"></i>
	</h3>
	<div class="box__videos">
		<div class="row">
			<c:forEach var="video" items="${videos}">
				<div class="col-6 col-sm-4 col-md-3 col-lg-2 mb-3">
					<div class="card text-decoration-none" style="width: 100%;">
						<div class="card__head">
							<div class="overlay">
								<div class="btn d-flex align-items-center"
									style="cursor: inherit;">
									<a href="LikeVideo?videoId=${video.videoId}&page=HomePage"
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
		<nav aria-label="Page navigation example"
			class="w-100 d-flex justify-content-center py-5">
			<ul class="pagination" id="pagination">
				<li class="page-item"><a id="firstPageLink"
					class="page-link text-white"
					href="HomePage?pageNumber=1&pageSize=6">First</a></li>
				<c:forEach begin="1" end="${totalPage}" var="index">
					<li class="page-item"><a id="pageLink${index}"
						class="page-link text-white ${index==pageCurrent?'active':''}"
						href="HomePage?pageNumber=${index}&pageSize=6">${index}</a></li>
				</c:forEach>
				<li class="page-item"><a id="lastPageLink"
					class="page-link text-white"
					href="HomePage?pageNumber=${totalPage}&pageSize=6">Last</a></li>
			</ul>
		</nav>

	</div>
</section>
<section class="section-2 w-100 mt-1">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-lg-6 mb-5 mb-lg-0">
				<img class="w-100 object-fit-cover px-5" src="images/banner2.png"
					alt="Ảnh">
			</div>
			<div class="col-12 col-lg-6 ">
				<h3 class="title fw-bold text-uppercase mb-2">Hãy trở thành
					thành viên VIP của OE CHILL ngay hôm nay</h3>
				<span class="d-block fst-italic fw-bold">Nơi bạn có thể khám
					phá một thế giới đa dạng của các bộ phim từ các thể loại khác nhau,
					từ hành động... </span>
				<ul class="list-unstyled my-4">
					<li class="list_item mb-2"><i
						class="bi bi-check-circle me-2 text-success"></i>Trải nghiệm xem
						phim không giới hạn từ thư viện phim đa dạng và phong phú.</li>
					<li class="list_item mb-2"><i
						class="bi bi-check-circle me-2 text-success"></i>Tham gia cộng
						đồng VIP, nhận đề xuất phim hàng ngày, hàng tuần.</li>
					<li class="list_item mb-2"><i
						class="bi bi-check-circle me-2 text-success"></i>Đặc quyền xem
						trước các bộ phim mới ra mắt và tham gia sự kiện độc quyền.</li>
				</ul>
				<div class="text-center text-lg-start">
					<a href="#" class="btn btn-outline-danger btn-lg mt-3 w-75">Đăng
						kí ngay</a>
				</div>

			</div>
		</div>
		<div class="box__quantity row text-center mt-3">
			<div class="col-3">
				<h1 class="fw-bold mb-0" style="color: var(--text-orange);">2320</h1>
				<span>Video</span>
			</div>
			<div class="col-3">
				<h1 class="fw-bold mb-0" style="color: var(--text-orange);">521</h1>
				<span>Nhân viên</span>
			</div>
			<div class="col-3">
				<h1 class="fw-bold mb-0" style="color: var(--text-orange);">1,463</h1>
				<span>Thành viên VIP</span>
			</div>
			<div class="col-3">
				<h1 class="fw-bold mb-0" style="color: var(--text-orange);">59</h1>
				<span>Đối tác</span>
			</div>
		</div>
	</div>
</section>
<section id="watched__videos" class="section-3 w-100 ">
	<h3 class="title fw-bold mb-3 text-start">
		Đã xem gần đây <i class="bi bi-clock fs-4 ms-1 text-danger"></i>
	</h3>
	<div class="box__videos">
		<div class="row">
			<c:forEach var="video" items="${videos}">
				<div class="col-6 col-sm-4 col-md-3 col-lg-2 mb-3">
					<div class="card text-decoration-none" style="width: 100%;">
						<div class="card__head">
							<div class="overlay">
								<div class="btn d-flex align-items-center"
									style="cursor: inherit;">
									<a href="#" class="me-4"> <i
										class="fa-regular fa-heart fs-4"
										style="color: rgb(187, 183, 183);"></i></a> <a href="#"
										class="me-4"> <i class="fa-solid fa-circle-play fs-4"
										style="color: var(--text-orange);"></i></a>
									<button class="bg-transparent border-0" data-bs-toggle="modal"
										data-bs-target="#share">
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
							<small class=""> <i class="bi bi-eye me-2"></i>4.234
							</small>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<nav aria-label="Page navigation example"
			class="w-100 d-flex justify-content-center py-5">
			<ul class="pagination">
				<li class="page-item"><a class="page-link text-white" href="#">First</a></li>
				<c:forEach begin="1" end="${totalPage}" var="index">
					<li class="page-item"><a class="page-link text-white"
						href="HomePage?pageNumber=${index}&pageSize=6">${index}</a></li>
				</c:forEach>
				<li class="page-item"><a class="page-link text-white" href="#">Last</a></li>
			</ul>
		</nav>
	</div>
</section>
<section id="animation__videos" class="section-4 w-100 ">
	<h3 class="title fw-bold mb-3 text-start">Video đã thích</h3>
	<div id="videos__animation" class="carousel slide carousel-fade"
		data-bs-ride="true" data-interval="7000">
			<div class="carousel-inner">
			<c:forEach begin="1" end="${totalPage}" var="index">
				<div class="carousel-item ${index==pageCurrent?'active':''}">
					<div class="row">
						<c:forEach var="video" items="${videos}">
							<div class="col-6 col-sm-4 col-md-3 col-lg-2 mb-3">
								<div class="card text-decoration-none" style="width: 100%;">
									<div class="card__head">
										<div class="overlay">
											<div class="btn d-flex align-items-center"
												style="cursor: inherit;">
												<a href="#" class="me-4"> <i
													class="fa-regular fa-heart fs-4"
													style="color: rgb(187, 183, 183);"></i></a> <a href="#"
													class="me-4"> <i class="fa-solid fa-circle-play fs-4"
													style="color: var(--text-orange);"></i></a>
												<button class="bg-transparent border-0"
													data-bs-toggle="modal" data-bs-target="#share">
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
										<small class=""> <i class="bi bi-eye me-2"></i>4.234
										</small>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
		<button class="btn__control-slide carousel-control-prev my-auto"
			type="button" data-bs-target="#videos__animation"
			data-bs-slide="prev">
			<i class="fa-solid fa-chevron-left fs-2"></i>
		</button>
		<button class="btn__control-slide carousel-control-next my-auto"
			type="button" data-bs-target="#videos__animation"
			data-bs-slide="next">
			<i class="fa-solid fa-chevron-right fs-2 "></i>
		</button>
	</div>
</section>
<section class="section-5 w-100 mb-5">
	<div class="head__review">
		<h4 class="title text-center fw-bold text-uppercase ">Đánh giá
			của người xem</h4>
		<span class="text-center d-block fw-bold mb-4 ">Người xem đã
			trải nghiệm và đánh giá về OE CHILL</span>
	</div>
	<div id="reviews" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="box__review text-center mx-auto w-50">
					<img src="images/customer-4-150x150.png"
						class=" object-fit-cover mb-3 " alt="..." width="80px"
						height="80px">
					<p class="d-block mb-2 fst-italic">Tôi thích cách mà OE CHILL
						tổ chức các danh mục phim, giúp tôi dễ dàng tìm kiếm những bộ phim
						yêu thích của mình. Chất lượng hình ảnh và âm thanh cũng rất tốt!</p>
					<span class="d-block fst-italic fs-4 fw-bold"
						style="color: var(--primary-color);">Nguyễn Chí Linh /<span
						class="ms-2 title">Thành Viên VIP</span></span>
				</div>
			</div>
			<div class="carousel-item">
				<div class="box__review text-center mx-auto w-50">
					<img src="images/customer-3-150x150.png"
						class=" object-fit-cover mb-3 " alt="..." width="80px"
						height="80px">
					<p class="d-block mb-2 fst-italic">Phim này quá tuyệt vời! Tôi
						thực sự bị cuốn hút bởi cốt truyện và diễn xuất của các diễn viên.
						Cảm ơn trang web phim của bạn đã mang lại cho tôi một trải nghiệm
						giải trí đỉnh cao!</p>
					<span class="d-block fst-italic fs-4 fw-bold"
						style="color: var(--primary-color);">Lê Thị Quỳnh Trang /<span
						class="ms-2 title">Web Programming</span></span>
				</div>
			</div>
			<div class="carousel-item">
				<div class="box__review text-center mx-auto w-50">
					<img src="images/customer-2-150x150.png"
						class=" object-fit-cover mb-3 " alt="..." width="80px"
						height="80px">
					<p class="d-block mb-2 fst-italic">Trang web phim này có một
						thư viện phim rất lớn với nhiều thể loại khác nhau. Tôi đã tìm
						thấy những bộ phim cũ yêu thích của mình và cũng phát hiện ra
						những bộ phim mới thú vị. Cảm ơn!</p>
					<span class="d-block fst-italic fs-4 fw-bold"
						style="color: var(--primary-color);">Nguyễn Thị Thanh Nhàn
						/<span class="ms-2 title">Mobile Programming</span>
					</span>
				</div>
			</div>
		</div>
		<button class="btn__control carousel-control-prev my-auto"
			type="button" data-bs-target="#reviews" data-bs-slide="prev">
			<i class="bi bi-caret-left-fill d-flex fs-4 text-dark m-auto"></i>
		</button>
		<button class="btn__control carousel-control-next my-auto"
			type="button" data-bs-target="#reviews" data-bs-slide="next">
			<i class="bi bi-caret-right-fill d-flex fs-4 text-dark m-auto"></i>
		</button>
	</div>
</section>
<jsp:include page="/sites/commons/modalMessage.jsp"></jsp:include>
<script>
	// Sử dụng DOMContentLoaded để đảm bảo các phần tử đã được tải hoàn toàn
	document.addEventListener('DOMContentLoaded', function() {
		// Lưu vị trí hiện tại của trang khi trang được load
		const saveCurrentPagePosition = function() {
			const currentPosition = {
				top : window.scrollY,
				left : window.scrollX
			};
			localStorage.setItem('savedPagePosition', JSON
					.stringify(currentPosition));
		};

		// Thêm sự kiện scroll để lưu vị trí mới khi người dùng scroll trang
		window.addEventListener('scroll', saveCurrentPagePosition);

		// Khôi phục lại vị trí sau khi load trang
		const restorePagePosition = function() {
			const storedPosition = localStorage.getItem('savedPagePosition');
			if (storedPosition) {
				const position = JSON.parse(storedPosition);
				// Sử dụng window.scrollTo để di chuyển trang đến vị trí đã lưu
				window.scrollTo(position.left, position.top); // -300 px để cách mép trên ra sau khi load
			}
		};

		// Gọi hàm khôi phục vị trí khi trang được load lại
		restorePagePosition();

		// Xóa dữ liệu vị trí đã lưu sau khi sử dụng để tránh lưu lại vị trí cũ khi load lại trang lần tiếp theo
		localStorage.removeItem('savedPagePosition');

		// Lưu vị trí mới khi người dùng rời khỏi trang
		window.addEventListener('beforeunload', saveCurrentPagePosition);
	});
</script>