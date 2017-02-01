<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table {
		border: 1px;
	}
</style>
</head>
<body>
<h2>小農後台</h2>
<hr />
<c:if test="${not empty productList}">
<table>
	<thead>
	<tr>
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>存貨</th>
		<th>價格</th>
		<th>單位</th>
		<th>運費</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${productList}">
	<tr>
		<td>${row.productId}</td>
		<td>${row.productName}</td>
		<td>${row.inventory}</td>
		<td>${row.price}</td>
		<td>${row.unitId}</td>
		<td>${row.freight}</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</c:if>
<hr />
<c:if test="${not empty jpList}">
<table>
	<thead>
	<tr>
		<th>合購編號</th>
		<th>合購發起人</th>
		<th>開始日期</th>
		<th>結束日期</th>
		<th>合購地點</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${jpList}">
	<tr>
		<td>${row.jpId}</td>
		<td>${row.initId}</td>
		<td>${row.initDate}</td>
		<td>${row.endDate}</td>
		<td>${row.jpLocation}</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</c:if>

</body>
</html>