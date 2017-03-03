<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:set var="reportedId" value="${param.productId}" scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
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
	padding-top: 200px;
	background-color: #fcf5e0;
}

html {
	overflow-y: scroll;
}
</style>
</head>
<body>
	<jsp:include page="../common/menu.jsp" />
	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<h3 class="text-center text-info">檢舉成功，感謝您的寶貴意見</h3>
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

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
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
</body>
</html>