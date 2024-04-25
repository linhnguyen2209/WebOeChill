<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="row mt-3 ">
	<h2 class="text-white w-100 p-0 mb-3 fw-bold">Video Management</h2>
	<ul class="nav nav-tabs" id="tabVideoManagement" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active fw-bold" id="videoEdition-tab"
				data-bs-toggle="tab" data-bs-target="#videoEdition-tab-pane"
				type="button" role="tab" aria-controls="videoEdition-tab-pane"
				aria-selected="true">Video Edition</button>
		</li>
		<li class="nav-item fw-bold" role="presentation">
			<button class="nav-link" id="videoList-tab" data-bs-toggle="tab"
				data-bs-target="#videoList-tab-pane" type="button" role="tab"
				aria-controls="videoList-tab-pane" aria-selected="false">Video
				List</button>
		</li>
	</ul>
	<div class="tab-content p-0" id="tabVideoManagementContent">
		<div class="tab-pane show fade active" id="videoEdition-tab-pane"
			role="tabpanel" aria-labelledby="videoEdition-tab" tabindex="0">
			<form action="" method="post" enctype="multipart/form-data"
				class="px-3 py-4 d-flex justify-content-center border bg-gradient">
				<div class="row w-100 p-0">
					<div class="col-12 col-lg-5 col-xl-4 mb-lg-0 mb-3">
						<div class="border p-4 rounded-3">
							<div class="input-group">
								<input type="file" class="form-control d-none" id="cover"
									name="cover"> <label for="cover"
									style="cursor: pointer;" class="text-center"><img
									src="${video.poster != null?video.poster : 'images/poster_default.png'}"
									alt="" class="object-fit-cover" width="100%" height="300"></label>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-7 col-xl-8 row p-0 m-0">
						<div class="form-group mb-3 col-12 col-md-6">
							<label for="videoID" class=" fw-bold text-light mb-2">Video
								ID</label> <input type="text" id="videoID"
								class="form-control rounded-2 bg-body-secondary" name="videoId"
								value="${video.videoId}" aria-describedby="youtubeIdHid"
								placeholder="" required> <small id="youtubeIdHid"
								class="form-text text-light">Youtube id is rquired</small>
						</div>
						<div class="form-group mb-3 col-12 col-md-6">
							<label for="videoTitle" class=" fw-bold text-light mb-2">Video
								Title</label> <input type="text"
								class="form-control  rounded-2 bg-body-secondary" name="title"
								value="${video.title}" aria-describedby="videoTitle"
								placeholder="" required> <small id="videoTitle"
								class="form-text text-light">Video title is rquired</small>
						</div>
						<div class="form-group mb-3 col-12 col-md-6">
							<label for="videoGenre" class=" fw-bold text-light mb-2">Video
								Genre</label> <input type="text"
								class="form-control  rounded-2 bg-body-secondary" name="genre"
								value="${video.genre}" aria-describedby="videoGenre"
								placeholder="" required> <small id="videoGenre"
								class="form-text text-light">Video genre is rquired</small>
						</div>
						<div class="form-group mb-3 col-12 col-md-6">
							<label for="duration" class=" fw-bold text-light mb-2">Duration</label>
							<input type="text"
								class="form-control  rounded-2 bg-body-secondary"
								name="duration" value="${video.duration}"
								aria-describedby="duration" placeholder="" required> <small
								id="duration" class="form-text text-light">Duration is
								rquired</small>
						</div>
						<div class="form-group mb-3 col-12 col-md-6">
							<label for="videoLink" class=" fw-bold text-light mb-2">Video
								Link</label> <input type="text"
								class="form-control  rounded-2 bg-body-secondary"
								name="videoLink" value="${video.videoLink}"
								aria-describedby="videoLink" placeholder="" required> <small
								id="videoLink" class="form-text text-light">Video link
								is rquired</small>
						</div>
						<div class="form-group mb-3 col-12 col-md-6">
							<label for="viewCount" class=" fw-bold text-light mb-2">View
								Count</label> <input type="text"
								class="form-control  rounded-2 bg-body-secondary" name="views"
								value="${video.views}" id="viewCount"
								aria-describedby="viewCountHid" placeholder="" required>
							<small id="viewCountHid" class="form-text text-light ">View
								count is required</small>
						</div>
						<div class="form-check form-check-inline col-12 ms-3 w-75">
							<label class="text-light"><input type="radio"
								class="form-check-input" name="active" value="true" id="status"
								${video.active ? 'checked' : ''}>Active</label> <label
								class="ms-5 text-light"><input type="radio"
								class="form-check-input" name="active" value="false"
								id="statusIn" ${!video.active ? 'checked' : ''}>Inactive</label>
						</div>
					</div>
					<div class="col-12 mt-3">
						<label for="description" class="text-light fw-bold mb-2">Description</label>
						<textarea name="description" id="description" cols="" rows="4"
							class="form-control">${video.description}</textarea>
					</div>
					<div class="col-12 mt-4 text-end">
						<button class="btn btn-outline-primary me-sm-2 mb-sm-0 mb-2"
							formaction="Admin/VideosManagement/create">Create</button>
						<button class="btn btn-outline-warning me-sm-2 mb-sm-0 mb-2"
							formaction="Admin/VideosManagement/update">Update</button>
						<button class="btn btn-outline-danger me-sm-2 mb-sm-0 mb-2"
							formaction="Admin/VideosManagement/delete">Delete</button>
						<button class="btn btn-outline-info"
							formaction="Admin/VideosManagement/reset">Reset</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videoList-tab-pane" role="tabpanel"
			aria-labelledby="videoList-tab" tabindex="0">
			<div class="px-4 py-4 bg-gradient border overflow-auto">
				<table class="table table-hover ">
					<!-- <caption>Basic Table</caption> -->
					<thead>
						<tr>
							<th scope="col" class="col-2 col-md-2">Youtube ID</th>
							<th scope="col" class="col-3 col-md-3">Video Title</th>
							<th scope="col" class="col-3 col-md-3 overflow-x-hidden">Video
								Genre</th>
							<th scope="col" class="col-1 col-md-1">Duration</th>
							<th scope="col" class="col-1 col-md-1">View count</th>
							<th scope="col" class="col-1 col-md-1">Status</th>
							<th scope="col" class="col-1 col-md-1"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${videos}">
							<tr>
								<td scope="row">${item.videoId}</td>
								<td>${item.title}</td>
								<td>${item.genre}</td>
								<td>${item.duration}</td>
								<td>${item.views}</td>
								<td>${item.active?'Hoạt động':'Không hoạt động'}</td>
								<td><a
									href="Admin/VideosManagement/edit?videoId=${item.videoId}&currentTab=1"
									class="pe-3"><i class="bi bi-pencil"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-12 mt-4 d-flex justify-content-between  w-100">
					<div class="total_item text-white fs-5 ">${totalVideos}
						videos</div>
					<div>
						<a
							href="Admin/VideosManagement?currentPageNumberParam=1&currentTab=2"
							class="btn btn-outline-danger me-sm-2 mb-sm-0 ${currentPageAttr==1?'disabled-link':''}"
							onclick="handleClick(event)"> <i
							class="fa-solid fa-backward-fast"></i>
						</a> <a
							href="Admin/VideosManagement?currentPageNumberParam=${currentPageAttr-1}&currentTab=2"
							class="btn btn-outline-danger me-sm-2 mb-sm-0 ${currentPageAttr==1?'disabled-link':''}"
							onclick="handleClick(event)"> <i
							class="fa-solid fa-backward-step"></i>
						</a> <a
							href="Admin/VideosManagement?currentPageNumberParam=${currentPageAttr+1}&currentTab=2"
							class="btn btn-outline-danger me-sm-2 mb-sm-0 ${currentPageAttr==totalPage?'disabled-link':''}"
							onclick="handleClick(event)"> <i
							class="fa-solid fa-forward-step"></i>
						</a> <a
							href="Admin/VideosManagement?currentPageNumberParam=${totalPage}&currentTab=2"
							class="btn btn-outline-danger ${currentPageAttr==totalPage?'disabled-link':''}"
							onclick="handleClick(event)"> <i
							class="fa-solid fa-forward-fast"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/sites/commons/modalMessage.jsp"></jsp:include>
<script>
	function handleClick(event) {
		// Kiểm tra xem liên kết có class 'disabled-link' hay không
		if (event.target.classList.contains('disabled-link')) {
			// Nếu có class 'disabled-link', ngăn chặn hành động mặc định của liên kết
			event.preventDefault();
		}
	}

	// đặt lại trạng thái khi load
	document.addEventListener('DOMContentLoaded', function() {
		var tabButton;
		if(${currentTabAttr}==1){
			tabButton = document.querySelector('button[data-bs-target="#videoEdition-tab-pane"]');
			
		}else{
			tabButton = document.querySelector('button[data-bs-target="#videoList-tab-pane"]');
		}
		if (tabButton) {
			var tabInstance = new bootstrap.Tab(tabButton);
			tabInstance.show();
		}
	});
</script>