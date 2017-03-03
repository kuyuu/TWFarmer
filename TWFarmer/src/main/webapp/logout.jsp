<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:remove var="LoginOK" />
<%
	session.invalidate();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/scripts.js"></script>
<script type='text/javascript'>
setTimeout('countdown()', 1000);

function countdown() {
var s = document.getElementById('timer');
s.innerHTML = s.innerHTML - 1;
if (s.innerHTML == 0)
window.location = '/TWFarmer/index.jsp';
else
setTimeout('countdown()', 1000);
}
</script>
<title>台灣小農-您已登出</title>

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
	<div class="container-fluid" style="padding: 5% 10% 10% 10%;">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<h3 class="text-center text-info">您已經登出</h3>
						<h4 class="text-center text-info">
							將在<span id='timer'>5</span>秒鐘之後跳轉回首頁。
						</h4>
						<div class="text-center">
						<a href="index.jsp" class="btn btn-success btn-default"
							type="button">按我回首頁</a>
						</div>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>