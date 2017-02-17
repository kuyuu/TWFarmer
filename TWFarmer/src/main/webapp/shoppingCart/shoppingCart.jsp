<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<style>
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row jumbotron">
			<h2>購物車</h2>
			<c:if test="${not empty cartMap}">
				<c:forEach items="${cartMap}" var="x">
					<h3>${x.key.account}</h3>
					<br>
					<c:forEach items="${x.value}" var="y">
				${y}<br>
					</c:forEach>
					<hr>
				</c:forEach>
			</c:if>
		</div>
	</div>


	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>