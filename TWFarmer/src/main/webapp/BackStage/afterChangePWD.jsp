<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:remove var="LoginOK" />
<%
	session.invalidate();
%>
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
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row jumbotron" >
					<c:if test="${empty submit}">
						<center>
							<h2 style="color: red; font-weight: 600">修改密碼失敗</h2>
							<br>
						</center>
					</c:if>
					<c:if test="${not empty submit}">
						<center>
							<h2 style="color: blue; font-weight: 600">修改密碼成功</h2>
							<br>
						</center>
					</c:if>
					<center>
						<h4>
							為了帳戶安全，請重新登入。<br> 將在<span id="time" style="">5</span>秒鐘之後跳轉首頁。<br>
							<a href="/TWFarmer/index.jsp"><br>
							<button class="btn btn-default">回首頁</button></a>
						</h4>
					</center>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script language="JavaScript1.2" type="text/javascript">
		function delayURL(url) {
			var delay = document.getElementById("time").innerHTML;
			//最後的innerHTML不能丟，否則delay为一個對象  
			if (delay > 0) {
				delay--;
				document.getElementById("time").innerHTML = delay;
			} else {
				window.top.location.href = url;
			}
			setTimeout("delayURL('" + url + "')", 1000);
			//此處1000毫秒即每一秒跳轉一次  
		}
	</script>
	<script type="text/javascript">
		delayURL("/TWFarmer/index.jsp");
	</script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(0)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-success")
		})
	</script>
</body>
</html>