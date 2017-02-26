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
<link href="../css/bootstrap.css" rel="stylesheet">
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
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div style="padding: 5% 10% 10% 10%;">
					<div
						style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">訂購成功</div>

					<form action="<c:url value="OrderDetailServlet"/>" method="get">


						<br>${orderBean.totalPrice}<br>
						<c:forEach items="${orderDetailList}" var="x">${x.productBean.productName}${x.orderQuantity}<br>
						</c:forEach>



						<button type="submit" class="btn btn-primary"
							onclick="location.href='<c:url value="/Order/OrderDetailServlet?orderId=${orderResult.orderId}" /> '">我要付款</button>


						<button type="button" class="btn btn-primary"
							onclick="location.href='<c:url value="../index.jsp" /> '">下次再付款</button>


					</form>

				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>


