<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	background-color: #fcf5e0;
}

html {
	overflow-y: scroll;
}
</style>
</head>
<body>
	<jsp:include page="../common/menuJp.jsp" />
	<div class="container">


		<div class="row jumbotron">
			<div class="col-md-12">
				<div class="col-md-10 col-md-offset-1">
					<h3>跟團成功！</h3>
					<%-- 					<p>團名：${jpBean.jpName}</p> --%>
					<p>介紹：${jpBean.jpIntro}</p>
					<p>
						開始日期：
						<fmt:formatDate value="${jpBean.initDate}" pattern="yyyy-MM-dd" />
					</p>
					<p>
						截止日期：
						<fmt:formatDate value="${jpBean.endDate}" pattern="yyyy-MM-dd" />
					</p>
					<p>面交時間：<fmt:formatDate value="${f2f.f2fTime}" pattern="yyyy-MM-dd HH:mm" /></p>
					<p>面交地點：${f2f.f2fPlace}</p>

					<table class="table table-bordered">
						<thead>
							<tr class="warning">
								<td>商品名稱</td>
								<td>單價(含運)</td>
								<td>購買數量</td>
								<td>總價(含運)</td>
							</tr>
						</thead>
						<c:forEach items="${jpFollowerDetailList}" var="x">
							<tr>
								<td>${x.productName}</td>
								<td>${x.price + x.freight}</td>
								<td>${x.quantity}</td>
								<td>${(x.price + x.freight)*x.quantity}</td>
							</tr>
						</c:forEach>
					</table>
					<p>
						商品總價：${jpFollowerBean.totalPrice}<br>
						雜費：${jpFollowerBean.misc}<br> 總價：${jpFollowerBean.totalPrice + jpFollowerBean.misc}<br>
					</p>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>