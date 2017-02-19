<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<style>body { padding-top: 70px; }</style>
</head>
<body>

	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h2>處理違規</h2>
					<h3>待處理</h3>
					<c:if test="${empty untreated}">沒有未處理違規</c:if>
					<c:if test="${not empty untreated}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>檢舉ID</th>
									<th>檢舉人</th>
									<th>被檢舉商品</th>
									<th>主旨</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${untreated}">
									<tr>
										<td>${row.ticketId}</td>
										<td>${row.reporterId}</td>
										<td>${row.reportedId}</td>
										<td>${row.vioTitle}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<h3>已處理</h3>
					<c:if test="${empty treated}">沒有已處理違規</c:if>
					<c:if test="${not empty treated}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>檢舉ID</th>
									<th>檢舉人</th>
									<th>被檢舉商品</th>
									<th>主旨</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${treated}">
									<tr>
										<td>${row.ticketId}</td>
										<td>${row.reporterId}</td>
										<td>${row.reportedId}</td>
										<td>${row.vioTitle}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#collapseOne').removeClass("in");
			$('#collapseThree').addClass("in");
			$("#collapseThree>ul>li:eq(1)").addClass("list-group-item-info");
		});
	</script>
</body>
</html>