<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
	<h1>商品新增成功</h1>
	<br>您的商品資料：
	<br>
	<center>
		<table class="table">

			<tr>
				<td>商品編號:</td>
				<td>${productBean.productId}</td>
			</tr>

			<tr>
				<td>產地:</td>
				<td>${productBean.origin}</td>
			</tr>

			<tr>
				<td>商品名稱:</td>
				<td>${productBean.productName}</td>
			</tr>

			<tr>
				<td>庫存:</td>
				<td>${productBean.inventory}</td>
			</tr>

			<tr>
				<td>單位價格:</td>
				<td>${productBean.price}</td>
			</tr>

			<tr>
				<td>單位:</td>
				<td>${productBean.unit}</td>
			</tr>

			<tr>
				<td>類別:</td>
				<td>${productBean.productTypeName}</td>
			</tr>

			<tr>
				<td>商品介紹:</td>
				<td>${productBean.productIntro}</td>
			</tr>

			<tr>
				<td>運費:</td>
				<td>${productBean.freight}</td>
			</tr>

			<tr>
				<td>上架日期:</td>
				<td>${productBean.addDate}</td>
			</tr>

			<tr>
				<td>預估下架日期:</td>
				<td>${productBean.removeEstDate}</td>
			</tr>

			<!-- 			<tr> -->
			<!-- 				<td>下架日期:</td> -->
			<%-- 				<td>${productBean.removeDate}</td> --%>
			<!-- 			</tr> -->

			<tr>
				<td>商品狀態:</td>
				<td>${productBean.productStatusName}</td>
			</tr>

			<tr>
				<td>商品圖片及介紹：</td>
				<c:forEach items="${productPicList}" var="row">
					<td>商品圖片： <img src="../img/${row.pictureName}" width="100"
						height="100" /><br>商品介紹：${row.pictureIntro}</td>
<%-- 					<td>商品介紹：${row.pictureIntro}</td> --%>
					<br>
				</c:forEach>
			</tr>
		</table>
	</center>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>