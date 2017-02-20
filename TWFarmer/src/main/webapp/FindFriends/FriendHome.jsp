<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社群管理</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
body {
 padding-top: 70px;
}
html {
    overflow-y:scroll;
}
</style>
</head>
<body>
	<!-- 上方選單start -->
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="thumbnail" style="height: 200px">
			<div class="thumbnail" style="height: 320px">
				<img src="../MemberPic/${LoginOK.memberPic}" style="height: 300px"
					class="img-circle" alt="Cinque Terre">
				<div class="caption">
					<center>
						<h3>${LoginOK.account}</h3>
					</center>
				</div>
			</div>
			<div class="text" style="color: #0F7C58; font-weight: bold">${LoginOK.name}<c:if
					test="${LoginOK.gender=='M'}">帥哥</c:if>
				<c:if test="${LoginOK.gender=='F'}">美女
		</c:if>
				，歡迎回家！
			</div>
			請選擇一項功能<br>


			<div class="row">
				<div class="col-md-6">
					<div class="list-group">
						<a href="/TWFarmer/FindFriends/MemberSelect.jsp"
							class="list-group-item active">新增好友</a>
					</div>
				</div>

				<div class="col-md-6">
					<div class="list-group">
						<a href="/TWFarmer/FindFriends/FriendCheckingServlet"
						class="list-group-item active">好友及黑名單</a>

					</div>
				</div>

			</div>
		</div>
</body>
</html>






