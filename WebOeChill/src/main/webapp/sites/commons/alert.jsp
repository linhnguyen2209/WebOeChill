<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty message}">
	<div class="alert alert-success bg-success d-flex align-items-center rounded-5 text-truncate mb-4" role="alert">
		<div class="text-white">${message}</div>
	</div>
</c:if>
<c:if test="${not empty error}">
	<div class="alert alert-danger bg-danger d-flex align-items-center rounded-5 text-truncate mb-4" role="alert">
		<div class="text-white">${error}</div>
	</div>
</c:if>