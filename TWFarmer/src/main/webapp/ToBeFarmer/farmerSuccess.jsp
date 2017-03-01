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
					<h2 style="color: blue; font-weight: 600; font-size: 50px;">申請完成</h2>
					<h3>以下是${memberBean.name}的申請資料</h3>
				</center>
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<h3>農民證號:${farmerBean.farmerId}</h3>
					<h3>銀行代碼:${farmerBean.bank}</h3>
					<h3>銀行帳號:${farmerBean.bankAccount}</h3>
					<h3>賣場介紹:${farmerBean.farmerIntro}</h3>
					<br> <br>
				</div>
				<center>
					<h2>審核需五至七日工作天，請耐心等候，謝謝您。</h2>
				</center>
			</div>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>