<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	overflow-y: scroll;
}
</style>
</head>
<body>

	<div class="container">
		<jsp:include page="../common/menu.jsp" />

		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item">管理訂單</a> <a href="#"
						class="list-group-item">管理開團</a> <a href="#"
						class="list-group-item active">管理跟團</a><a href="#"
						class="list-group-item">管理追蹤商品</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<form class="form-horizontal" action="UpdateShippingOfOrder"
						method="POST">
						<input type="hidden" name="orderId" value="${order.orderId}" />
						<div class="form-group">
							<h2>修改出貨狀態</h2>
							<select name="sellerOrderStatusId">
								<option value="${order.sellerOrderStatusId}" selected>${order.sellerOrderStatusName}</option>
								<c:forEach items="${orderStatusOptions}" var="option">
									<c:if test="${option.key != order.sellerOrderStatusId}">
										<option value="${option.key}"> ${option.value}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-default">確認修改</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>