<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<p>
						賣家：${orderBean.memberBean.name}(${orderBean.memberBean.account})<br>
						訂購時間：${orderBean.orderDate}<br>
					</p>

					<form
						action="<c:url value="../BackStage/NewRemittanceOfOrderServlet"/>"
						method="get">
						<table class="table">
							<tr>
								<td>商品名稱</td>
								<td>價格</td>
								<td>運費</td>
								<td>購買數量</td>
								<td>商品總價</td>
								<td>商品總運費</td>
							</tr>
							<c:forEach items="${orderDetailList}" var="x">
								<tr>
									<td>${x.productBean.productName}</td>
									<td>${x.unitPrice}/${x.unit}</td>
									<td>${x.unitFreight}/${x.unit}</td>
									<td>${x.orderQuantity}${x.unit}</td>
									<td>${x.unitPrice * x.orderQuantity}</td>
									<td>${x.unitFreight * x.orderQuantity}</td>
								</tr>
							</c:forEach>
						</table>
						
						<div class="form-group">
									<button type="submit" class="btn btn-primary">我要匯款</button>
								</div>
						<input type="hidden" name="orderId" value="${orderBean.orderId}">
						
					</form>
					<p>
						總金額(含運費)：${orderBean.totalPrice+orderBean.totalFreight}<br>
						收件人：${orderBean.shipName}<br>
						郵遞區號：${orderBean.shipPostalCode}<br>
						地區：${orderBean.shipDistrict}<br> 地址：${orderBean.shipAddress}<br>
					</p>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#collapseOne>ul>li:eq(1)').addClass("list-group-item-success");
		});
	</script>
</body>
</html>