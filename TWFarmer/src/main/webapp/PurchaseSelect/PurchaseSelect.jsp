<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<title>合購專區</title>
<style type="text/css">
td {
	padding: 5px;
}
body {
 padding-top: 70px;
}
html {
    overflow-y:scroll;
}
</style>
</head>
<body>
	<div class="container">
	<jsp:include page="../common/menuJp.jsp" />
		<form
			action="<c:url value="/PurchaseSelect/PurchaseSelect.controller" />"
			method="get">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="container">
					<div class="row">
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
							<c:if test="${not empty keyword}">
								<h3>搜尋結果</h3>
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
					</div>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.js"></script>
</body>
</html>