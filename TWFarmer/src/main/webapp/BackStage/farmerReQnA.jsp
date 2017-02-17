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
				<jsp:include page="backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<%-- 					<c:if test="${not empty update}"> --%>
					<form action="/TWFarmer/BackStage/ReQnaServlet">
						<div class="form-group">
							<input type="hidden" name="qnAId" value="${param.qnAId}" />
							<h4>問與答編號：${param.qnAId}</h4>
							<label class="">回答問題</label>
							<textarea id="ReQnA" name="ReQnA" class="form-control" rows="5"></textarea>
							<h4>${errors.QnAerror}</h4>
							<button type="submit" class="btn btn-default">送出</button>
							<button type="button" class="btn btn-default" id="clearQnA"
								onclick="ClearFields();">清除</button>
						</div>
					</form>
					<%-- 					</c:if> --%>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function ClearFields() {
			document.getElementById("ReQnA").value = "";
		}
	</script>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function(){
			$("#collapseOne").removeClass("panel-collapse collapse in").addClass("panel-collapse collapse")
			$("#collapseTwo").removeClass("panel-collapse collapse").addClass("panel-collapse collapse in")
			$("#collapseTwo>ul>li:eq(1)").removeClass("list-group-item").addClass("list-group-item list-group-item-success")
		})
	</script>
</body>
</html>