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
	<!-- 上方選單start -->
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="col-md-3">
			<jsp:include page="../BackStage/backstageMenu.jsp" />
		</div>
		<div class="col-md-8">
			<div class="row jumbotron">
				<center>
					<h2 style="color: red; font-weight: 400; font-size: 40px;">申請完成</h2>
					<h3>以下是${memberBean.name}的申請資料</h3>
				</center>
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<table>
						<tr>
							<td width="100px"><h4>農民證號：</h4></td>
							<td><h4>${IsFarmer.farmerId}</h4></td>
						</tr>
						<tr>
							<td width="100px"><h4>銀行代碼：</h4></td>
							<td><h4>${IsFarmer.bank}</h4></td>
						</tr>
						<tr>
							<td width="100px"><h4>銀行帳號：</h4></td>
							<td><h4>${IsFarmer.bankAccount}</h4></td>
						</tr>
						<tr>
							<td width="100px"><h4>農場描述：</h4></td>
							<td><h4>${IsFarmer.farmerIntro}</h4></td>
						</tr>
						<tr height="30px">
						</tr>
					</table>
				</div>
				<center>
					<h2>請耐心等候，謝謝您。</h2>
				</center>
			</div>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>