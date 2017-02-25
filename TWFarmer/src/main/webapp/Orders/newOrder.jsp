<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<title>台灣小農</title>
<style>
body {
	padding-top: 70px;
}

html {
	overflow-y: scroll;
}

.order {
	border: 1px solid black;
}
</style>
</head>
<body>
	<jsp:include page="../common/menuProduct.jsp" />
	<div class="container">
		<div class="jumbotron">
			${farmerBean.memberBean.name}(${farmerBean.memberBean.account})<br>${farmerBean.farmerIntro}
			<form action="NewOrder.do" method="POST">
				<input type="hidden" value="${farmerBean.memberId}" name="sellerId" />
				<c:forEach items="${cartProductMap}" var="x">
					<div class="order row">
						<div class="col-md-3">
							<img src="../img/${x.value[0].pictureName}" style="width: 100%" />
						</div>
						<div class="col-md-3">
							<p>
								商品名稱：${x.key.productName}<br>商品價格：${x.key.price}/${x.key.unit}<br>運費：${x.key.freight}/${x.key.unit}
							</p>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="count" class="control-label">購買數量</label> <input
									type="text" id="count" name="count" class="form-control"
									value=""><input type="hidden"
									value="${x.key.productId}" name="productId" />
							</div>
						</div>
						<div class="col-md-3">金額小計：</div>
					</div>
				</c:forEach>
				<div class="form-group">
					<label>收件人：</label> <input id='shipName'
						value="${sessionScope.LoginOK.name}" type="text" name="shipName"
						class="form-control" />
				</div>

				<div class="form-group">
					<label>收件郵遞區號：</label> <input id='shipPostalCode'
						value="${sessionScope.LoginOK.postalCode}" type="text"
						name="shipPostalCode" class="form-control" />
				</div>

				<div class="form-group">
					<label>收件地區：</label> <input id='shipDistrict'
						value="${sessionScope.LoginOK.district}" type="text"
						name="shipDistrict" class="form-control" />
				</div>

				<div class="form-group">
					<label>收件地址：</label> <input id='shipAddress'
						value="${sessionScope.LoginOK.address}" type="text"
						name="shipAddress" class="form-control" />
				</div>

				<div class="form-group">
					<button type="submit">確認訂單</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>