<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
}

html {
	overflow-y: scroll;
}
</style>
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
					<h3>申請升級小農</h3>
					<form action="/TWFarmer/BackStage/CheckToFarmerServlet"
						method="get">
						<c:if test="${empty select}">
							<h4>目前沒有人申請</h4>
						</c:if>
						<c:if test="${not empty select}">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>會員編號</th>
										<th>農民證號</th>
										<th>農場描述</th>
										<th>是否核准</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${select}">
										<input type="hidden" name="memberId" id="memberId"
											value="${row.key.memberId}" />
										<tr>
											<td>${row.key.memberId}</td>
											<td>${row.value.farmerId}</td>
											<td>${row.value.farmerIntro}</td>
											<td><button name="button" class="btn btn-primary"
													value="OK">是</button>
												<button name="button" class="btn btn-danger" value="NO">否</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne").removeClass("panel-collapse collapse in")
					.addClass("panel-collapse collapse")
			$("#collapseThree").removeClass("panel-collapse collapse")
					.addClass("panel-collapse collapse in")
			$("#collapseThree>ul>li:eq(0)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-info")
		})
	</script>
</body>
</html>