<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	background-color: #fcf5e0;
}

html {
	overflow-y: scroll;
}

.nav-tabs {
	border-bottom: 2px solid #DDD;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	border-width: 0;
}

.nav-tabs>li>a {
	border: none;
	color: #666;
}

.nav-tabs>li.active>a, .nav-tabs>li>a:hover {
	border: none;
	color: #4285F4 !important;
	background: transparent;
}

.nav-tabs>li>a::after {
	content: "";
	background: #4285F4;
	height: 2px;
	position: absolute;
	width: 100%;
	left: 0px;
	bottom: -1px;
	transition: all 250ms ease 0s;
	transform: scale(0);
}

.nav-tabs>li.active>a::after, .nav-tabs>li:hover>a::after {
	transform: scale(1);
}

.tab-nav>li>a::after {
	background: #21527d none repeat scroll 0% 0%;
	color: #fff;
}

.tab-pane {
	padding: 15px 0;
}

.tab-content {
	padding: 20px
}

.card {
	background: #FFF none repeat scroll 0% 0%;
	box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);
	margin-bottom: 30px;
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
					<h2 class="text-center">站內信</h2>
					<p class="text-right">
						<a href="newMessage.jsp"><button type="button"
								class="btn btn-default">撰寫新信</button></a>
					</p>
					<div class="card">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">收件匣</a></li>
							<li role="presentation"><a href="#profile"
								aria-controls="profile" role="tab" data-toggle="tab">寄件備份</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<table class="table">
									<tr>
										<td>寄件人</td>
										<td>主旨</td>
										<td>寄送時間</td>
										<td></td>
									</tr>
									<c:forEach items="${msgList}" var="x">
										<c:choose>
											<c:when test="${x.msgStatus==0}">
												<tr class="success">
											</c:when>
											<c:otherwise>
												<tr>
											</c:otherwise>
										</c:choose>
										<td>${x.writerName}(${x.writerAccount})</td>
										<td>${x.msgTitle}</td>
										<td><fmt:formatDate value="${x.msgTime}"
												pattern="yyyy/MM/dd HH:mm" /></td>
										<td><a
											href="ReadMessage.do?msgId=${x.msgId}&value=reader"><button
													type="button" class="btn btn-primary" name="read${x.msgId}">讀取</button></a>
											<button type="button" class="btn btn-danger"
												name="readerDelete" value="${x.msgId}">刪除</button>
										</tr>

									</c:forEach>
								</table>
							</div>
							<div role="tabpanel" class="tab-pane" id="profile">
								<table class="table">
									<tr>
										<td>收件人</td>
										<td>主旨</td>
										<td>寄送時間</td>
										<td></td>
									</tr>
									<c:forEach items="${msgList2}" var="x">
										<tr>
											<td>${x.readerName}(${x.readerAccount})</td>
											<td>${x.msgTitle}</td>
											<td><fmt:formatDate value="${x.msgTime}"
													pattern="yyyy/MM/dd HH:mm" /></td>
											<td><a
												href="ReadMessage.do?msgId=${x.msgId}&value=writer"><button
														type="button" class="btn btn-primary"
														name="read${x.msgId}">讀取</button></a>
												<button type="button" class="btn btn-danger"
													name="writerDelete" value="${x.msgId}">刪除</button>
										</tr>

									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(5)").addClass("list-group-item-success");
			$('button[name="readerDelete"]').click(function() {
				$(this).parent().parent().remove();
				$.post('DeleteMessage.do', {
					"msgId" : $(this).val(),
					"value" : "reader"
				});
			})
			$('button[name="writerDelete"]').click(function() {
				$(this).parent().parent().remove();
				$.post('DeleteMessage.do', {
					"msgId" : $(this).val(),
					"value" : "writer"
				});
			})
		});
	</script>
</body>
</html>