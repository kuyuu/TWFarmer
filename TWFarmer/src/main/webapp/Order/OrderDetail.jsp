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
<link href="../css/bootstrap.min.css" rel="stylesheet">
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
			<center>
				<form action="<c:url value="OrderDetailServlet"/>" method="get">
					<table border="0" width="35%">
						<caption>
							<h2>訂購成功</h2>
						</caption>
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
						<tr>
							<td width="50%">購買數量:</td>
							<td>${orderDetailResult.orderQuantity}</td>
							<td></td>
						</tr>
						<tr>
							<td width="50%">購買單位:</td>
							<td>${orderDetailResult.unit}</td>
							<td></td>
						</tr>
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
							<td width="50%">收件人:</td>
							<td>${orderResult.shipName}</td>
							<td></td>
						</tr>
						<tr>
							<td width="50%">郵遞區號:</td>
							<td>${orderResult.shipPostalCode}</td>
							<td></td>
						</tr>
						<tr>
							<td width="50%">地區:</td>
							<td>${orderResult.shipDistrict}</td>
							<td></td>
						</tr>
						<tr>
							<td width="50%">地址:</td>
							<td>${orderResult.shipAddress}</td>
							<td></td>
						</tr>
					</table>

				</form>
				<br>
				
				<button type="submit" class="btn btn-primary" onclick="location.href='<c:url value="" /> '">我要付款</button>			
				
				<button type="submit" class="btn btn-primary"
					onclick="location.href='<c:url value="../index.jsp" /> '">下次再付款</button>
			</center>

		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>



<!-- <h1>訂單訂購成功</h1> -->
<!-- <br> -->
<!-- 以下是您的訊息內容： -->
<!-- <br> -->
<!-- <br> -->
<%-- 訂單流水號:${orderResult.orderId} --%>
<!-- <br> -->
<%-- 賣家編號:${orderResult.sellerId} --%>
<!-- <br> -->
<%-- 購買時間:${orderResult.orderDate} --%>
<!-- <br> -->
<%-- 購買數量:${orderDetailResult.orderQuantity} --%>
<!-- <br> -->
<%-- 購買單位:${orderDetailResult.unit} --%>
<!-- <br> -->
<%-- 總運費：${orderResult.totalFreight} --%>
<!-- <br> -->
<%-- 總金額(含運費):${orderResult.totalPrice} --%>
<!-- <br> -->
<%-- 收件人:${orderResult.shipName} --%>
<!-- <br> -->
<%-- 郵遞區號:${orderResult.shipPostalCode} --%>
<!-- <br> -->
<%-- 地區:${orderResult.shipDistrict} --%>
<!-- <br> -->
<%-- 地址:${orderResult.shipAddress} --%>
<!-- <br> -->