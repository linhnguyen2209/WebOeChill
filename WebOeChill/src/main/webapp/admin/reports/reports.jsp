<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="row mt-3 ">
	<h2 class="text-white w-100 p-0 mb-3 fw-bold ">Report - Statistic</h2>
	<ul class="nav nav-tabs" id="tabUserManagement" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active fw-bold" id="favorites-tab"
				data-bs-toggle="tab" data-bs-target="#favorites-tab-pane"
				type="button" role="tab" aria-controls="favorites-tab-pane"
				aria-selected="true">Favorites</button>
		</li>
		<li class="nav-item fw-bold" role="presentation">
			<button class="nav-link" id="favoriteUsers-tab" data-bs-toggle="tab"
				data-bs-target="#favoriteUsers-tab-pane" type="button" role="tab"
				aria-controls="favoriteUsers-tab-pane" aria-selected="false">Favorite
				Users</button>
		</li>
		<li class="nav-item fw-bold" role="presentation">
			<button class="nav-link" id="sharedFriends-tab" data-bs-toggle="tab"
				data-bs-target="#sharedFriends-tab-pane" type="button" role="tab"
				aria-controls="sharedFriends-tab-pane" aria-selected="false">Shared
				Friends List</button>
		</li>
	</ul>
	<div class="tab-content p-0" id="tabUserManagementContent">
		<div class="tab-pane show fade active" id="favorites-tab-pane"
			role="tabpanel" aria-labelledby="favorites-tab" tabindex="0">
			<div class="px-4 py-4 bg-gradient border overflow-auto">
				<table class="table table-hover ">
					<thead>
						<tr>
							<th scope="col" class="col-4 col-md-5">Video Title</th>
							<th scope="col" class="col-3 col-md-3">Favorite Count</th>
							<th scope="col" class="col-3 col-md-2">Latest Date</th>
							<th scope="col" class="col-2 col-md-2">Oldest Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${favList}">
							<tr>
								<td scope="row">${item.title}</td>
								<td>${item.likeCount}</td>
								<td>${item.newest}</td>
								<td>${item.oldest}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="tab-pane fade" id="favoriteUsers-tab-pane" role="tabpanel"
			aria-labelledby="favoriteUsers-tab" tabindex="0">
			<form action="" method="get"
				class="px-4 py-4 bg-gradient border overflow-auto">
				<div class="d-flex">
					<select class="form-select mb-3"
						aria-label="Default select example" name="cboVideoTitle"
						id="cboVideoTitle">
						<c:forEach var="item" items="${vList}">
							<option value="${item.videoId}"
								${item.videoId == videoUserId?'selected':''}>${item.title}</option>
						</c:forEach>
					</select>
					<button class="btn btn-primary btn-sm ms-3 mb-3">Report</button>
				</div>
				<table class="table table-hover ">
					<thead>
						<tr>
							<th scope="col" class="col-4 col-md-2">Username</th>
							<th scope="col" class="col-3 col-md-4">Fullname</th>
							<th scope="col" class="col-2 col-md-3">Email</th>
							<th scope="col" class="col-2 col-md-3">Favorite Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${favUsers}">
							<tr>
								<td scope="row">${item.username}</td>
								<td>${item.fullName}</td>
								<td>${item.email}</td>
								<td>${item.likedDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<div class="tab-pane fade" id="sharedFriends-tab-pane" role="tabpanel"
			aria-labelledby="sharedFriends-tab" tabindex="0">
			<form action="" method="get" class="px-4 py-4 bg-gradient border overflow-auto">
				<div class="d-flex">
					<select class="form-select mb-3"
						aria-label="Default select example" name="cboVideoTitleShare"
						id="cboVideoTitle">
						<c:forEach var="item" items="${vidList}">
							<option value="${item.videoId}"
								${item.videoId == videoShareId?'selected':''}>${item.title}</option>
						</c:forEach>
					</select>
					<button class="btn btn-primary btn-sm ms-3 mb-3">Report</button>
				</div>
				<table class="table table-hover ">
					<thead>
						<tr>
							<th scope="col" class="col-4 col-md-2">Sender Name</th>
							<th scope="col" class="col-3 col-md-4">Sender Email</th>
							<th scope="col" class="col-2 col-md-3">Receiver Email</th>
							<th scope="col" class="col-2 col-md-3">Sent Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${shareUsers}">
							<tr>
								<td scope="row">${item.senderName}</td>
								<td>${item.senderEmail}</td>
								<td>${item.receiverEmail}</td>
								<td>${item.sendDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</section>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Lưu trạng thái của tab được chọn vào localStorage khi tab được click
    document.querySelectorAll('button[data-bs-toggle="tab"]').forEach(function(tab) {
        tab.addEventListener('click', function(e) {
            localStorage.setItem('selectedTab', e.target.getAttribute('aria-controls'));
        });
    });

    // Đặt lại tab khi load lại trang
    var selectedTab = localStorage.getItem('selectedTab');
    if (!selectedTab) {
       // Nếu không có selectedTab trong localStorage, chọn tab đầu tiên làm mặc định
        var firstTab = document.querySelector('.nav-link[data-bs-target="#favorites-tab-pane"]');
        if (firstTab) {
            firstTab.classList.add('active', 'show');
        }
    }

    var tabButton = document.querySelector('button[data-bs-target="#' + selectedTab + '"]');
    if (tabButton) {
        var tabInstance = new bootstrap.Tab(tabButton);
        tabInstance.show();
    }

    
});
</script>