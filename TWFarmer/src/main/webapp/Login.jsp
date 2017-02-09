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
<title>臺灣小農-會員登入</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<!-- 上方選單start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/TWFarmer/index.jsp">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/TWFarmer/MemberSubmit/MemberSubmit.jsp">註冊</a></li>
						<li><a href="/TWFarmer/MemberLogin.jsp">登入</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">搜尋</button>
					</form>
				</div>

				</nav>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">

						<!-- 		會員登入表單    Start    -->
						<div style="padding: 5% 10% 10% 10%;">
							<div
								style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">會員登入</div>
							<form action="<c:url value="/Login.controller" />"
							method="post" role="form" >

							<div class="form-group ">
								<label for="exampleInputEmail1">帳號</label>
								<input type="text" name="account"
									value="" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.account}</span>
							</div>
							<div class="form-group">
							<label for="exampleInputPassword1">密碼</label>
							<input type="password" name="password"
									value="" class="form-control" 
									id="exampleInputPassword1" />
								<span style="color:#ff0000">${errors.password}</span>
							</div>
							<div>
								<span style="color:#ff0000"> <h4> ${errors.LoginError} </h4> </span>
							</div>
							
								<button type="submit" class="btn btn-default">Login</button>
							</form>
						</div>

						<!-- 會員登入表單  End -->

					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 上方選單 End -->


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/scripts.js"></script>

</body>
</html>