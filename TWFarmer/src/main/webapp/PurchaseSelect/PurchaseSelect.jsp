<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合購專區</title>
</head>
<body>
<form action="<c:url value="/PurchaseSelect/PurchaseSelect.controller" />" method="get">
		<table class="">
			<tr>
				<td>合購搜尋：</td>
				<td><input type="text" name="keyword" value=""></td>
				<td>${errors.keyword}</td>
			</tr>
			<tr>
				<td></td>
				<td align="right"><input type="submit" value="搜尋"></td>
			</tr>
		</table>

		<c:if test="${not empty keyword}">
			<table>
				<thead>
					<tr>
						<th>合購名稱</th>
						<th>地區</th>
						<th>描述</th>
						<th>開始日期</th>
						<th>截止日期</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${keyword}">
						<tr>
							<td><a href="${path}">${row.jpName}</a></td>
							<td>${row.jpLocation}</td>
							<td>${row.jpIntro}</td>
							<td>${row.initDate}</td>
							<td>${row.endDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</form>
</body>
</html>