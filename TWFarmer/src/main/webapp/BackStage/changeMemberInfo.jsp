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
<title>台灣小農</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

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
					<center>
						<h3>請修改需變更欄位</h3>
					</center>
					<form class="form-horizontal col-md-10" role="form"
						action="/TWFarmer/BackStage/ChangeMemberServlet" method="put">
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputName" name="name"
									value="${LoginOK.name}"> <span style="color: #ff0000">${errors.name}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPhone" class="col-sm-2 control-label">電話</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputPhone" name="phone"
									value="${LoginOK.phone}"> <span style="color: #ff0000">${errors.phone}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">電子信箱</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputEmail" name="email"
									value="${LoginOK.email}"> <span style="color: #ff0000">${errors.email}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="datepicker" class="col-sm-2 control-label">生日</label>
							<div class="col-sm-10">
								<input class="form-control" id="datepicker" name="birthDate"
									value="${LoginOK.birthDate}"> <span
									style="color: #ff0000">${errors.birthDate}</span>
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inputGender" class="col-sm-2 control-label">性別</label>
							<div class="col-sm-10">
								<input type="radio" name="gender" value="M" class="form-control"
									id="exampleInputEmail1">男 <input type="radio"
									name="gender" value="F" class="form-control"
									id="exampleInputEmail1">女 <span style="color: #ff0000">${errors.gender}</span>
							</div>
						</div>
						<!-- 						<div class="form-group form-inline"> -->
						<!-- 							<label for="inputAddress" class="col-sm-2 control-label">地址</label> -->
						<!-- 							<div class="col-sm-10"> -->
						<!-- 								<select name="district" value="" id="縣市1"></select> -->
						<!-- 								<select name="district" value="" id="鄉鎮市區1"></select> -->
						<!-- 								<input class="form-control" id="inputAddress" name="address" -->
						<%-- 									value="${LoginOK.address}"> --%>
						<!-- 							</div> -->
						<!-- 						</div> -->
						<div class="form-group">
							<label for="inputPostalCode" class="col-sm-2 control-label">郵遞區號</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputPostalCode"
									name="postalCode" value="${LoginOK.postalCode}"> <span
									style="color: #ff0000">${errors.postalCode}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputDistrict" class="col-sm-2 control-label">居住地區</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputDistrict" name="district"
									value="${LoginOK.district}"> <span
									style="color: #ff0000">${errors.district}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAddress" class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputAddress" name="address"
									value="${LoginOK.address}"> <span
									style="color: #ff0000">${errors.address}</span>
							</div>
						</div>
						<div class="form-group">
							<div class="text-center">
								<button name="submit" class="btn btn-primary" value="change">送出修改</button>
								<button name="submit" class="btn btn-danger" value="cancel">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(0)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-success");

			if ('${LoginOK.gender}' == 'M') {
				$(':radio[value="M"]').attr('checked', true);
			} else {
				$(':radio[value="F"]').attr('checked', true);
			}

			$("#datepicker").datepicker({
				altField : "#datepicker",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
			});
		})

		window.onload = function() {
			//當頁面載完之後，用AddressSeleclList.Initialize()，
			//傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
			AddressSeleclList.Initialize('縣市1', '鄉鎮市區1');
		}
	</script>
</body>
</html>