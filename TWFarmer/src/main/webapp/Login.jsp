<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
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
/* 	background: #e1c192 url(/TWFarmer/img/submit-icon/wood_pattern.jpg); */
}

html {
	overflow-y: scroll;
}
</style>

</head>
<body>
	<!-- 上方選單start -->
	<div class="container">
		<jsp:include page="common/menu.jsp" />
		<div class="container">
			<div class="row">

				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">

						<!-- 		會員登入表單    Start    -->

						<section class="main">

						<form action="<c:url value="/Login.controller" />" method="post"
							role="form" class="form-2">
							<h1>
								<span class="log-in">登入</span>
							</h1>
								<p class="float">
									<label for="login"><i class="icon-user"></i>Account</label> <input
										type="text" name="account" value="" class="input" id="account">
									<span style="color: #ff0000">${errors.account}</span>
								</p>
								<p class="float">

									<label for="password"><i class="icon-lock"></i>Password</label>
									<input type="password" name="password" value=""
										class="showpassword" id="password" /> <span
										style="color: #ff0000">${errors.password}</span>
								</p>
								<span style="color: #ff0000">
									<h4>${errors.LoginError}</h4>
								</span>
							<p class="clearfix">
								<button type="submit" class="btn btn-success" style="float:right;">登入</button>
							</p>
						</form>
						</section>

					</div>

					<!-- 會員登入表單  End -->
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 上方選單 End -->


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/scripts.js"></script>

	<script src="js/modernizr.custom.63321.js"></script>


</body>
</html>