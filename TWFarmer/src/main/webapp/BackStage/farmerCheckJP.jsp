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
					<a href="#" class="list-group-item">管理商品</a>
					<a href="#" class="list-group-item">商品問與答</a>
					<a href="FarmerCheckJpServlet" class="list-group-item active">審核合購</a>
					<a href="#" class="list-group-item">管理賣場資料</a>
					<a href="#" class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h3>審核合購</h3>
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
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>