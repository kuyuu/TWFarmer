<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>臺灣小農</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

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
						<li><a href="/TWFarmer/MemberSubmit/MemberSubmit.jsp">註冊</a>
						</li>
						<li><a href="/TWFarmer/Login.jsp">登入</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">搜尋</button>
					</form>
				</div>
				</nav>
				<div class="jumbotron">
					<h3>跟團成功</h3>
					<p>團名：${jpBean.jpName}</p>
					<p>介紹：${jpBean.jpIntro}</p>
					<p>跟團開始日期：${jpBean.initDate}</p>
					<p>跟團截止日期：${jpBean.endDate}</p>
					<p>面交時間：${f2f.f2fTime}</p>
					<p>面交地點：${f2f.f2fPlace}</p>
					
					<table class="table">
						<thead>
							<tr>
								<td>商品名稱</td>
								<td>購買價格</td>
								<td>購買數量</td>
							</tr>
						</thead>
						<c:forEach items="${jpFollowerDetailList}" var="x">
							<tr>
								<td>${x.productName}</td>
								<td>${x.price}</td>
								<td>${x.quantity}</td>
							</tr>
						</c:forEach>
					</table>
					<p>
					商品總價：${jpFollowerBean.totalPrice}<br>
					雜費：${jpFollowerBean.misc}<br>
					總價：${jpFollowerBean.totalPrice + jpFollowerBean.misc}<br>
					</p>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>