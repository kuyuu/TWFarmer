<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農-合購專區</title>

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

td {
	padding: 5px;
}

html {
	overflow-y: scroll;
}

.jp {
	padding: 10px;
	/* 	border: 1px solid black; */
	border-radius: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
	height: 140px;
	background: #FFFFFF;
}

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
		<jsp:include page="../common/menuJp.jsp" />
		<form
			action="<c:url value="/PurchaseSelect/PurchaseSelect.controller" />"
			method="get">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="container">
					<div class="row jumbotron">
						<div class="col-md-12">
							<h3>合購搜尋</h3>
							<h2></h2>
							<div class="form-group">
								<div class="col-md-11">
									<input type="text" name="keyword" class="form-control"
										placeholder="請輸入關鍵字如橘子、大安區">
								</div>
								<div class="col-md-1">
									<button type="submit" class="btn btn-default">搜尋</button>
								</div>
							</div>
							<div class="col-md-10">
								<div class="form-group">
									<h4>或使用地區搜尋</h4>
									<select name="district" value="" id="縣市1">
									</select> <select name="district2" value="" id="鄉鎮市區1">
									</select>
								</div>
							</div>
							<br> <br> <br> <br> <br>
							<c:if test="${not empty keyword}">
								<div class="row">
									<c:forEach items="${keyword}" var="row">
										<div class="row jp divbox">
											<a href="/TWFarmer/JointPurchase.do?jpId=${row.jpId}">
												<div style="display: none">${row.jpId}</div>
												<div class="col-md-3">
													<center>
														<img src="../img/${row.pictureName}"
															class="img-responsive img-thumbnail"
															style="height: 120px" />
													</center>
												</div>
												<div class="col-md-9">
													<table class="table">
														<thead>
															<tr>
																<td colspan="2" width="65%">${row.jpName}</td>
																<td width="35%">主購：${row.memberBean.name}(${row.memberBean.account})</td>
															</tr>
														</thead>
														<tr>
															<td>開始日期</td>
															<td>結束日期</td>
															<td>合購地點</td>
														</tr>
														<tr>
															<td>${row.initDate}</td>
															<td>${row.endDate}</td>
															<td>${row.jpLocation}</td>
														</tr>
													</table>
												</div>
											</a>
											<hr>
										</div>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.js"></script>
	<script src="https://code.jquery.com/jquery-1.4.1.min.js"></script>
	<script language="javascript">
		$(function() {
			//當滑鼠滑入時將div的class換成divOver
			$('.divbox').hover(function() {
				$(this).addClass('divOver');
			}, function() {
				//滑開時移除divOver樣式
				$(this).removeClass('divOver');
			});
		});
	</script>
	<script src="../js/AddressSelectList.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			//當頁面載完之後，用AddressSeleclList.Initialize()，
			//傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
			AddressSeleclList.Initialize('縣市1', '鄉鎮市區1');
		}
		function show() {
			//取出指定縣市及鄉鎮市區的下拉選單的值
			alert(AddressSeleclList.ReturnSelectAddress('縣市1', '鄉鎮市區1'));
		}
	</script>
</body>
</html>