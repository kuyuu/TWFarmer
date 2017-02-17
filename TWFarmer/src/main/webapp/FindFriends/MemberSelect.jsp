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
<title>站內信 - 收件匣</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>搜尋好友</title>
</head>
<body>

	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<form
			action="<c:url value="/FindFriends/MemberSelect.controller" />"
			method="get" class="">
			<div class="row">
				<div class="container">
					<div class="row">

						<div class="col-md-9">
							<h3>會員搜尋</h3>
							<h2></h2>
							<div class="form-group">
								<label class="">搜尋</label>
								<div class="">
									<input type="text" name="keyword" class="form-control" value="" placeholder="請在此輸入您要搜尋的會員">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-11"></div>
								<div class="col-md-1">
									<button type="submit" class="btn btn-default">搜尋</button>
								</div>
							</div>
							<h3></h3>
							<c:if test="${not empty keyword}">
								<c:forEach var="row" items="${keyword}">
									<div class="col-md-4">
										<%-- <a href="../ProductServlet?productId=${row.key.productId}"> --%>
											<div class="thumbnail" style="height: 320px">
												<img src="../MemberPic/${row.memberPic}"
													style="height: 180px">
												<div class="caption">
													<h3>${row.name}</h3>
													<p>${row.account}</p>
													<p>
														<a href="" class="btn btn-primary" role="button">加為好友</a>
														<a href="#" class="btn btn-default" role="button">拒絕往來</a>
													</p>
												</div>
											</div>
										<!-- </a> -->
									</div>
								</c:forEach>
							</c:if>
						</div>


					</div>

				</div>

			</div>
		</form>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
</body>
</html>