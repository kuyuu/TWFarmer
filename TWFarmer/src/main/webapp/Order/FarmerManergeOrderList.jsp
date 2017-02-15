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
	<table class="table">
							<thead>
								<tr>
									<th>訂單編號</th>
									<th>買家</th>
									<th>訂購時間</th>
									<th>付款狀態</th>
									<th>出貨狀態</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="row" items="${sellerorders}">
											<tr>
												<td>${row.orderId}</td>
												<td>${row.buyerId}</td>
												<td>${row.orderDate}</td>
												<td>${row.orderStatusId}</td>
												<td>${row.orderStatusId}</td>
												<td><a href="#">Details</a></td>
											</tr>
								</c:forEach>
							</tbody>
						</table>
	

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>