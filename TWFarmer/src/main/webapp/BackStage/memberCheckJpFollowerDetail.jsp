<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<style>
body {
 padding-top: 70px;
}
html {
    overflow-y:scroll;
}
</style>
</head>
<body>

	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<p>團名：${jpBean.jpName}</p>
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
					<a
						href="ToRemittanceFormServlet?jpFollowerId=${jpFollowerBean.JPFollowerId}"><button
							type="button" class="btn btn-default">填寫匯款資訊</button></a>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>