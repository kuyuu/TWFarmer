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
	overflow-y: scroll;
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
					<h2 class="text-center">追蹤商品</h2>
					<table class="table">
						<tr>
							<td>商品名稱</td>
							<td>賣家</td>
							<td>價格</td>
							<td>商品狀態</td>
							<td>存貨</td>
							<td></td>
						</tr>
						<c:forEach items="${trackProductList}" var="x">
							<tr>
								<td><a href="../ProductServlet?productId=${x.productId}">${x.productBean.productName}</a></td>
								<td>${x.productBean.memberBean.name}(${x.productBean.memberBean.account})</td>
								<td>${x.productBean.price}/${x.productBean.unit}</td>
								<td>${x.productBean.productStatusName}</td>
								<td>${x.productBean.inventory}${x.productBean.unit}</td>
								<td><button class="btn btn-danger">
										<span class="glyphicon glyphicon-trash"></span>
									</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#collapseOne>ul>li:eq(4)').addClass("list-group-item-success");
		});
	</script>
</body>
</html>