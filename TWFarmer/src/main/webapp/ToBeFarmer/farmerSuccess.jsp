<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>臺灣小農</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
body {
 padding-top: 70px;
}
html {
    overflow-y:scroll;
}
</style>
<body>
	<!-- 上方選單start -->
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="col-md-3">
			<jsp:include page="../BackStage/backstageMenu.jsp" />
		</div>
		<div class="col-md-8">
			<center>
				<h1>申請完成</h1>
				<h3>以下是${memberBean.name}的申請資料</h3>
			</center>
			<div class="col-md-3"></div>
			<div class="col-md-9">
				<h3>農民證號:${farmerBean.farmerId}</h3>
				<h3>銀行代碼:${farmerBean.bank}</h3>
				<h3>銀行帳號:${farmerBean.bankAccount}</h3>
				<h3>賣場介紹:${farmerBean.farmerIntro}</h3>
				<br/><br/><br/><br/>
			</div>
			<center>
				<h2>請耐心等候管理員審核，祝您有美好的一天</h2>
			</center>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>