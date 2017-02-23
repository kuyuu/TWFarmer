<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

					<div
						style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">訂單明細</div>


					<form
						action="<c:url value="../BackStage/NewRemittanceOfOrderServlet"/>"
						method="get">
				
								<div class="form-group">
									<label>訂單流水號:</label> ${orderResult.orderId}
								</div>
		
								<div class="form-group">
									<label>賣家編號:</label> ${orderResult.sellerId}
								</div>
		
								<div class="form-group">
									<label>購買時間:</label> ${orderResult.orderDate}
								</div>
		
		
		
								<c:forEach var="row" items="${orderDetails}">
		
									<div class="form-group">
										<label>商品編號:</label> ${row.productId}
									</div>
		
									<div class="form-group">
										<label>購買數量:</label> ${row.orderQuantity}
									</div>
		
									<div class="form-group">
										<label>購買單位:</label> ${row.unit}
									</div>
		
								</c:forEach>
		
								<div class="form-group">
									<label>總運費：</label> ${orderResult.totalFreight}
								</div>
		
								<div class="form-group">
									<label>總金額(含運費):</label> ${orderResult.totalPrice}
								</div>
		
		
								<div class="form-group">
									<button type="submit" class="btn btn-primary">我要匯款</button>
								</div>
			


						<input type="hidden" name="orderId" value="${orderResult.orderId}">
						
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(1)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-success")
		})
	</script>
</body>
</html>