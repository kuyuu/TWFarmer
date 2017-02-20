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
					<h3>訂單明細</h3>
					<center>
						<form action="<c:url value="../BackStage/NewRemittanceOfOrderServlet"/>" method="get">
							<table border="0" width="35%">

								<tr>
									<td width="50%">訂單流水號:</td>
									<td>${orderResult.orderId}</td>
									<td></td>
								</tr>
								<tr>
									<td width="50%">賣家編號:</td>
									<td>${orderResult.sellerId}</td>
									<td></td>
								</tr>
								<tr>
									<td width="50%">購買時間:</td>
									<td>${orderResult.orderDate}</td>
									<td></td>
								</tr>
								
								<c:forEach var="row" items="${orderDetails}">
									<tr>
										<td width="50%">商品編號:</td>
										<td>${row.productId}</td>
										<td></td>
									</tr>
									<tr>
										<td width="50%">購買數量:</td>
										<td>${row.orderQuantity}</td>
										<td></td>
									</tr>
									<tr>
										<td width="50%">購買單位:</td>
										<td>${row.unit}</td>
										<td></td>
									</tr>
								</c:forEach>
								
								<tr>
									<td width="50%">總運費：</td>
									<td>${orderResult.totalFreight}</td>
									<td></td>
								</tr>
								<tr>
									<td width="50%">總金額(含運費):</td>
									<td>${orderResult.totalPrice}</td>
									<td></td>
								</tr>
								
								<tr>								
									<td align="center">
										<button type="submit" class="btn btn-primary">我要匯款</button>	
									</td>	
								</tr>
								
							</table>
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
			$('#collapseOne>ul>li:eq(2)').addClass("list-group-item-success");
		});
	</script>
</body>
</html>