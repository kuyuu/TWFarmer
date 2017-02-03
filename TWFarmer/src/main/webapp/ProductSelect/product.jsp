<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<title>搜尋蔬果</title>
</head>
<body>
	<form action="<c:url value="/ProductSelect/product.controller" />"
		method="get">
		<table class="select">
			<tr>
				<td>產地搜尋：</td>
				<td><input type="text" name="name" value=""></td>
				<td>${errors.name}</td>
			</tr>
			<tr>
				<td>分類搜尋：</td>
				<td><select id='selectBy' name="selectBy">
					<option value="">請選擇分類</option>
					<option value="2101">仁果類</option>
					<option value="2102">核果類</option>
					<option value="2103">堅果類</option>
					<option value="2104">漿果類</option>
					<option value="2105">柑橘類</option>
					<option value="2106">瓜類</option>
					<option value="2107">根菜類</option>
					<option value="2108">莖菜類</option>
					<option value="2109">花菜類</option>
					<option value="2110">果菜類</option>
					<option value="2111">葉菜類</option>
					<option value="2112">香辛類</option>
					<option value="2113">菌藻類</option>
				</select>
			</tr>
			<tr>
				<td></td>
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
						<th>單位</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${name}">
						<tr>
							<td><a href="${path}">${row.origin}</a></td>
							<td>${row.productName}</td>
							<td>${row.productIntro}</td>
							<td>${row.price}</td>
							<td>${row.unit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<c:if test="${not empty selectBy}">
			<table>
				<thead>
					<tr>
						<th>產地</th>
						<th>產品</th>
						<th>描述</th>
						<th>價錢</th>
						<th>單位</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row1" items="${selectBy}">
						<tr>
							<td><a href="${path}">${row1.origin}</a></td>
							<td>${row1.productName}</td>
							<td>${row1.productIntro}</td>
							<td>${row1.price}</td>
							<td>${row1.unit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</form>
</body>
</html>