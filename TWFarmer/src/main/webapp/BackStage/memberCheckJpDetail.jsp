<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
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

					<div class="col-md-4">
						<img src="../img/${jpBean.pictureName}" class="thumbnail"
							style="width: 100%" />
					</div>
					<div class="col-md-8">
						<h3>${jpBean.jpName}</h3>
						<p>${jpBean.jpIntro}</p>
					</div>
					<table class="table table-bordered text-center">
						<tr class="">
							<td></td>
							<c:forEach items="${list}" var="x" varStatus="y">
								<td>${x.productName}</td>
							</c:forEach>
							<c:if test="${jpBean.jpStatusId==4104}">
								<td>匯款狀態</td>
							</c:if>
							<td></td>
						</tr>

						<c:forEach items="${map}" var="x">

							<tr>
								<td>${x.key.name}(${x.key.account})</td>
								<c:forEach items="${x.value}" var="y">
									<td>${y}</td>
								</c:forEach>
								<c:forEach items="${list2}" var="q">
									<c:if
										test="${x.key.memberId==q.memberId  && jpBean.jpStatusId==4104}">
										<c:choose>
											<c:when test="${q.remittanceStatus==0}">
												<td><span class="glyphicon glyphicon-remove"></span></td>
											</c:when>
											<c:otherwise>
												<td><span class="glyphicon glyphicon-ok"></span></td>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
								<td>
									<button class="btn btn-primary" name="mail"
										value="${x.key.account}">
										<span class="glyphicon glyphicon-envelope"></span>
									</button>
								</td>
							</tr>

						</c:forEach>
						<tr>
							<td>累積數量</td>
							<c:forEach items="${list4}" var="x">
								<td><c:out value="${x}" /></td>
							</c:forEach>
							<c:if test="${jpBean.jpStatusId==4104}">
								<td></td>
							</c:if>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#collapseOne>ul>li:eq(2)').addClass("list-group-item-success");
			$('button[name="mail"]')
					.click(
							function() {
								window.location = "../Message/NewMessageServlet?readerAccount="
										+ $(this).val();
							});
		});
	</script>
</body>
</html>