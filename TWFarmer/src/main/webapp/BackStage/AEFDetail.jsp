<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理員 - 審核小農</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>
<body>

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
					<a class="navbar-brand" href="../index.html">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">註冊</a></li>
						<li><a href="#">登入</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">搜尋</button>
					</form>
				</div>

				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item">處理違規</a> 
					<a href="#" class="list-group-item active">審核小農升級</a> 
					<a href="#" class="list-group-item">管理廣告輪播</a> 
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<h3>${memberBean.memberName}</h3>
						</div>
						<div class="col-md-10 col-md-offset-1">
							<p></p>
							<p>會員編號：${memberBean.memberId}</p>
							<p>會員帳號：${memberBean.account}</p>
							<p>會員姓名：${memberBean.name}</p>
							<br>

						</div>
						<div class="col-md-12">
							<p>申請者詳情:</p>
							<table class="table table-bordered">
								<thead>
									<tr>
										<td>會員編號</td>
										<td>會員帳號</td>
										<td>會員姓名</td>
										<td>居住區域</td>
										<td>居住地址</td>
										<td>聯絡電話</td>
										<td>聯絡信箱</td>
										<td>當前評價</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${map}">
										<tr>
											<td>${row.key.memberId}</td>
											<td>${row.value.account}</td>
											<td>${row.value.name}</td>
											<td>${row.value.district}</td>
											<td>${row.value.address}</td>
											<td>${row.value.phone}</td>
											<td>${row.value.email}</td>
											<td>${row.value.rating}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-1 col-md-offset-4">
							<button type="button" class="btn btn-danger" onclick="location.href='/TWFarmer/BackStage/AEFDetailServlet?memberId=${memberBean.memberId}&value=reject'">拒絕</button>
						</div>
						<div class="col-md-1 col-md-offset-1">
							<button type="button" class="btn btn-primary" onclick="location.href='/TWFarmer/BackStage/AEFDetailServlet?memberId=${memberBean.memberId}&value=accept'">接受</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>