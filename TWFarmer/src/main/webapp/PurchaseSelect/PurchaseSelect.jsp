<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<title>合購專區</title>
<style type="text/css">
td {
	padding: 5px;
}
</style>
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
						<li><a href="../ProductSelect/ProductSelect.jsp">購買蔬果</a></li>
						<li class="active"><a href="#">合購專區</a></li>
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
			<div class="container">
				<div class="row">
					<form
						action="<c:url value="/PurchaseSelect/PurchaseSelect.controller" />"
						method="get">
						<div class="col-md-6">
							<h3>合購搜尋</h3>
							<h2></h2>
							<div class="form-group">
								<label class="">搜尋</label>
								<div class="">
									<input type="text" name="keyword" class="form-control" value="">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-11"></div>
								<div class="col-md-1">
									<button type="submit" class="btn btn-default">搜尋</button>
								</div>
							</div>
							<h3> </h3>
							<c:if test="${not empty keyword}">
								<table class="table-bordered" width="850px">
									<thead>
										<tr>
											<th>合購名稱</th>
											<th>地區</th>
											<th>描述</th>
											<th>開始日期</th>
											<th>截止日期</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${keyword}">
											<tr>
												<td><a href="${path}">${row.jpName}</a></td>
												<td>${row.jpLocation}</td>
												<td>${row.jpIntro}</td>
												<td>${row.initDate}</td>
												<td>${row.endDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
</body>
</html>