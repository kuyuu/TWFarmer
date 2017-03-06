<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	background-color: #fcf5e0;
}

html {
	overflow-y: scroll;
}

.jp {
	padding: 10px;
	border: 2px solid gray;
	margin-top: 20px;
	margin-bottom: 20px;
	height: 140px;
	border-radius: 5px;
}
/* .jp:hover{ */
/* 	border: 2px solid black; */
/* } */
.divbox {
	background: #ffffff;
	border: solid 1px #ccc;
}

/*  滑入時變換底色樣式 */
.divOver {
	background: #EEFFBB;
	border: solid 1px #d2dce3;
	position: relative; /* 當滑鼠經過超連結時，超連結往上位移5像素 */
	bottom: 5px;
}
</style>
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
					<h2 class="text-center">管理開團</h2>
					<c:if test="${not empty initJpList}">
						<c:forEach items="${initJpList}" var="row">
							<div class="row jp divbox">
								<div style="display: none">${row.jpId}</div>
								<div class="col-md-3">
									<img src="../img/${row.pictureName}"
										class="img-responsive img-thumbnail" style="height:120px" />
								</div>
								<div class="col-md-9">
									<table class="table">
										<thead>
											<tr>
												<td colspan="3">${row.jpName}</td>
												<td><c:if test="${row.jpStatusId==4102}">
														<a href="PublicJpServlet?jpId=${row.jpId}"><button
																type="button" class="btn btn-default btn-sm">發佈開團</button></a>
													</c:if></td>
											</tr>
										</thead>
										<tr>
											<td>開始日期</td>
											<td>結束日期</td>
											<td>合購地點</td>
											<td>狀態</td>
										</tr>
										<tr>
											<td><fmt:formatDate value="${row.initDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${row.endDate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${row.jpLocation}</td>
											<td>${row.jpStatusName}</td>
										</tr>
									</table>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#collapseOne>ul>li:eq(2)').addClass("list-group-item-success");
			$('.jp').click(function() {
				var x = $(this).children(":first").text();
				window.location = "MemberCheckJpDetailServlet?jpId=" + x;
			});
			//當滑鼠滑入時將div的class換成divOver
			$('.divbox').hover(function() {
				$(this).addClass('divOver');
			}, function() {
				//滑開時移除divOver樣式
				$(this).removeClass('divOver');
			});
		});
	</script>
</body>
</html>