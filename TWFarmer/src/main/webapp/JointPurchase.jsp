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

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	background-color:#fcf5e0;
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
					<a href="JointPurchase/StarJpFollower.do?jpId=${jpBean.jpId}"><button class="btn btn-primary" id="go" value="${jpBean.jpId}">我要跟團</button></a>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/scripts.js"></script>
	<script></script>
</body>
</html>