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
		<jsp:include page="../common/menu.jsp" />
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
									<tr>
										<td>${row.jpName}</td>
										<td>${row.totalPrice + row.misc}</td>
										<td><fmt:formatDate value="${row.initDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td><fmt:formatDate value="${row.endDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td>${row.jpStatusName}</td>

										<td><c:if test="${row.remittanceStatus==1}">
											已匯款</c:if> <c:if
												test="${row.jpStatusId==4104 && row.remittanceStatus!=1}">
												<a
													href="CheckJpFollowerDetailServlet?jpFollowerId=${row.JPFollowerId}"><button
														type="button" class="btn btn-default">匯款去</button> </a>
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