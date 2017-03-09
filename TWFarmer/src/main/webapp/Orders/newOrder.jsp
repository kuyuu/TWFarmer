<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>

<c:if test="${empty LoginOK}">
	<c:set var="target"
		value="/ProductServlet?productId=${productBean.productId}"
		scope="session" /> --%>
	<c:redirect url="../Login.jsp" />
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
	background-color: #fcf5e0;
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


		<!-- 			<div class="col-sm-12 col-md-10 col-md-offset-1" -->
		<!-- 				style="padding: 20% auto;"> -->
		<!-- 				<form action="NewOrder.do" method="POST"> -->
		<%-- 					<input type="hidden" value="${farmerBean.memberId}" name="sellerId" /> --%>
		<!-- 																賣家名稱及帳號 -->
		<!-- 					<h5 class="media-heading"> -->
		<%-- 						${farmerBean.memberBean.name}(${farmerBean.memberBean.account})</a> --%>
		<!-- 					</h5> -->
		<!-- 																商店介紹 -->
		<%-- 					<span>商店介紹： </span><span class="text-success"><strong>${farmerBean.farmerIntro}</strong></span> --%>


		<!-- 					<table class="table table-hover"> -->
		<!-- 						<thead> -->
		<!-- 							<tr> -->
		<!-- 								<th>商品圖片</th> -->
		<!-- 								<th>商品名稱</th> -->
		<!-- 								<th>購買數量</th> -->
		<!-- 								<th class="text-center">小計</th> -->
		<!-- 							</tr> -->
		<!-- 						</thead> -->
		<!-- 						<tbody> -->
		<%-- 							<c:forEach items="${cartProductMap}" var="x"> --%>
		<!-- 								<tr> -->
		<!-- 									<td class="col-sm-3 col-md-2"> -->
		<!-- 																		商品照片 -->
		<!-- 										<div class="media"> -->
		<!-- 											<a class="thumbnail pull-left" style="margin: 2% 3% 0 0;"> -->
		<!-- 												<img class="media-object" -->
		<%-- 												src="../img/${x.value[0].pictureName}" --%>
		<!-- 												style="height: 100px;"> -->
		<!-- 											</a> -->
		<!-- 										</div> -->
		<!-- 									</td> -->
		<!-- 									<td class="col-sm-5 col-md-3"> -->
		<!-- 										<div class="media-body"> -->
		<!-- 																					商品名稱 -->
		<%-- 											<h3 class="media-heading" style="margin-top: 5%;">${x.key.productName}</h3> --%>

		<!-- 													單價		 -->
		<%-- 											<h4 class="media-heading">單價：${x.key.price}元 / --%>
		<%-- 												${x.key.unit}</h4> --%>
		<!-- 													運費 -->
		<!-- 											<h4 class="media-heading"> -->
		<%-- 												運費： <span class="text-success"><strong>${x.key.freight}元 --%>
		<%-- 														/ ${x.key.unit}</strong> --%>
		<!-- 											</h4> -->
		<!-- 										</div> -->
		<!-- 									</td> -->
		<!-- 									<td class="col-sm-1 col-md-1" style="text-align: center"> -->
		<!-- 																		購買數量 <input type="text" id="count" -->
		<!-- 										name="count" class="form-control" value="0" -->
		<!-- 										style="margin-top: 6%;"><input type="hidden" -->
		<%-- 										value="${x.key.productId}" name="productId" /> --%>
		<!-- 									</td> -->
		<!-- 																	小計 -->
		<!-- 									<td class="col-sm-1 col-md-1 text-center"><strong> -->
		<%-- 											<input type="hidden" value="${x.key.price+x.key.freight}" --%>
		<!-- 											name="price" /> <input type="hidden" value="" name="price2" /> -->
		<!-- 											<div class="price"></div> -->
		<!-- 											</div> -->

		<!-- 									</strong></td> -->
		<!-- 								</tr> -->

		<%-- 							</c:forEach> --%>

		<!-- 						</tbody> -->
		<!-- 						<tfoot> -->
		<!-- 							<tr> -->
		<!-- 								<td> </td> -->
		<!-- 								<td> </td> -->
		<!-- 								<td><h3>總計</h3></td> -->
		<!-- 								<td class="text-right"><h5> -->
		<!-- 										<strong><div id="totalPrice"></div></strong> -->
		<!-- 									</h5></td> -->
		<!-- 							</tr> -->
		<!-- 						</tfoot> -->
		<!-- 					</table> -->
		<!-- 			</div> -->





		<!-- 	原始檔 -->
		<div class="col-md-10">
			<!-- 			<div class=""> -->
			<div class="col-sm-12 col-md-12 col-md-offset-1 jumbotron">
				<span class="label label-success"
					style="font-size: 28px; line-height: 25px; margin-right: 5px;">${farmerBean.memberBean.name}(${farmerBean.memberBean.account})</span>
				<span style="font-size: 20px; line-height: 25px;">${farmerBean.farmerIntro}</span>
				<form action="NewOrder.do" method="POST" style="margin-top: 20px;">
					<input type="hidden" value="${farmerBean.memberId}" name="sellerId" />
					<table class="table table-hover">
						<thead>
							<tr>
								<th>商品圖片</th>
								<th>商品名稱</th>
								<th>購買數量</th>
								<th class="text-center">小計</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cartProductMap}" var="x">
								<tr>
									<td class="col-sm-3 col-md-2"><img class="media-object"
										src="../img/${x.value[0].pictureName}" style="width: 100%" /></td>
									<td class="col-sm-5 col-md-3">
										<div class="media-body">
											<h3 class="media-heading" style="margin-top: 5%;">${x.key.productName}</h3>
											<h4 class="media-heading">單價：${x.key.price}元 /
												${x.key.unit}</h4>
											<h4 class="media-heading">運費：${x.key.freight}元 /
												${x.key.unit}</h4>
										</div>
									</td>
									<td class="col-sm-1 col-md-1" style="text-align: center"><input
										type="text" id="count" name="count" class="form-control"
										value="0" style="margin-top: 6%;"><input type="hidden"
										value="${x.key.price+x.key.freight}" name="price" /> <input
										type="hidden" value="" name="price2" /><input type="hidden"
										value="${x.key.productId}" name="productId" /></td>
									<td class="col-sm-4 col-md-2 text-center" style="font-size: 14px; line-height: 20px; margin: 25px; color: #FF0000;"><strong>


									</strong></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td> </td>
								<td> </td>
								<td class="form-group text-right"><h3>總計</h3></td>
								<td class="text-center">
									<div id="totalPrice"
										style="font-size: 20px; line-height: 20px; margin: 20px; color: #FF0000;"></div>
								</td>
							</tr>
						</tfoot>
					</table>


					<%-- 						<c:forEach items="${cartProductMap}" var="x"> --%>
					<!-- 							<div class="order row"> -->
					<!-- 								<div class="col-md-3"> -->
					<%-- 									<img src="../img/${x.value[0].pictureName}" style="width: 100%" /> --%>
					<!-- 								</div> -->
					<!-- 								<div class="col-md-3"> -->
					<!-- 									<div style="margin-top: 50px"> -->
					<!-- 										<p> -->
					<%-- 											商品名稱：${x.key.productName}<br>商品價格：${x.key.price}/${x.key.unit}<br>運費：${x.key.freight}/${x.key.unit} --%>
					<!-- 										</p> -->
					<!-- 									</div> -->
					<!-- 								</div> -->
					<!-- 								<div class="col-md-3"> -->
					<!-- 									<div class="form-group" style="margin-top: 50px"> -->
					<!-- 										<label for="count" class="control-label">購買數量</label> <input -->
					<!-- 											type="text" id="count" name="count" class="form-control" -->
					<!-- 											value="0"> <input type="hidden" -->
					<%-- 											value="${x.key.productId}" name="productId" /> --%>
					<!-- 									</div> -->
					<!-- 								</div> -->
					<%-- 								<input type="hidden" value="${x.key.price+x.key.freight}" --%>
					<!-- 									name="price" /> <input type="hidden" value="" name="price2" /> -->
					<!-- 								<div class="col-md-3" style="margin-top: 50px"> -->
					<!-- 									金額小計： -->
					<!-- 									<div class="price"></div> -->
					<!-- 								</div> -->
					<!-- 							</div> -->
					<%-- 						</c:forEach> --%>
					<div id="totalPrice"></div>
					<div class="checkbox">
						<label> <input type="checkbox" id="checkbox1" />套用會員資料
						</label>
					</div>
					<div class="form-group">
						<label>收件人：</label>
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-user"></span>
							</span> <input id='shipName' value="" type="text" name="shipName"
								class="form-control" />
						</div>
						<div>${errors.shipName}</div>
					</div>

					<div class="form-group">
						<label>收件郵遞區號：</label>
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-map-marker"></span>
							</span> <input id='shipPostalCode' value="" type="text"
								name="shipPostalCode" class="form-control" />
						</div>
						<div>${errors.shipPostalCode}</div>
					</div>

					<div class="form-group">
						<label>收件地區：</label>
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-road"></span>
							</span> <input id='shipDistrict' value="" type="text"
								name="shipDistrict" class="form-control" />
						</div>
						<div>${errors.shipDistrict}</div>
					</div>

					<div class="form-group">
						<label>收件地址：</label>
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-home"></span>
							</span> <input id='shipAddress' value="" type="text" name="shipAddress"
								class="form-control" />
						</div>
						<div>${errors.shipAddress}</div>
					</div>

					<div class="form-group text-right">
						<button type="submit" class="btn btn-primary">確認訂單</button>
					</div>
				</form>
				<!-- 				</div> -->

			</div>
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
			$('input[name="count"]').change(function() {
				var price = $(this).next().val();
				var price2 = $(this).next().next();
				var count = $(this).val();
				var mult = price * count;
				$(this).parent().next().html("<h4>"+mult + " 元</h4>");
				price2.val(mult);
				var tp = 0;
				$('input[name="price2"]').each(function() {
					tp = tp + Number($(this).val());
				});

				$('#totalPrice').html(tp + " 元");
			});

		});
	</script>
</body>
</html>