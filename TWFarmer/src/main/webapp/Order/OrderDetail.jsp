<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<form action="<c:url value="OrderDetailServlet"/>" method="get">
		<h1>訂單訂購成功</h1><br> 
		以下是您的訊息內容：<br> <br> 
		訂單流水號:${orderResult.orderId}<br>
		賣家編號:${orderResult.sellerId}<br> 
		購買時間:${orderResult.orderDate}<br>
		購買數量:${orderDetailResult.orderQuantity}<br>
		總運費：${orderResult.totalFreight}<br> 
		總金額(含運費):${orderResult.totalPrice}<br>
		收件人:${orderResult.shipName}<br>
		郵遞區號:${orderResult.shipPostalCode}<br>
		地區:${orderResult.shipDistrict}<br>
		地址:${orderResult.shipAddress}<br>
	</form>
	
	
</body>
</html>