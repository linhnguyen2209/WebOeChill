<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal fade" id="shareModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<form class="modal-content" action="ShareVideo" method="get">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Share video</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-2">
					<input type="hidden" id="videoIdModal" name="videoId"
						value=""> <input type="email" name="email"
						class="form-control" id="recipientEmail"
						placeholder="Nhập vào email người bạn muốn chia sẻ!">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="submit" id="sendButton" class="btn btn-primary">Send</button>
			</div>
		</form>
	</div>
</div>