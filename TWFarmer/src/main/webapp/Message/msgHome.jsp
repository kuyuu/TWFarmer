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
					<h2>站內信</h2>
					<a href="newMessage.jsp"><button type="button"
							class="btn btn-default">寫新信件</button></a>
					<h3>收件匣</h3>
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
							<td><a href="ReadMessageServlet?msgId=${x.msgId}"><button
										type="button" class="btn btn-primary" name="read${x.msgId}">讀取信件</button></a>
								<a href="DeleteMessageServlet?msgId=${x.msgId}"><button
										type="button" class="btn btn-danger">刪除信件</button></a>
							</tr>

						</c:forEach>
					</table>
					<h3>寄件備份</h3>
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
								<td><a href="ReadMessageServlet?msgId=${x.msgId}"><button
											type="button" class="btn btn-primary" name="read${x.msgId}">讀取信件</button></a>
									<button type="button" class="btn btn-danger">刪除信件</button>
							</tr>

						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(5)").addClass("list-group-item-success");
		});
	</script>
</body>
</html>