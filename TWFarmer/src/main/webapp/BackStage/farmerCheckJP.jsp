<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	background-color:#fcf5e0;
}

html {
    overflow-y:scroll;
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
					<h3>未審核合購</h3>
					<c:if test="${not empty jpList}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>合購編號</th>
									<th>合購發起人</th>
									<th>開始日期</th>
									<th>結束日期</th>
									<th>合購地點</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${jpList}">
									<c:url value="/BackStage/FarmerCheckJointPurchaseServlet"
										var="path">
										<c:param name="jointPurchaseId" value="${row.jpId}" />
									</c:url>
									<tr>
										<td><a href="${path}">${row.jpId}</a></td>
										<td>${row.initId}</td>
										<td>${row.initDate}</td>
										<td>${row.endDate}</td>
										<td>${row.jpLocation}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</c:if>
					<h3>已審核合購</h3>
					<c:if test="${not empty jpList2}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>合購編號</th>
									<th>合購發起人</th>
									<th>開始日期</th>
									<th>結束日期</th>
									<th>合購地點</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${jpList2}">
									<tr>
										<td>${row.jpId}</td>
										<td>${row.initId}</td>
										<td>${row.initDate}</td>
										<td>${row.endDate}</td>
										<td>${row.jpLocation}</td>
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
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#collapseOne').removeClass("in");
			$('#collapseTwo').addClass("in");
			$("#collapseTwo>ul>li:eq(3)").addClass("list-group-item-info");
		});
	</script>
</body>
</html>