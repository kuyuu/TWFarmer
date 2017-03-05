<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農-合購專區</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	background-color: #fcf5e0;
}

td {
	padding: 5px;
}

html {
	overflow-y: scroll;
}

.jp {
	padding: 10px;
	border: 1px solid black;
	border-radius: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
	height: 140px;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menuJp.jsp" />
		<form
			action="<c:url value="/PurchaseSelect/PurchaseSelect.controller" />"
			method="get">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-9">
							<h3>合購搜尋</h3>
							<h2></h2>
							<div class="form-group">
								<div class="col-md-11">
									<input type="text" name="keyword" class="form-control" value="">
								</div>
								<div class="col-md-1">
									<button type="submit" class="btn btn-default">搜尋</button>
								</div>
							</div>
							<br> <br> <br>
							<c:if test="${not empty keyword}">
								<div class="row jumbotron">
									<c:forEach items="${keyword}" var="row">
										<div class="row jp">
											<a href="/TWFarmer/JointPurchase.do?jpId=${row.jpId}">
												<div style="display: none">${row.jpId}</div>
												<div class="col-md-3">
													<img src="../img/${row.pictureName}"
														class="img-responsive img-thumbnail" style="height: 120px"/>
												</div>
												<div class="col-md-9">
													<table class="table">
														<thead>
															<tr>
																<td colspan="3">${row.jpName}</td>
															</tr>
														</thead>
														<tr>
															<td>開始日期</td>
															<td>結束日期</td>
															<td>合購地點</td>
														</tr>
														<tr>
															<td>${row.initDate}</td>
															<td>${row.endDate}</td>
															<td>${row.jpLocation}</td>
														</tr>
													</table>
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.js"></script>
</body>
</html>