<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>台灣小農</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>
<body>

	<div class="container">
		<jsp:include page="../common/menuJp.jsp" />

		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h3>跟團成功</h3>
<%-- 					<p>團名：${jpBean.jpName}</p> --%>
					<p>介紹：${jpBean.jpIntro}</p>
					<p>跟團開始日期：${jpBean.initDate}</p>
					<p>跟團截止日期：${jpBean.endDate}</p>
					<p>面交時間：${f2f.f2fTime}</p>
					<p>面交地點：${f2f.f2fPlace}</p>

					<table class="table">
						<thead>
							<tr>
								<td>商品名稱</td>
								<td>購買價格</td>
								<td>購買數量</td>
							</tr>
						</thead>
						<c:forEach items="${jpFollowerDetailList}" var="x">
							<tr>
								<td>${x.productName}</td>
								<td>${x.price}</td>
								<td>${x.quantity}</td>
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
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>