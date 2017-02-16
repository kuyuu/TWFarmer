<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<title>Insert title here</title>
<style>
a.list-group-item:hover, a.list-group-item:focus {
	background-color: #ADADAD;
}

.list-group-item:first-child, .list-group-item:last-child {
	border-radius: 0;
}

.list-group-level1 .list-group-item {
	padding-left: 30px;
}

.list-group-level2 .list-group-item {
	padding-left: 60px;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="col-md-3">
			<jsp:include page="backstageMenu.jsp" />
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>