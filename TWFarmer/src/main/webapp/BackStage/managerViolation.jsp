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
	background-color:#fcf5e0;
}


html {
	overflow-y: scroll;
}

.hidden {
	display: none
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
					<h2 class="text-center">處理違規</h2>
					<h3 class="text-center">待處理</h3>
					<c:if test="${empty untreated}">沒有未處理違規</c:if>
					<c:if test="${not empty untreated}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>檢舉人</th>
									<th>被檢舉商品</th>
									<th>主旨</th>
									<th>檢舉時間</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${untreated}">
									<tr>
										<td>${row.memberBean.name}</td>
										<td><a
											href="../ProductServlet?productId=${row.reportedId}"
											target="_blank">${row.productBean.productName}</a></td>
										<td>${row.vioTitle}</td>
										<td><fmt:formatDate value="${row.createDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td><button value="${row.ticketId}"
												class="btn btn-primary" name="detail" data-toggle="modal"
												data-target="#myModal">
												<span class="glyphicon glyphicon-zoom-in"></span>
											</button>
											<div class="hidden">
												<h3>${row.vioTitle}</h3>
											</div>
											<div class="hidden">
												<p>
													商品名稱：${row.productBean.productName}<a
														href="../ProductServlet?productId=${row.reportedId}"
														target="_blank"><button class="btn btn-primary">
															<span class="glyphicon glyphicon-zoom-in"></span>
														</button></a><br> <br> 檢舉時間：<br>
													<fmt:formatDate value="${row.createDate}"
														pattern="yyyy年MM月dd日 HH:mm" />
													<br> <br>檢舉內容：<br>${row.vioContent}<br>
												</p>
												<form method="POST"
													action="../Violation/ProcessViolation.do">
													<div class="form-group">
														<label for="processWay" class="control-label">處理方式</label>
														<select class="form-control" id="processWay"
															name="processWay">
															<option value="0">商品無違規</option>
															<option value="1">商品違規，下架商品</option>
														</select>
														<div class="form-group">
															<label for="ticketResult" class="ontrol-label">回復處理情況</label>
															<textarea id="ticketResult" name="ticketResult"
																class="form-control" rows="3"></textarea>
														</div>
														<input type="hidden" name="ticketId"
															value="${row.ticketId}" /> <input type="hidden"
															name="vioTitle" value="${row.vioTitle}" /> <input
															type="hidden" name="reporterId" value="${row.reporterId}" />
														<input type="hidden" name="reportedId"
															value="${row.reportedId}" />
													</div>
													<div class="form-group">
														<button type="submit" class="btn btn-default">送出</button>
													</div>
												</form>
											</div></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<h3 class="text-center">已處理</h3>
					<c:if test="${empty treated}">沒有已處理違規</c:if>
					<c:if test="${not empty treated}">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>檢舉人</th>
									<th>被檢舉商品</th>
									<th>主旨</th>
									<th>檢舉時間</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${treated}">
									<tr>
										<td>${row.memberBean.name}</td>
										<td><a
											href="../ProductServlet?productId=${row.reportedId}"
											target="_blank">${row.productBean.productName}</a></td>
										<td>${row.vioTitle}</td>
										<td><fmt:formatDate value="${row.createDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td><button value="${row.ticketId}"
												class="btn btn-primary" name="detail" data-toggle="modal"
												data-target="#myModal">
												<span class="glyphicon glyphicon-zoom-in"></span>
											</button>
											<div class="hidden">
												<h3>${row.vioTitle}</h3>
											</div>
											<div class="hidden">
												<p>
													商品名稱：${row.productBean.productName}<a
														href="../ProductServlet?productId=${row.reportedId}"
														target="_blank"><button class="btn btn-primary">
															<span class="glyphicon glyphicon-zoom-in"></span>
														</button></a><br> <br> 檢舉時間：<br>
													<fmt:formatDate value="${row.createDate}"
														pattern="yyyy年MM月dd日 HH:mm" />
													<br> <br>檢舉內容：<br>${row.vioContent}<br>
													<br>處理時間：<br>${row.processDate}<br>
													<br>處理內容：<br>${row.ticketResult}
												</p>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">關閉</button>
											</div></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<!-- 					<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button> -->
				</div>
			</div>

		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$('#collapseOne').removeClass("in");
			$('#collapseThree').addClass("in");
			$("#collapseThree>ul>li:eq(1)").addClass("list-group-item-info");

			$('button[name="detail"]').click(function() {
				$('.modal-header').html($(this).next().html());
				$('.modal-body').html($(this).next().next().html());
			});
		});
	</script>
</body>
</html>