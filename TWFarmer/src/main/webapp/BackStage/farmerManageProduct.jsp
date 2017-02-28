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
					<h3>管理商品</h3>
					<!-- 					<h5><button type="button" class="btn btn-default">新增商品</button></h5> -->
					<!-- 					<a href="../ProductMaintain/ProductInsert.jsp" class="btn btn-primary btn-lg disabled" role="button">新增商品</a> -->
					<c:if test="${empty productList}">
						<h5>目前無商品</h5>
					</c:if>
					<c:if test="${not empty productList}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>商品編號</th>
									<th>商品名稱</th>
									<th>存貨</th>
									<th>價格</th>
									<th>單位</th>
									<th>運費</th>
									<th>商品狀態</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="delete" value="刪除" />
								<c:forEach var="row" items="${productList}">
									<c:url value="/BackStage/ToProductServlet" var="path">
										<c:param name="productId" value="${row.productId}" />
									</c:url>
									<c:choose>
										<c:when test="${row.productStatusName != delete}">
											<tr>
												<td><a href="${path}">${row.productId}</a></td>
												<td>${row.productName}</td>
												<td>${row.inventory}</td>
												<td>${row.price}</td>
												<td>${row.unit}</td>
												<td>${row.freight}</td>
												<td>${row.productStatusName}</td>
											</tr>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<a class="btn btn-default"
						href="../ProductMaintain/InsertProductServlet" role="button">新增商品</a>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne").removeClass("panel-collapse collapse in")
					.addClass("panel-collapse collapse")
			$("#collapseTwo").removeClass("panel-collapse collapse").addClass(
					"panel-collapse collapse in")
			$("#collapseTwo>ul>li:eq(0)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-info")
		})
	</script>
</body>
</html>