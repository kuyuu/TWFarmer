<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
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
					<div class="col-md-8" style="font-family:monospace,Microsoft JhengHei">
						<center>
							<h2>您的會員資料為：</h2>
						</center>
						<table>
							<tr>
								<td><h4>帳號：</h4></td>
								<td><h4>${LoginOK.account}</h4></td>
							</tr>
							<tr>
								<td><h4>郵遞區號：</h4></td>
								<td><h4>${LoginOK.postalCode}</h4></td>
							</tr>
							<tr>
								<td><h4>地址：</h4></td>
								<td><h4>${LoginOK.district}${LoginOK.address}</h4></td>
							</tr>
							<tr>
								<td><h4>電話：</h4></td>
								<td><h4>${LoginOK.phone}</h4></td>
							</tr>
							<tr>
								<td><h4>電子信箱：</h4></td>
								<td><h4>${LoginOK.email}</h4></td>
							</tr>
							<tr>
								<td><h4>身分證字號：</h4></td>
								<td><h4>${LoginOK.idNumber}</h4></td>
							</tr>
							<tr>
								<td><h4>生日：</h4></td>
								<td><h4>${LoginOK.birthDate}</h4></td>
							</tr>
							<tr>
								<td><h4>性別：</h4></td>
								<td><c:if test="${LoginOK.gender=='M'}">
										<h4>男性</h4>
									</c:if> <c:if test="${LoginOK.gender=='F'}">
										<h4>女性</h4>
									</c:if></td>
							</tr>
							<tr>
								<td><h4>身分別：</h4></td>
								<td><c:if test="${LoginOK.idType==1}">
										<h4>會員</h4>
									</c:if> <c:if test="${LoginOK.idType==2}">
										<h4>小農</h4>
									</c:if> <c:if test="${LoginOK.idType==3}">
										<h4>管理員</h4>
									</c:if></td>
							</tr>
							<tr>
								<td><h4>評價：</h4></td>
								<td><h4>${LoginOK.rating}</h4></td>
							</tr>
						</table>
						<br>
						<button type="button" class="btn btn-default">修改會員資料</button>
						<button type="button" class="btn btn-default">修改密碼</button>
					</div>
					<div class="col-md-3" style="font-family:monospace,Microsoft JhengHei">
						<br>
						<h4>${LoginOK.name}</h4>
						<c:if test="${LoginOK.gender=='M'}">
							<h5>先生，您好</h5>
						</c:if>
						<c:if test="${LoginOK.gender=='F'}">
							<h5>小姐，您好</h5>
						</c:if>
						<img src="../MemberPic/${LoginOK.memberPic}" class="img-thumbnail">
						<input class='InputClass' type="file" name="picture" />
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
			$("#collapseOne>ul>li:eq(0)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-success")
		})
	</script>
</body>
</html>