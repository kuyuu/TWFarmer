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
					<h3>撰寫新信</h3>
					<form action="NewMessageServlet" method="POST">
						<div class="form-group">
							<label for="readerAccount" class="control-label">收件人</label> <input
								type="text" id="readerAccount" name="readerAccount"
								class="form-control" value="${param.writerAccount}">
						</div>
						<div class="form-group">
							<label for="msgTitle" class="control-label">主旨</label> <input
								type="text" id="msgTitle" name="msgTitle" class="form-control"
								value="${param.msgTitle}">
						</div>
						<div class="form-group">
							<label for="msgContent" class="control-label">內容</label>
							<textarea class="form-control" rows="5" id="msgContent"
								name="msgContent" value="${param.msgContent}"></textarea>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-default">送出</button>
						</div>
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
			$("#collapseOne>ul>li:eq(5)").addClass("list-group-item-success");
		});
	</script>
</body>
</html>