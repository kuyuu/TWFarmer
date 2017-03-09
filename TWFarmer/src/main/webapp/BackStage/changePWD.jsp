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
			<div class="col-md-9">
				<div class="jumbotron">
					<div class="row">
						<center>
							<h3>更改密碼</h3>
						</center>
						<form class="form-horizontal col-md-10" role="form"
							action="/TWFarmer/BackStage/ChangePWDServlet" method="put">
							<div class="form-group">
								<label for="inputOldPassword" class="col-sm-3 control-label">原始密碼</label>
								<div class="col-sm-9">
									<input type="password" class="form-control"
										id="inputOldPassword" name="oldPassword" placeholder="請輸入原始密碼">
								</div>
							</div>
							<div class="form-group">
								<label for="inputNewPassword" class="col-sm-3 control-label">新密碼</label>
								<div class="col-sm-9">
									<input type="password" class="form-control"
										id="inputNewPassword" name="newPassword" placeholder="請輸入新密碼">
								</div>
							</div>
							<div class="form-group">
								<label for="inputNewPassword2" class="col-sm-3 control-label">確認新密碼</label>
								<div class="col-sm-9">
									<input type="password" class="form-control"
										id="inputNewPassword2" name="newPassword2"
										placeholder="再次確認新密碼"> <span style="color: #ff0000">${errors.PWD}</span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-5 col-sm-10">
									<button name="submit" class="btn btn-primary" value="change">送出修改</button>
									<button name="submit" class="btn btn-danger" value="cancel">取消</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(0)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-success")
		})
	</script>
</body>
</html>