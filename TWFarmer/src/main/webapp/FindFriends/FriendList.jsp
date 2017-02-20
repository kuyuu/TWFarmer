<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>好友及封鎖名單</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>好友及封鎖名單</title>
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
			<div class="container">
				<div class="row">

					<div class="col-md-12">
						<h3>好友及封鎖名單</h3>
						<h2></h2>
						<h3></h3>
						<c:choose>
							<c:when test="${not empty friendList}">
								<c:forEach var="row" items="${friendList}">
									<div class="col-md-4">
										<div class="thumbnail" style="height: 320px">
											<img src="../MemberPic/${row.friendPic}" style="height: 180px"
												class="img-circle" alt="Cinque Terre">
											<div class="caption">
												<h3>${row.friendName}</h3>
												<p>${row.friendAccount}</p>
												<p>
													<a
														href="<c:url value="../FindFriends/AddFriendServlet?friendId=${row.memberId}&value=add" />"
														class="btn btn-primary" role="button">站內信件</a> <a
														href="<c:url value="../FindFriends/AddFriendServlet?friendId=${row.memberId}&value=block" />"
														class="btn btn-warning" role="button">刪除好友</a>

												</p>
											</div>
										</div>
									</div>

								</c:forEach>
							</c:when>

							<c:otherwise>
								<div class="text" style="color: #0F7C58; font-weight: bold">${sessionScope.LoginOK.name}，歡迎回家！</div>
								<center>您目前沒有任何好友或封鎖對象</center>
								<div class="list-group">
									<a href="/TWFarmer/FindFriends/MemberSelect.jsp"
										class="list-group-item active">請按此 開始搜尋及新增好友！</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>


				</div>

			</div>

		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
</body>
</html>

<!-- 備份區域 -->
<%-- 


<c:when test="${not empty friendList}">
	<div class="text" style="color: #0F7C58; font-weight: bold">${sessionScope.LoginOK.name}，歡迎回家！以下是您的好友清單<br>
		<br>
	</div>
	<c:forEach var='row' items='${friendList}' varStatus='vs'>
		<div class="col-md--offset-4">
			<a href="../ProductServlet?productId=${row.key.productId}">
			<div class="thumbnail" style="height: 120px">
				<img src="../MemberPic/${row.friendPic}" style="height: 100px"
					class="img-circle" alt="Cinque Terre">
				<div class="caption">
					<h3>${row.friendName}</h3>
					<p>${row.friendAccount}</p>
					<p>
						<a
							href="<c:url value="../FindFriends/AddFriendServlet?friendId=${row.memberId}&value=add" />"
							class="btn btn-primary" role="button">加為好友</a> <a
							href="<c:url value="../FindFriends/AddFriendServlet?friendId=${row.memberId}&value=block" />"
							class="btn btn-warning" role="button">拒絕往來</a>

					</p>
				</div>
			</div>

		</div>

	</c:forEach>
</c:when> --%>
