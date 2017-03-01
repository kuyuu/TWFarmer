<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									value="0"><input type="hidden"
									value="${x.key.productId}" name="productId" />
							</div>
						</div>
						<input type="hidden" value="${x.key.price}" name="price" /> <input
							type="hidden" value="" name="price2" />
						<div class="col-md-3">
							金額小計：
							<div class="price"></div>
						</div>
					</div>
				</c:forEach>
				<div id="totalPrice"></div>
				<div class="checkbox">
					<label> <input type="checkbox" id="checkbox1" />套用會員資料
					</label>
				</div>
				<div class="form-group">
					<label>收件人：</label> <input id='shipName' value="" type="text"
						name="shipName" class="form-control" />
					<div>${errors.shipName}</div>
				</div>

				<div class="form-group">
					<label>收件郵遞區號：</label> <input id='shipPostalCode' value=""
						type="text" name="shipPostalCode" class="form-control" />
					<div>${errors.shipPostalCode}</div>
				</div>

				<div class="form-group">
					<label>收件地區：</label> <input id='shipDistrict' value="" type="text"
						name="shipDistrict" class="form-control" />
					<div>${errors.shipDistrict}</div>
				</div>

				<div class="form-group">
					<label>收件地址：</label> <input id='shipAddress' value="" type="text"
						name="shipAddress" class="form-control" />
					<div>${errors.shipAddress}</div>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary">確認訂單</button>
				</div>
			</form>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {

			$('#checkbox1').change(
					function() {
						if ($(this).is(":checked")) {
							$('#shipName').val('${sessionScope.LoginOK.name}');
							$('#shipPostalCode').val(
									'${sessionScope.LoginOK.postalCode}');
							$('#shipDistrict').val(
									'${sessionScope.LoginOK.district}');
							$('#shipAddress').val(
									'${sessionScope.LoginOK.address}');
						} else {
							$('#shipName').val('');
							$('#shipPostalCode').val('');
							$('#shipDistrict').val('');
							$('#shipAddress').val('');
						}
					});
			$('input[name="count"]').change(
					function() {
						var price = $(this).parent().parent().next().val();
						var price2 = $(this).parent().parent().next().next();
						var count = $(this).val();
						var mult = price * count;
						$(this).parent().parent().next().next().next().html(
								'金額小計：<br>' + mult);
						price2.val(mult);

						var tp = 0;
						$('input[name="price2"]').each(function() {
							tp = tp + Number($(this).val());
						});

						$('#totalPrice').html('總金額：' + tp);
					});

		});
	</script>
	
	
	
	
</body>
</html>