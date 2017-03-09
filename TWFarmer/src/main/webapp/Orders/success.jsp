<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:set var="reportedId" value="${param.productId}" scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>
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
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="jumbotron" style="padding: 5% 10% 10% 10%;">
					<div
						style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">訂購成功</div>

					<form action="<c:url value="OrderDetailServlet"/>" method="get">

						
						<div class="form-group">
							<label>訂單編號:</label> ${orderBean.orderId}
						</div>
						
						<div class="form-group">
							<label>訂購時間:</label> ${orderBean.orderDate}
						</div>
						
											
						<div class="form-group">
							<label>總金額(含運費):</label> ${orderBean.totalPrice+orderBean.totalFreight}
						</div>
						
						
						<table class="table table-hover">
							<tr class="warning">
								<td>產品名稱:</td>
								<td>購買數量:</td>
								<td>購買單位:</td>
								<td>金額/每單位:</td>
								<td>運費/每單位:</td>
								
							</tr>
							<c:forEach items="${orderDetailList}" var="x">
								<tr>
									<td>${x.productBean.productName}</td>
									<td>${x.orderQuantity}</td>
									<td>${x.unit}</td>
									<td>${x.unitPrice}</td>
									<td>${x.unitFreight}</td>
									
								</tr>
							</c:forEach>
						</table>
						
						
						
						
<%-- 						<c:forEach items="${orderDetailList}" var="x"> --%>
						
<!-- 						<div class="form-group"> -->
<%-- 							<label>產品名稱:</label> ${x.productBean.productName} --%>
<!-- 						</div> -->
						
<!-- 						<div class="form-group"> -->
<%-- 							<label>購買數量:</label> ${x.orderQuantity} --%>
<!-- 						</div> -->
						
<!-- 						<div class="form-group"> -->
<%-- 							<label>購買單位:</label> ${x.unit} --%>
<!-- 						</div> -->
						
<!-- 						<div class="form-group"> -->
<%-- 							<label>金額/每單位:</label> ${x.unitPrice} --%>
<!-- 						</div> -->
						
<!-- 						<div class="form-group"> -->
<%-- 							<label>運費/每單位:</label> ${x.unitFreight} --%>
<!-- 						</div> -->
						
<%-- 						</c:forEach> --%>



						<button type="submit" class="btn btn-primary"
							onclick="location.href='<c:url value="/Order/OrderDetailServlet?orderId=${orderBean.orderId}" /> '">我要付款</button>


						<button type="button" class="btn btn-primary"
							onclick="location.href='<c:url value="../index.jsp" /> '">下次再付款</button>


					</form>

				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>


