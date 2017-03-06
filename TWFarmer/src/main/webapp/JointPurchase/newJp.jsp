<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	<jsp:include page="../common/menuJp.jsp" />
	<div class="container">
		<div class="jumbotron">
			<img src="../img/img/002.png" style="width: 100%" />
			<form action="<c:url value="CheckJointPurchaseServlet"/>"
				method="POST" class="form-horizontal">
				<div class="row">
					<!-- 					<div class="col-md-6"> -->
					<div class="btn-group col-md-6" data-toggle="buttons">
						<c:forEach items="${jpdBeanMap}" var="x" varStatus="z">
							<c:forEach items="${x.value}" var="y">
								<div class="col-md-6">
									<div class="thumbnail" style="height: 400x">
										<img src="../img/${y.value[0].pictureName}"
											style="height: 160px" />
										<div class="caption">
											<h3>${y.key.productName}</h3>
											<label class="btn btn-default"> <input type="radio"
												name="picture" value="${y.value[0].pictureName}"
												autocomplete="off"> 設為合購圖片
											</label>
											<p>
												<font size="2"> 價格：${x.key.jpPrice}/${x.key.jpUnit}<br>
													運費：${x.key.jpFreight}/${x.key.jpUnit}<br>預計購買量：${x.key.jpPopulationMin}${x.key.jpUnit}
												</font>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:forEach>
					</div>


					<div class="col-md-6">
						<div class="form-group">
							<label for="jpName" class="control-label">合購團名</label> <input
								type="text" id="jpName" name="jpName" class="form-control"
								value="${param.jpName}">
						</div>
						<div class="form-group">
							<label for="jpIntro" class="ontrol-label">合購介紹</label>
							<textarea id="jpIntro" name="jpIntro" class="form-control"
								rows="3"></textarea>
							<p class="help-block">限制300字</p>
						</div>
						<div class="form-group">
							<label for="initDate" class="control-label">開始日期</label> <input
								type="text" id="initDate" name="initDate" class="form-control"
								value="${param.initDate}" />
						</div>
						<div class="form-group">
							<label for="endDate" class="control-label">結束日期</label> <input
								type="text" id="endDate" name="endDate" class="form-control"
								value="${param.endDate}" />
						</div>
						<div class="form-group">
							<label for="jpLocation" class="control-label">合購地區</label> <input
								type="text" id="jpLocation" name="jpLocation"
								class="form-control" value="${param.jpLocation}" />
						</div>
						<div class="form-group">
							<label for="miscViaWay" class="control-label">雜費收取方式</label> <select
								class="form-control" id="miscViaWay" name="miscViaWay">
								<option value="4201">不收</option>
								<option value="4202">依人頭</option>
							</select>
						</div>
						<div class="form-group">
							<label for="misc" class="control-label">雜費</label> <input
								type="text" id="misc" name="misc" class="form-control"
								value="${param.misc}" />
						</div>
						<div class="col-md-1 col-md-offset-11">
							<div class="form-group">
								<button type="submit" class="btn btn-primary">送出</button>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/TWFarmer/js/bootstrap.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#initDate").datepicker({
				altField : "#datepicker",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
			});
			$("#endDate").datepicker({
				altField : "#datepicker",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
			});
		});
	</script>
</body>
</html>