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
<style>
body {
	padding-top: 70px;
}

html {
	overflow-y: scroll;
}

.jp {
	padding: 10px;
	border: 1px solid black;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
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
					<h3 class="text-center">管理開團</h3>
					<c:if test="${not empty initJpList}">
						<c:forEach items="${initJpList}" var="row">
							<div class="row jp">
								<div class="col-md-3">
									<img src="../img/${row.pictureName}" style="width: 100%" />
								</div>
								<div class="col-md-9">
									<table class="table">
										<thead>
											<tr>
												<td colspan="3">${row.jpName}</td>
												<td><c:if test="${row.jpStatusId==4102}">
														<a href="PublicJpServlet?jpId=${row.jpId}"><button
																type="button" class="btn btn-default btn-sm">發佈開團</button></a>
													</c:if></td>
											</tr>
										</thead>
										<tr>
											<td>開始日期</td>
											<td>結束日期</td>
											<td>合購地點</td>
											<td>狀態</td>
										</tr>
										<tr>
											<td>${row.initDate}</td>
											<td>${row.endDate}</td>
											<td>${row.jpLocation}</td>
											<td>${row.jpStatusName}</td>
										</tr>
									</table>
								</div>
							</div>
						</c:forEach>
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
			$('#collapseOne>ul>li:eq(2)').addClass("list-group-item-success");
		});
	</script>
</body>
</html>