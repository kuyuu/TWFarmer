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
					<h3>管理開團</h3>
					<c:if test="${not empty initJpList}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>合購編號</th>
									<th>開始日期</th>
									<th>結束日期</th>
									<th>合購地點</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${initJpList}">
									<tr>
										<td>${row.jpId}</td>
										<td>${row.initDate}</td>
										<td>${row.endDate}</td>
										<td>${row.jpLocation}</td>
										<td><c:if test="${row.jpStatusId==4102}">
												<a href="PublicJpServlet?jpId=${row.jpId}"><button
														type="button" class="btn btn-default">發佈開團</button></a>
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
	<script>
		$(function() {
			$('#collapseOne>ul>li:eq(2)').addClass("list-group-item-success");
		});
	</script>
</body>
</html>