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
				<jsp:include page="../BackStage/backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h2>好友 / 黑名單</h2>
					<form class="form-inline" role="form" method="POST"
						action="SelectMember.do">
						<div class="form-group">
							<div class="input-group">
								<label class="sr-only" for="account">會員帳號</label> <input
									type="text" class="form-control" id="account" name="account"
									placeholder="輸入會員帳號">
							</div>
						</div>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span> 搜尋會員
						</button>
					</form>
					<h3>好友名單</h3>
					<div class="row">
						<c:forEach items="${whiteList}" var="x">

							<div class="col-md-4">
								<img src="../resources/uploadImages/${x.friendPic}" width="100%"
									class="img-circle" />
								<p class="text-center">${x.friendName}(${x.friendAccount})<br>
									<a
										href="../Message/NewMessageServlet?readerAccount=${x.friendAccount}"
										class="btn btn-primary"><span
										class="glyphicon glyphicon-envelope"></span></a>
									<button class="btn btn-danger" name="delete"
										value="${x.friendId}">
										<span class="glyphicon glyphicon-remove"></span>
									</button>
							</div>
						</c:forEach>
					</div>
					<h3>黑名單</h3>
					<div class="row">
						<c:forEach items="${blackList}" var="x">
							<div class="col-md-4">
								<img src="../resources/uploadImages/${x.friendPic}" width="100%"
									class="img-circle" />
								<p class="text-center">${x.friendName}(${x.friendAccount})<br>
									<button class="btn btn-danger" name="delete"
										value="${x.friendId}">
										<span class="glyphicon glyphicon-remove"></span>
									</button>
								</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(6)").addClass("list-group-item-success");
			$('button[name="delete"]').click(function() {
				$(this).parent().parent().remove();
				$.get('DeleteFriend.do', {
					"friendId" : $(this).val()
				});
			});

		});
	</script>
</body>
</html>