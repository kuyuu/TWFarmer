<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<title>搜尋蔬果</title>
</head>
<body>
	<form action="<c:url value="/ProductSelect/product.controller" />" method="get">
	<table class="select">
		<tr>
			<td>尋找商品:</td>
			<td><input type="text" name="name" value=""></td>
			<td>${errors.name}</td>
		</tr>
		<tr>
			<td><select id='selectBy' name="selectBy">
					<option value="origin">產地</option>
					<option value="type">分類</option>
			</select>
			<td align="right"><input type="submit" value="搜尋"></td>
		</tr>
	</table>

		<c:if test="${not empty name}">
			<table>
				<thead>
					<tr>
						<th>產地</th>
						<th>產品</th>
						<th>描述</th>
						<th>價錢</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${name}">
						<tr>
							<td><a href="${path}">${row.origin}</a></td>
							<td>${row.productName}</td>
							<td>${row.productIntro}</td>
							<td>${row.price}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</form>
</body>
</html>