<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target"
		value="/JointPurchase/NewJointPurchaseServlet?productId=${productId}"
		scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body {
 padding-top: 70px;
}
html {
    overflow-y:scroll;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/jquery.bootstrap-touchspin.css"
	rel="stylesheet">
<style>
body {
	padding-top: 70px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menuJp.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>${fBean.name}(${fBean.account})</h2>
					<p>${fBean.farmerIntro}</p>
					<h2>設定欲合購之商品</h2>
					<form
						action="<c:url value="SelectJpProductServlet?sellerId=${fBean.memberId}" />"
						method="POST" class="form-horizontal">
						<c:forEach var="row" items="${cartProductMap}" varStatus="x">
							<c:if test="${x.count%2!=0}">
								<div class="row">
							</c:if>
							<div class="col-md-3">
								<div class="thumbnail" style="height: 400px">
									<img src="../img/${row.value[0].pictureName}"
										style="height: 50%">
									<div class="caption">
										<p>${row.key.productName}</p>
										<p>價格：${row.key.price}元/${row.key.unit}</p>
										<p>運費：${row.key.freight}元/${row.key.unit}</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label for="jpPrice" class="control-label">合購價格</label> <input
										type="text" id="jpPrice${row.key.productId}"
										name="jpPrice${row.key.productId}" class="form-control"
										value="${row.key.price}">
								</div>
								<div class="form-group">
									<label for="jpFreight" class="control-label">單位運費</label> <input
										type="text" id="jpFreight${row.key.productId}"
										name="jpFreight${row.key.productId}" class="form-control"
										value="${row.key.freight}">
								</div>
								<div class="form-group">
									<label for="jpPopulationMin" class="control-label">最小購買量</label>
									<input type="text" id="jpPopulationMin${row.key.productId}"
										name="jpPopulationMin${row.key.productId}"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="jpPopulationMax" class="control-label">最大購買量</label>
									<input type="text" id="jpPopulationMax${row.key.productId}"
										name="jpPopulationMax${row.key.productId}"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="jpUnit" class="control-label">合購單位</label> <select
										class="form-control" id="jpUnit${row.key.productId}"
										name="jpUnit${row.key.productId}">
										<option value="箱">箱</option>
										<option value="顆">顆</option>
										<option value="斤">斤</option>
										<option value="公斤">公斤</option>
									</select> <input type="hidden" value="${row.key.unit}"
										name="${row.key.productId}" />
								</div>
							</div>
							<c:if test="${x.count%2==0}">
				</div>
				</c:if>
				<c:if test="${x.last  && x.count%2!=0}">
			</div>
			</c:if>
			</c:forEach>
			<c:if test="${not empty farmerProductMap}">
				<h3>賣家的其他商品</h3>
			</c:if>
			<c:forEach var="row" items="${farmerProductMap}" varStatus="x">
				<c:if test="${x.count%2!=0}">
					<div class="row">
				</c:if>
				<div class="col-md-3">
					<div class="thumbnail" style="height: 400px">
						<img src="../img/${row.value[0].pictureName}" style="height: 50%">
						<div class="caption">
							<p>${row.key.productName}</p>
							<p>價格：${row.key.price}元/${row.key.unit}</p>
							<p>運費：${row.key.freight}元/${row.key.unit}</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="jpPrice" class="control-label">合購價格</label> <input
							type="text" id="jpPrice${row.key.productId}"
							name="jpPrice${row.key.productId}" class="form-control"
							value="${row.key.price}">
					</div>
					<div class="form-group">
						<label for="jpFreight" class="control-label">單位運費</label> <input
							type="text" id="jpFreight${row.key.productId}"
							name="jpFreight${row.key.productId}" class="form-control"
							value="${row.key.freight}">
					</div>
					<div class="form-group">
						<label for="jpPopulationMin" class="control-label">最小購買量</label> <input
							type="text" id="jpPopulationMin${row.key.productId}"
							name="jpPopulationMin${row.key.productId}" class="form-control">
					</div>
					<div class="form-group">
						<label for="jpPopulationMax" class="control-label">最大購買量</label> <input
							type="text" id="jpPopulationMax${row.key.productId}"
							name="jpPopulationMax${row.key.productId}" class="form-control">
					</div>
					<div class="form-group">
						<label for="jpUnit" class="control-label">合購單位</label> <select
							class="form-control" id="jpUnit${row.key.productId}"
							name="jpUnit${row.key.productId}">
							<option value="箱">箱</option>
							<option value="顆">顆</option>
							<option value="斤">斤</option>
							<option value="公斤">公斤</option>
						</select> <input type="hidden" value="${row.key.unit}"
							name="${row.key.productId}" />
					</div>
				</div>
				<c:if test="${x.count%2==0}">
		</div>
		</c:if>
		<c:if test="${x.last  && x.count%2!=0}">
	</div>
	</c:if>
	</c:forEach>

	<div class="form-group">
		<button type="submit" class="btn btn-default">送出</button>
	</div>
	</form>
	</div>
	</div>
	</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.js"></script>
	<script src="/TWFarmer/js/jquery.bootstrap-touchspin.js"></script>
	<script>
		$("input[name*='jpPopulation']").TouchSpin({
			initval : 0
		});
		$(function() {
			var list = $('input[name^="20"]')
			for (var x = 0; x < list.size(); x++) {
				var list2 = $(list[x]).parent().children('select').children(
						'option');
				for (var y = 0; y < list2.size(); y++) {
					if ($(list[x]).val() == $(list2[y]).val()) {
						$(list2[y]).attr("selected", "value");
					}
				}
			}
		});
	</script>
</body>
</html>