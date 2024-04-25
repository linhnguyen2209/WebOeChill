<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="row mt-3 ">
	<h2 class="text-white w-100 p-0 mb-3 fw-bold ">User Management</h2>
	<ul class="nav nav-tabs" id="tabUserManagement" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active fw-bold" id="userEdition-tab"
				data-bs-toggle="tab" data-bs-target="#userEdition-tab-pane"
				type="button" role="tab" aria-controls="userEdition-tab-pane"
				aria-selected="true">User Edition</button>
		</li>
		<li class="nav-item fw-bold" role="presentation">
			<button class="nav-link" id="userList-tab" data-bs-toggle="tab"
				data-bs-target="#userList-tab-pane" type="button" role="tab"
				aria-controls="userList-tab-pane" aria-selected="false">User
				List</button>
		</li>
	</ul>
	<div class="tab-content p-0" id="tabUserManagementContent">
		<div class="tab-pane fade show active" id="userEdition-tab-pane"
			role="tabpanel" aria-labelledby="userEdition-tab" tabindex="0">
			<form action="" method="post"
				class="px-3 py-4 d-flex justify-content-center border bg-gradient">
				<div class="row w-100 p-0">
					<div class="mb-3 col-12 col-sm-6">
						<label for="username" class="form-label text-white fw-bold">Username</label>
						<input type="text" class="form-control" id="username" name="username"
							value="${user.username}" readonly>
					</div>
					<div class="mb-3 col-12 col-sm-6">
						<label for="fullname" class="form-label text-white fw-bold">Full
							name</label> <input type="text" class="form-control" id="fullName" name="fullName"
							value="${user.fullName}">
					</div>
					<div class="mb-3 col-12 col-sm-6">
						<label for="password" class="form-label text-white fw-bold">Password</label>
						<input type="password" class="form-control" id="password" name="password"
							value="${user.password}">
					</div>
					<div class="mb-3 col-12 col-sm-6">
						<label for="email" class="form-label text-white fw-bold">Email
							address</label> <input type="email"
							class="form-control rounded-2 bg-body-secondary" id="email" name="email"
							value="${user.email}">
					</div>
					<div class="col-12 mt-3 text-end">
						<button formaction="Admin/UsersManagement/update"
							class="btn btn-outline-warning me-2">Update</button>
						<button formaction="Admin/UsersManagement/delete"
							class="btn btn-outline-danger me-2">Delete</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="userList-tab-pane" role="tabpanel"
			aria-labelledby="userList-tab" tabindex="0">
			<div class="px-4 py-4 bg-gradient border overflow-auto">
				<table class="table table-hover ">
					<!-- <caption>Basic Table</caption> -->
					<thead>
						<tr>
							<th scope="col" class="col-4 col-md-2">Username</th>
							<th scope="col" class="col-3 col-md-2">Password</th>
							<th scope="col" class="col-3 col-md-3">Full Name</th>
							<th scope="col" class="col-2 col-md-2">Email</th>
							<th scope="col" class="col-2 col-md-2">Role</th>
							<th scope="col" class="col-2 col-md-1"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${users}"> 
							<tr>
								<td scope="row">${item.username}</td>
								<td>${item.password}</td>
								<td>${item.fullName}</td>
								<td>${item.email}</td>
								<td>${item.admin?'admin':'user'}</td>
								<td><a href="Admin/UsersManagement/edit?username=${item.username}&currentTab=1" class="pe-3"><i class="bi bi-pencil"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-12 mt-4 d-flex justify-content-between  w-100">
					<div class="total_item text-white fs-5 ">${totalUsers} users</div>
					<div>
						<a href="Admin/VideosManagement?currentPageNumberParam=1&currentTab=2"
							class="btn btn-outline-danger me-sm-2 mb-sm-0 ${currentPageAttr==1?'disabled-link':''}"
							onclick="handleClick(event)"> <i
							class="fa-solid fa-backward-fast"></i>
						</a> <a
							href="Admin/VideosManagement?currentPageNumberParam=${currentPageAttr-1}&currentTab=2"
							class="btn btn-outline-danger me-sm-2 mb-sm-0 ${currentPageAttr==1?'disabled-link':''}">
							<i class="fa-solid fa-backward-step"></i>
						</a> <a
							href="Admin/VideosManagement?currentPageNumberParam=${currentPageAttr+1}&currentTab=2"
							class="btn btn-outline-danger me-sm-2 mb-sm-0 ${currentPageAttr==totalPage?'disabled-link':''}">
							<i class="fa-solid fa-forward-step"></i>
						</a> <a
							href="Admin/VideosManagement?currentPageNumberParam=${totalPage}&currentTab=2"
							class="btn btn-outline-danger ${currentPageAttr==totalPage?'disabled-link':''}">
							<i class="fa-solid fa-forward-fast"></i>
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
			tabButton = document.querySelector('button[data-bs-target="#userEdition-tab-pane"]');
			
		}else{
			tabButton = document.querySelector('button[data-bs-target="#userList-tab-pane"]');
		}
		if (tabButton) {
			var tabInstance = new bootstrap.Tab(tabButton);
			tabInstance.show();
		}
	});
</script>