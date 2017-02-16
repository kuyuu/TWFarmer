<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>臺灣小農</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
	<!-- 上方選單start -->
	<div class="container">
		<jsp:include page="../common/menuJp.jsp" />
		<div class="col-md-3">
			<div class="list-group">
				<a href="#" class="list-group-item">管理訂單</a> <a href="#"
					class="list-group-item">管理開團</a> <a href="#"
					class="list-group-item">管理跟團</a> <a href="#"
					class="list-group-item">管理追蹤商品</a> <a href="#"
					class="list-group-item active">會員升級</a>
			</div>
		</div>
		<div class="col-md-6">
			<div style="font-weight: bold; color: #ff0000; font-size: 2em;">升級小農</div>
			<form action="<c:url value="NewFarmerServlet" />" method="post">
				<div class="form-group ">
					<label for="">小農證號</label> <input type="text"
						name="farmerId" placeholder="請輸入小農證號" class="form-control">
					<span style="color: #ff0000">${errors.farmerId}</span>
				</div>
				<div class="form-group">
					<label for="">銀行代碼</label>
					<input type="text" name="email" placeholder="請輸入銀行代碼" class="form-control">
					<span style="color: #ff0000">${errors.email}</span>
				</div>
				<div class="form-group">
					<label for="">銀行帳號</label>
					<input type="text" name="email" placeholder="請輸入銀行帳號" class="form-control">
					<span style="color: #ff0000">${errors.email}</span>
				</div>
				<div class="form-group">
					<h3>請輸入您的賣場介紹</h3>
					<textarea class="form-control" rows="5" name="farmerIntro">${param.farmerIntro}</textarea>
				</div>
				<button type="submit" class="btn btn-default">提出申請</button>
			</form>
		</div>
	</div>
	<div class="col-md-2"></div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				altField : "#datepicker",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
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