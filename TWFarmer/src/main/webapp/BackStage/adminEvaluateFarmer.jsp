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
					<a href="#" class="list-group-item">處理違規</a> <a
						href="#" class="list-group-item active">審核小農升級</a> <a
						href="#" class="list-group-item">管理廣告輪播</a> 
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h3>審核小農升級</h3>
					<c:if test="${not empty fmList}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>會員編號</th>
									<th>會員帳號</th>
									<th>會員姓名</th>
									<th>電子信箱</th>
									<th>聯絡電話</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${fmList}">
									<c:url value="/BackStage/AdminEvaluateFarmerServlet"
										var="path">
										<c:param name="memberId" value="${row.memberId}" />
									</c:url>
									<tr>
										<td><a href="${path}">${row.memberId}</a></td>
										<td>${row.account}</td>
										<td>${row.name}</td>
										<td>${row.email}</td>
										<td>${row.phone}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>