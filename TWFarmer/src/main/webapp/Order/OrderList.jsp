<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<style>
body {
 padding-top: 70px;
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
				<jsp:include page="../BackStage/backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h3>歷史訂單</h3>

					<table class="table table-bordered">
						<thead>
							<tr>
								<th>訂單編號</th>
								<th>賣家</th>
								<th>訂購時間</th>
								<th>付款狀態</th>
								<th>出貨狀態</th>
								
							</tr>
						</thead>
						<tbody>
							
							<c:forEach var="row" items="${buyerorders}">
								<c:url value="/Order/OrderDetailServlet" var="path">
									<c:param name="orderId" value="${row.orderId}" />
										
								</c:url>

								<tr>
									<td><a href="${path}">${row.orderId}</a></td>
									<td>${row.sellerId}</td>
									<td>${row.orderDate}</td>
										<td>
											<c:if test="${row.buyerOrderStatusId==3102}">已付款</c:if>
											<c:if test="${row.buyerOrderStatusId==3101}">
												<a href="${path}">
													<button type="button" class="btn btn-danger">匯款去</button>
												</a>   
											</c:if> 
										</td>
									<td>
										<c:if test="${row.sellerOrderStatusId==3103}">貨處理中</c:if>
										<c:if test="${row.sellerOrderStatusId==3104}">已出貨</c:if>
									</td>
								</tr>

							</c:forEach>
						</tbody>
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
			$("#collapseOne>ul>li:eq(1)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-success")
		})
	</script>
	
</body>
</html>