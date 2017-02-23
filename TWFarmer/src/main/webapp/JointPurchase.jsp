<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty LoginOK}">
	<c:set var="target"
		value="/PurchaseServlet?jpId=${productBean.productId}" scope="session" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
}

html {
	overflow-y: scroll;
}
</style>
</head>
<body>
	<jsp:include page="common/menuJp.jsp" />
	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="col-md-4">
					<img src="img/${jpBean.pictureName}" style="width: 100%" />
				</div>
				<div class="col-md-8">
					<p>小農資料：${mBean.name}(${mBean.account})</p>
					<p>合購資料：${jpBean.jpName}</p>
					<p>
						<c:forEach items="${jpdMap}" var="x">
							<c:forEach items="${x.value}" var="y">
								<p>jpPrice:${x.key.jpPrice} productName:${y.key.productName} pictureName:${y.value[0].pictureName}</p>
							</c:forEach>
						</c:forEach>
					</p>
					<button class="btn btn-primary">我要跟團</button>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
	<script></script>
</body>
</html>