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
    overflow-y:scroll;
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
									<c:when test="${msgBean.msgReaderId==LoginOK.memberId }">
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
							</form>
						</div>
						<div class="col-md-4">
							<c:choose>
								<c:when test="${msgBean.msgReaderId==LoginOK.memberId }">
									寄件人：<br>
									<img src="../MemberPic/${msgBean.writerMemberPic}"
										class="img-responsive img-thumbnail" style="width: 100%;" />
							${msgBean.writerName}(${msgBean.writerAccount})<br>
									<button type="button" class="btn btn-success">加為好友</button>
									<button type="button" class="btn btn-danger">封鎖此人</button>
								</c:when>
								<c:otherwise>
									收件人：<br>
									<img src="../MemberPic/${msgBean.readerMemberPic}"
										class="img-responsive img-thumbnail" style="width: 100%;" />
							${msgBean.readerName}(${msgBean.readerAccount})<br>
									<button type="button" class="btn btn-success">加為好友</button>
									<button type="button" class="btn btn-danger">封鎖此人</button>
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
		});
	</script>
</body>
</html>