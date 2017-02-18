<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<link href="/TWFarmer/css/jquery.bootstrap-touchspin.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menuJp.jsp" />
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>${fBean.name}(${fBean.account})</h2>
					<p>${fBean.farmerIntro}</p>
					<h2>選擇欲合購之商品</h2>
					<form action="<c:url value="SelectJpProductServlet?sellerId=${fBean.memberId}" />"
						method="POST" class="form-horizontal">
						<h3>購物車</h3>
						<c:forEach var="row" items="${cartProductMap}" varStatus="x">
							<c:if test="${x.count%2!=0}">
								<div class="row">
							</c:if>
							<div class="col-md-3">
								<div class="thumbnail" style="height: 320px">
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
							</div>
							<c:if test="${x.count%2==0}">
				</div>
				</c:if>
				<c:if test="${x.last  && x.count%2!=0}"></div></c:if>
				</c:forEach>
						<h3>賣家的其他商品</h3>
						<c:forEach var="row" items="${farmerProductMap}" varStatus="x">
							<c:if test="${x.count%2!=0}">
								<div class="row">
							</c:if>
							<div class="col-md-3">
								<div class="thumbnail" style="height: 320px">
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
							</div>
							<c:if test="${x.count%2==0}">
				</div>
				</c:if>
				<c:if test="${x.last  && x.count%2!=0}"></div></c:if>
				</c:forEach>
			<div class="form-group">
				<button type="submit" class="btn btn-default">送出</button>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
	<script src="/TWFarmer/js/jquery.bootstrap-touchspin.js"></script>
	<script>
		$("input[name*='jpPopulation']").TouchSpin({
			initval : 0
		});
	</script>
</body>
</html>