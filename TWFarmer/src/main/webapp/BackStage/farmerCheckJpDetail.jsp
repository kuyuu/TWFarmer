<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
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
					<a href="#" class="list-group-item">管理商品</a> <a href="#"
						class="list-group-item active">審核合購</a> <a href="#"
						class="list-group-item">管理賣場資料</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<h3>${jpBean.jpName}</h3>
						</div>
						<div class="col-md-10 col-md-offset-1">
							<p>${jpBean.jpIntro}</p>
							<p>開始日期：${jpBean.initDate}</p>
							<p>截止日期：${jpBean.endDate}</p>
							<p>合購地區：${jpBean.jpLocation}</p>
							<br>

						</div>
						<div class="col-md-12">
							<p>合購商品：</p>
							<table class="table table-bordered">
								<thead>
									<tr>
										<td>商品編號</td>
										<td>商品名稱</td>
										<td>庫存量</td>
										<td>單位</td>
										<td>原價</td>
										<td>合購價</td>
										<td>最小數量</td>
										<td>最大數量</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${map}">
										<tr>
											<td>${row.key.jpId}</td>
											<td>${row.value.productName}</td>
											<td>${row.value.inventory}</td>
											<td>${row.value.unitId}</td>
											<td>${row.value.price}</td>
											<td>${row.key.jpPrice}</td>
											<td>${row.key.jpPopulationMin}</td>
											<td>${row.key.jpPopulationMax}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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