<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	background-color: #fcf5e0;
}

html {
	overflow-y: scroll;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menuShoppingCart.jsp" />
		<div class="row jumbotron">
			<a href="../JointPurchase.do?jpId=4006">test</a>
			<h2>購物車</h2>
			<button type="button" class="btn btn-danger" id="clear">清空購物車</button>
			<c:if test="${not empty cartMap}">
				<c:forEach items="${cartMap}" var="x">
					<div class="col-md-12">
						<h2>${x.key.name}(${x.key.account})</h2>
						<br>
						<c:forEach items="${x.value}" var="y">
							<div class="row">
								<div class="col-md-4">
									<img src="../img/${y.value[0].pictureName}"
										class="img-responsive thumbnail" style="width: 100%" />
								</div>
								<div class="col-md-8">
									<h4>${y.key.productName}</h4>
									<p>${y.key.productIntro}<br>價格：${y.key.price}/${y.key.unit}
									</p>
									<a href="../Order/StarOrder.do?productId=${y.key.productId}"><button
											type="button" class="btn btn-default" name="newJp">購買商品</button></a>
									<a
										href="../JointPurchase/NewJointPurchaseServlet?productId=${y.key.productId}"><button
											type="button" class="btn btn-default" name="newJp">發起合購</button></a>
								</div>
							</div>
						</c:forEach>
						<hr>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>


	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#clear').click(function() {
				$.ajax({
					url : 'ClearShoppingCart.do',
					type : "POST",
					complete : function() {
						window.location.reload();
					}
				});
			});
		});
	</script>
</body>
</html>