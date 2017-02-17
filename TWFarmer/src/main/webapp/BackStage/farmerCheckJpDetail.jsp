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
				<jsp:include page="backstageMenu.jsp" />
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
							<button type="button" class="btn btn-danger" id="reject">拒絕</button>
						</div>
						<div class="col-md-1 col-md-offset-1">
							<button type="button" class="btn btn-primary" id="accept">接受</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${jpBean.jpId}" id="jpId" />

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#collapseOne').removeClass("in");
			$('#collapseTwo').addClass("in");
			$("#collapseTwo>ul>li:eq(2)").addClass("list-group-item-info");

			$('#accept').click(function() {
				$.get('FarmerCheckJPDetailServlet', {
					"jpId" : $('#jpId').val(),
					"value" : "accept"
				}, function() {
					window.location = 'FarmerCheckJpServlet';
				});
			});
			$('#reject').click(function() {
				$.get('FarmerCheckJPDetailServlet', {
					"jpId" : $('#jpId').val(),
					"value" : "reject"
				}, function() {
					window.location = 'FarmerCheckJpServlet';
				});
			});
		});
	</script>
</body>
</html>