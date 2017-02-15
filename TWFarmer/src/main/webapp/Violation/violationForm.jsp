<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:set var="reportedId" value="${param.productId}" scope="session" />
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
			<div class="col-md-12">
				<div class="col-md-offset-2">
					<form action="<c:url value="NewViolationServlet"/>" method="POST"
						class="form-horizontal">
						<c:choose>
							<c:when test="${not empty LoginOK && not empty reportedId}">
								<input type="hidden" name="productId" value="${reportedId}" />
							</c:when>
							<c:otherwise>
								<input type="hidden" name="productId" value="${param.productId}" />
							</c:otherwise>
						</c:choose>
						<div class="form-group">
							<label for="vioTitle" class="col-sm-2 control-label">檢舉主旨</label>
							<div class="col-sm-6">
								<input type="text" id="vioTitle" name="vioTitle"
									class="form-control" value="${param.vioTitle}">
							</div>
						</div>
						<div class="form-group">
							<label for="vioContent" class="col-sm-2 control-label">檢舉內容</label>
							<div class="col-sm-6">
								<textarea id="vioContent" name="vioContent" class="form-control"
									rows="3"></textarea>
								<p class="help-block">限制200字</p>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								<button type="submit" class="btn btn-default">送出</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>