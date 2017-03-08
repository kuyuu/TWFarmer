<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
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
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="backstageMenu.jsp" />
			</div>
			<div class="row jumbotron">
				<div class="col-md-1"></div>
				<div class="col-md-8">
					<center>
						<c:if test="${empty FarmerBean}">
							<h2>您的小農資料為：</h2>
						</c:if>
						<c:if test="${not empty FarmerBean}">
							<h2>您修改後的小農資料為：</h2>
						</c:if>

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
						</table>
							<a href="changeFarmerInfo.jsp"><button type="button"
									class="btn btn-primary">修改小農資料</button></a>
					</center>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne").removeClass("in")
			$("#collapseTwo").addClass("in")
			$("#collapseTwo>ul>li:eq(4)").addClass("list-group-item-info")
		})
	</script>
</body>
</html>