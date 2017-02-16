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

</head>
<body>

	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item active">處理違規</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<c:if test="${not empty violationList}">
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
								<c:forEach var="row" items="${violationList}">
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
</body>
</html>