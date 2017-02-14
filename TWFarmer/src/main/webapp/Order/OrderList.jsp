<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>OrderList</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead>
								<tr>
									<th>訂單編號</th>
									<th>賣家</th>
									<th>訂購時間</th>
									<th>付款狀態</th>
									<th>出貨狀態</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="row" items="${buyerorders}">
											<tr>
												<td>${row.orderId}</td>
												<td>${row.sellerId}</td>
												<td>${row.orderDate}</td>
												<td>${row.orderStatusId}</td>
												<td>${row.orderStatusId}</td>
												<td><a href="#">Details</a></td>
											</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
		
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>