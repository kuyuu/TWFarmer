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
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item">管理商品</a>
					<a href="#" class="list-group-item">商品問與答</a>
					<a href="#" class="list-group-item active">審核合購</a>
					<a href="#" class="list-group-item">管理賣場資料</a>
					<a href="#" class="list-group-item">管理個人資料</a>
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
											<td>${row.value.unit}</td>
											<td>${row.value.price}</td>
											<td>${row.key.jpPrice}</td>
											<td>${row.key.jpPopulationMin}</td>
											<td>${row.key.jpPopulationMax}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-1 col-md-offset-4">
							<button type="button" class="btn btn-danger"
								onclick="location.href='/TWFarmer/BackStage/FarmerCheckJPDetailServlet?jpId=${jpBean.jpId}&value=reject'">拒絕</button>
						</div>
						<div class="col-md-1 col-md-offset-1">
							<button type="button" class="btn btn-primary"
								onclick="location.href='/TWFarmer/BackStage/FarmerCheckJPDetailServlet?jpId=${jpBean.jpId}&value=accept'">接受</button>
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