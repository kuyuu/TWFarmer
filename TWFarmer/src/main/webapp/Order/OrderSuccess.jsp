<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>訂購成功</h1><br>
以下是您的訂單內容：<br><br>
訂單流水號:${ordersBean.orderId}<br>
賣家編號:${ordersBean.sellerId}<br>
買家編號:${ordersBean.buyerId}<br>
總運費:${ordersBean.totalFreight}<br>
總金額:${ordersBean.totalPrice}<br>
購買日期:${ordersBean.orderDate}<br>
出貨日期:${ordersBean.shipDate}<br>
收件人:${ordersBean.shipName}<br>
郵遞區號:${ordersBean.shipPostalCode}<br>
收件地區:${ordersBean.shipDistrict}<br>
收件地址:${ordersBean.shipAddress}<br>
訂單狀態:${ordersBean.orderStatusId}<br>
買家評分:${ordersBean.ratingBuyer}<br>
賣家評分:${ordersBean.ratingSeller}<br>

</body>
</html>