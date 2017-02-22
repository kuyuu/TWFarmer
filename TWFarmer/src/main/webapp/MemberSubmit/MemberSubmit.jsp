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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	<!-- 上方選單start -->
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">

				<!-- 		會員註冊表單    Start    -->
				<div style="padding: 5% 10% 10% 10%;">
					<div
						style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">註冊會員</div>
					<form
						action="<c:url value="/MemberSubmit/MemberSubmit.controller" />"
						method="post" role="form">
						<div class="form-group ">
							<label for="exampleInputEmail1">帳號</label> <input type="text"
								name="account" value="${param.account}" class="form-control"
								id="exampleInputEmail1"> <span style="color: #ff0000">${errors.account}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">密碼</label> <input
								type="password" name="password" value="${param.password}" class="form-control"
								id="exampleInputPassword1" /> <span style="color: #ff0000">${errors.password}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">名字</label> <input type="text"
								name="name" value="${param.name}" class="form-control"
								id="exampleInputEmail1"> <span style="color: #ff0000">${errors.name}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">手機</label> <input type="text"
								name="phone" value="${param.phone}" class="form-control"
								id="exampleInputEmail1"> <span style="color: #ff0000">${errors.phone}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">生日</label> <input type="text"
								name="birthDate" value="${param.birthDate}" class="form-control" id="datepicker">
							<span style="color: #ff0000">${errors.birthDate}</span>
						</div>
						<div class="form-group form-inline">
							<label for="exampleInputEmail1">性別</label> <input type="radio"
								name="gender" value="M" class="form-control"
								id="exampleInputEmail1">男 <input type="radio"
								name="gender" value="F" class="form-control"
								id="exampleInputEmail1">女 <span style="color: #ff0000">${errors.gender}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">E-mail</label> <input type="text"
								name="email" value="${param.email}" class="form-control"
								id="exampleInputEmail1"> <span style="color: #ff0000">${errors.email}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">身分證字號</label> <input type="text"
								name="idnumber" value="${param.idnumber}" class="form-control"
								id="exampleInputEmail1"> <span style="color: #ff0000">${errors.idnumber}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">郵遞區號</label> <input type="text"
								name="postalcode" value="${param.postalcode}" class="form-control"
								id="exampleInputEmail1"> <span
								style="color: #ff0000">${errors.postalcode}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">居住的縣市及鄉鎮市區</label> <input
								type="text" name="district" value="${param.district}" class="form-control"
								id="exampleInputEmail1" value="請輸入您居住的縣市及鄉鎮市區"> <span
								style="color: #ff0000">${errors.district}</span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">地址</label> <input type="text"
								name="address" value="${param.address}" class="form-control"
								id="exampleInputEmail1"> <span style="color: #ff0000">${errors.address}</span>
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>

				<!-- 會員註冊表單  End -->

			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<!-- 上方選單 End -->


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



</body>
</html>