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
					<div class="row">
						<div class="col-md-8">
							<h2>${msgBean.msgTitle}</h2>
							<p>${msgBean.msgContent}</p>
							<form action="newMessage.jsp" method="POST">
								<c:choose>
									<c:when test="${value=='reader'}">
										<input type="hidden" name="readerAccount"
											value="${msgBean.writerAccount}" />
									</c:when>
									<c:otherwise>
										<input type="hidden" name="readerAccount"
											value="${msgBean.readerAccount}" />
									</c:otherwise>
								</c:choose>
								<input type="hidden" name="msgTitle"
									value="RE: ${msgBean.msgTitle}" /> <input type="hidden"
									name="msgContent" value="${msgBean.msgContent}" />
								<button type="submit" class="btn btn-primary" id="reply">回覆信件</button>
								<button type="button" class="btn btn-danger" id="delete"
									value="${msgBean.msgId}">刪除信件</button>
							</form>
						</div>
						<div class="col-md-4">
							<c:choose>
								<c:when test="${value=='reader'}">
									寄件人：<br>
									<img src="../MemberPic/${msgBean.writerMemberPic}"
										class="img-responsive img-thumbnail" style="width: 100%;" />
									<p class="text-center">${msgBean.writerName}(${msgBean.writerAccount})</p>
									<div class="col-md-6">
										<button type="button" class="btn btn-success btn-block"
											value="${msgBean.msgWriterId}" name="white">加為好友</button>
									</div>
									<div class="col-md-6">
										<button type="button" class="btn btn-danger btn-block"
											value="${msgBean.msgWriterId}" name="black">封鎖此人</button>
									</div>
								</c:when>
								<c:otherwise>
									收件人：<br>
									<img src="../MemberPic/${msgBean.readerMemberPic}"
										class="img-responsive img-thumbnail" style="width: 100%;" />
									<p class="text-center">${msgBean.readerName}(${msgBean.readerAccount})</p>
									<%-- 									<c:if test="${!friend}"> --%>
									<div class="col-md-6">
										<button type="button" class="btn btn-success btn-block"
											value="${msgBean.msgReaderId}" name="white">加為好友</button>
									</div>
									<%-- 									</c:if> --%>
									<div class="col-md-6">
										<button type="button" class="btn btn-danger btn-block"
											value="${msgBean.msgReaderId}" name="black">封鎖此人</button>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
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
			$("#collapseOne>ul>li:eq(5)").addClass("list-group-item-success");
			$('#delete').click(function() {
				if ("${value}" == "reader") {
					$.post('DeleteMessageServlet', {
						"msgId" : $(this).val(),
						"value" : "reader"
					}, function() {
						window.location = 'MsgHomeServlet';
					});
				} else {
					$.post('DeleteMessageServlet', {
						"msgId" : $(this).val(),
						"value" : "writer"
					}, function() {
						window.location = 'MsgHomeServlet';
					});
				}
			});
			$('button[name="white"]').click(function() {
				$.ajax({
					url : '../Friend/AddFriend.do',
					type : "POST",
					data : {
						"whiteId" : $(this).val()
					},
					complete : function() {
						$('button[name="white"]').attr("disabled", "disabled");
					}
				});
			});
			$('button[name="black"]').click(function() {
				$.ajax({
					url : '../Friend/AddFriend.do',
					type : "POST",
					data : {
						"blackId" : $(this).val()
					},
					complete : function() {
						window.location = "MsgHomeServlet";
					}
				});
			});
			if ("${friend}" == "true") {
				$('button[name="white"]').attr("disabled", "disabled");
			}
		});
	</script>
</body>
</html>