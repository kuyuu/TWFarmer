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
<title>臺灣小農-註冊會員</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
					<div class="col-md-2"></div>
					<div class="col-md-8">

						<!-- 		會員註冊表單    Start    -->
					<div style="padding:5% 10% 10% 10%;">
					<div style="font-weight:bold;color:#ff0000;margin: .67em 0;font-size: 2em;">註冊會員</div>
						<form
							action="<c:url value="/MemberSubmit/MemberSubmit.controller" />"
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
							<div class="form-group">
								<label for="exampleInputEmail1">名字</label>
								<input type="text" name="name"
									value="" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.name}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">手機</label>
								<input type="text" name="phone"
									value="" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.phone}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">生日</label>
								<input type="text" name="birthDate"
									value="" class="form-control"
									id="datepicker" >
								<span style="color:#ff0000">${errors.birthDate}</span>
							</div>
							<div class="form-group form-inline">
								<label for="exampleInputEmail1">性別</label>
								<input type="radio" name="gender"
									value="M" class="form-control"
									id="exampleInputEmail1" >男
								<input type="radio" name="gender"
									value="F" class="form-control"
									id="exampleInputEmail1" >女
								<span style="color:#ff0000">${errors.gender}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">E-mail</label>
								<input type="text" name="email"
									value="" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.email}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">身分證字號</label>
								<input type="text" name="idnumber"
									value="" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.idnumber}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">郵遞區號</label>
								<input type="text" name="postalcode"
									value="" class="form-control"
									id="exampleInputEmail1" value="請輸入郵遞區號">
								<span style="color:#ff0000">${errors.postalcode}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">居住的縣市及鄉鎮市區</label>
								<input type="text" name="district"
									value="" class="form-control"
									id="exampleInputEmail1" value="請輸入您居住的縣市及鄉鎮市區">								
								<span style="color:#ff0000">${errors.district}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">地址</label>
								<input type="text" name="address"
									value="" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.address}</span>
							</div>
						<button type="submit" class="btn btn-default">
							Submit
						</button>
					</form>
				</div>

						<!-- 會員註冊表單  End -->

					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 上方選單 End -->


	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				altField : "#datepicker",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
			});
		});
	</script>
	
	

</body>
</html>