<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<a href="#" class="list-group-item">管理訂單</a> <a href="#"
						class="list-group-item">管理開團</a> <a href="#"
						class="list-group-item active">管理跟團</a><a href="#"
						class="list-group-item">管理追蹤商品</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h3>管理跟團</h3>
					<c:if test="${not empty jpFollowerList}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>合購團名</th>
									<th>總價</th>
									<th>開始日期</th>
									<th>截止日期</th>
									<th>狀態</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${jpFollowerList}">
									<c:url value="/BackStage/FarmerCheckJointPurchaseServlet"
										var="path">
										<c:param name="jointPurchaseId" value="${row.JPFollowerId}" />
									</c:url>
									<tr>
										<td>${row.jpName}</td>
										<td>${row.totalPrice + row.misc}</td>
										<td><fmt:formatDate value="${row.initDate}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatDate value="${row.endDate}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${row.jpStatusName}</td>

										<td><c:if test="${row.jpStatusId==4104}">
												<a href=""><button type="button" class="btn btn-default">回報匯款</button>
												</a>
											</c:if></td>
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