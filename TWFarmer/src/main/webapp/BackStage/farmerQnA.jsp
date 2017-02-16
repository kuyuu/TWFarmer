<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty IsFarmer}">
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
<link href="../css/style.css" rel="stylesheet">

</head>
<body>

	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="/TWFarmer/BackStage/BackStageServlet"
						class="list-group-item">管理商品</a> <a href="#"
						class="list-group-item active">商品問與答</a> <a href="#"
						class="list-group-item">審核合購</a> <a href="#"
						class="list-group-item">管理賣場資料</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h3>商品問與答</h3>
					<c:if test="${empty Qna}">
						<h4>目前沒有人提問</h4>
					</c:if>
					<c:if test="${not empty Qna}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>問與答編號</th>
									<th>商品編號</th>
									<th>商品名稱</th>
									<th>提問內容</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${Qna}">
									<c:forEach items="${row.value}" var="x">
										<c:url value="/BackStage/farmerReQnA.jsp" var="path">
											<c:param name="qnAId" value="${x.qnAId}" />
										</c:url>
										<tr>
											<td><a href="${path}">${x.qnAId}</a></td>
											<td>${row.key.productId}</td>
											<td>${row.key.productName}</td>
											<td>${x.qnAContent}</td>
										</tr>
									</c:forEach>
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