<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<h2>開新合購</h2>
	<form action="<c:url value="CheckJointPurchaseServlet"/>" method="POST"
		class="form-horizontal">
		<div class="col-md-offset-3">
			<div class="form-group">
				<label for="memberId" class="col-sm-2 control-label">會員ID</label>
				<div class="col-sm-4">
					<p id="memberId" class="form-control-static">${sessionScope.JointPurchase.initId}</p>
				</div>
			</div>
			<div class="form-group">
				<label for="productId" class="col-sm-2 control-label">商品ID</label>
				<div class="col-sm-4">
					<p id="productId" class="form-control-static">${sessionScope.JPDetail.productId}</p>
				</div>
			</div>
			<div class="form-group">
				<label for="jpName" class="col-sm-2 control-label">合購團名</label>
				<div class="col-sm-4">
					<input type="text" id="jpName" name="jpName" class="form-control"
						value="${param.jpName}">
				</div>
			</div>
			<div class="form-group">
				<label for="jpIntro" class="col-sm-2 control-label">合購介紹</label>
				<div class="col-sm-4">
					<textarea id="jpIntro" name="jpIntro" class="form-control" rows="3"></textarea>
					<p class="help-block">限制300字</p>
				</div>
			</div>
			<div class="form-group">
				<label for="initDate" class="col-sm-2 control-label">開始日期</label>
				<div class="col-sm-4">
					<input type="text" id="initDate" name="initDate"
						class="form-control" value="${param.initDate}" />
				</div>
			</div>
			<div class="form-group">
				<label for="endDate" class="col-sm-2 control-label">結束日期</label>
				<div class="col-sm-4">
					<input type="text" id="endDate" name="endDate" class="form-control"
						value="${param.endDate}" />
				</div>
			</div>
			<div class="form-group">
				<label for="jpLocation" class="col-sm-2 control-label">合購地區</label>
				<div class="col-sm-4">
					<input type="text" id="jpLocation" name="jpLocation"
						class="form-control" value="${param.jpLocation}" />
				</div>
			</div>
			<div class="form-group">
				<label for="miscViaWay" class="col-sm-2 control-label">雜費收取方式</label>
				<div class="col-sm-4">
					<select class="form-control" id="miscViaWay" name="miscViaWay">
						<option value="4201">不收</option>
						<option value="4202">依人頭</option>
						<option value="4203">依比例</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="misc" class="col-sm-2 control-label">雜費</label>
				<div class="col-sm-4">
					<input type="text" id="misc" name="misc" class="form-control"
						value="${param.misc}" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button type="submit" class="btn btn-default">送出</button>
				</div>
			</div>
		</div>
	</form>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
</body>
</html>