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
					<a href="#" class="list-group-item active">管理商品</a> <a
						href="../BackStage/SelectQnaServlet" class="list-group-item">商品問與答</a>
					<a href="FarmerCheckJpServlet" class="list-group-item">審核合購</a> <a
						href="#" class="list-group-item">管理賣場資料</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h3>管理商品</h3>
					<!-- 					<h5><button type="button" class="btn btn-default">新增商品</button></h5> -->
					<!-- 					<a href="../ProductMaintain/ProductInsert.jsp" class="btn btn-primary btn-lg disabled" role="button">新增商品</a> -->
					<a class="btn btn-default"
						href="../ProductMaintain/InsertProductServlet" role="button">新增商品</a>
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
					<form action="" method="post"></form>


				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>