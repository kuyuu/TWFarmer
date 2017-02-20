<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div class="col-md-3">
				<jsp:include page="backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="row jumbotron"
					style="background-color: #FFE6FF; font-family: monospace, Microsoft JhengHei">
					<center>
						<h3>請修改需變更欄位</h3>
					</center>
					<form class="form-horizontal col-md-10" role="form"
						action="/BackStage/ChangeMemberServlet" method="put">
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputName" name="name"
									value="${LoginOK.name}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPhone" class="col-sm-2 control-label">電話</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputPhone" name="phone"
									value="${LoginOK.phone}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">電子信箱</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputEmail" name="email"
									value="${LoginOK.email}">
							</div>
						</div>

						<div class="form-group">
							<label for="inputIdNumber" class="col-sm-2 control-label">身分證字號</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputIdNumber" name="idNumber"
									value="${LoginOK.idNumber}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputBirthDate" class="col-sm-2 control-label">生日</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputBirthDate" name="birthDate"
									value="${LoginOK.birthDate}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputGender" class="col-sm-2 control-label">性別</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputGender" name="gender"
									value="<c:if test="${LoginOK.gender=='M'}">男性</c:if>
							<c:if test="${LoginOK.gender=='F'}">女性</c:if>">
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
									name="postalCode" value="${LoginOK.postalCode}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputDistrict" class="col-sm-2 control-label">居住地區</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputDistrict" name="district"
									value="${LoginOK.district}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputAddress" class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input class="form-control" id="inputAddress" name="address"
									value="${LoginOK.address}">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">確認</button>
								<button type="submit" class="btn btn-danger">取消</button>
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
	<script src="../js/AddressSelectList.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(0)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-success")
		})

		window.onload = function() {
			//當頁面載完之後，用AddressSeleclList.Initialize()，
			//傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
			AddressSeleclList.Initialize('縣市1', '鄉鎮市區1');
		}
	</script>
</body>
</html>