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
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
						method="post" role="form" name="submitform" id="submitform">
						<div class="form-group ">
							<label for="ACCOUNT">帳號</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-account.png"
									height="20px" width="20px"></span> <input type="text"
									name="account" value="${param.account}" class="form-control"
									id="account" placeholder="請輸入您的帳號"> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-question-sign" id="accounticon"></span>
								</span>
							</div>
							<div style="color: #ff0000" id="message">${msg.account}</div>
							<div style="color: #ff0000">${errors.account}</div>
						</div>
						<div class="form-group">
							<label for="PASSWORD">密碼</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-password.png"
									height="20px" width="20px"></span> <input type="password"
									name="password" value="${param.password}" class="form-control"
									id="password" placeholder="請輸入您的密碼" />
							</div>
							<span style="color: #ff0000">${errors.password}</span>
						</div>
						<div class="form-group">
							<label for="NAME">名字</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-name.png" height="20px"
									width="20px"></span> <input type="text" name="name"
									value="${param.name}" class="form-control" id="name"
									placeholder="請輸入您的名字">
							</div>
							<span style="color: #ff0000">${errors.name}</span>
						</div>
						<div class="form-group">
							<label for="PHONE">手機</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-phone.png" height="20px"
									width="20px"></span> <input type="text" name="phone"
									value="${param.phone}" class="form-control" id="phone"
									placeholder="請輸入您的手機號碼">
							</div>
							<span style="color: #ff0000">${errors.phone}</span>
						</div>
						<div class="form-group">
							<label for="BIRTHDAT">生日</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-bdate.png" height="20px"
									width="20px"></span> <input type="text" name="birthDate"
									value="${param.birthDate}" class="form-control" id="datepicker"
									placeholder="請輸入您的生日">
							</div>
							<span style="color: #ff0000">${errors.birthDate}</span>
						</div>
						<div class="form-group form-inline">
							<label for="GENDER">性別</label> <input type="radio" name="gender"
								value="M" class="form-control" id="GENDERM">男
							<input type="radio" name="gender" value="F" class="form-control"
								id="GENDERF">女 <span style="color: #ff0000">${errors.gender}</span>
						</div>
						<div class="form-group">
							<label for="EMAIL">E-mail</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-mail.png" height="20px"
									width="20px"></i></span> <input type="text" name="email"
									value="${param.email}" class="form-control" id="email"
									placeholder="請輸入您的Email">
							</div>
							<span style="color: #ff0000">${errors.email}</span>
						</div>
						<div class="form-group">
							<label for="IDNUMBER">身分證字號</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-idnumber.png"
									height="20px" width="20px"></span> <input type="text"
									name="idnumber" value="${param.idnumber}" class="form-control"
									id="idnumber" placeholder="請輸入您的身分證字號"> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-question-sign" id="idnumbericon"></span>
								</span>
							</div>
							<span style="color: #ff0000">${errors.idnumber}</span>
						</div>
						<div class="form-group">
							<label for="POSTALCODE">郵遞區號</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-postalcode.png"
									height="20px" width="20px"></span> <input type="text"
									name="postalcode" value="${param.postalcode}"
									class="form-control" id="postalcode" placeholder="請輸入您所在的郵遞區號">
							</div>
							<span style="color: #ff0000">${errors.postalcode}</span>
						</div>
						<div class="form-group">
							<label for="DISTRICT">居住的縣市及鄉鎮市區</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-district.png"
									height="20px" width="20px"></span> <input type="text"
									name="district" value="${param.district}" class="form-control"
									id="district" placeholder="請輸入您居住的縣市及鄉鎮區名">
							</div>
							<span style="color: #ff0000">${errors.district}</span>
						</div>
						<div class="form-group">
							<label for="ADDRESS">地址</label>
							<div class="input-group">
								<span class="input-group-addon"><img
									src="/TWFarmer/img/submit-icon/submit-address.png"
									height="20px" width="20px"></span> <input type="text"
									name="address" value="${param.address}" class="form-control"
									id="address" placeholder="請輸入您的居住地址">
							</div>
							<span style="color: #ff0000">${errors.address}</span>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success"
								style="float: right;">Submit</button>
							<button type="button" class="btn btn-primary"
								style="float: right; margin-right: 30px;"
								onclick="insertfile();">一鍵輸入</button>
						</div>
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

	<!-- 	驗證帳號是否重複	 -->
	<script>
		//當使用者移開account欄位後才去執行Ajax的程式
		var account = document.getElementById("account");
		var xhr = null;
		account.addEventListener("blur", load);

		//blur事件發生執行的函式
		//Ajax的程式從這裡開始
		function load() {
			if (account.value == "") {
				document.getElementById("message").innerHTML = "未輸入帳號";
				document.getElementById("accounticon").className = "glyphicon glyphicon-remove-sign";
				return;
			}
			//步驟一建立Ajax物件
			xhr = new XMLHttpRequest();
			if (xhr != null) {
				xhr.addEventListener("readystatechange", callback);
				//post
				//呼叫AccountCheckServlet
				xhr.open('POST', 'AccountCheckServlet', true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.send("account=" + account.value);
				// 				alert("account=" + account.value);
			} else {
				alert("您的瀏覽器不支援Ajax功能!!");
			}
		}

		function callback() {
			if (xhr.readyState == 4) { //4表示資料完全傳回到client端了
				// 				alert("資料完全傳回到client端了");
				if (xhr.status == 200) { //表示server端程式沒有錯誤
					// 					alert("server端程式沒有錯誤");
					//步驟三接收Server端回應的結果
					var data = xhr.responseText;
					//將資料顯示在網頁上	
					document.getElementById("message").innerHTML = data;
					if (data == "帳號已存在") { //檢查失敗後換上 glyphicon glyphicon-remove-sign 圖示
						document.getElementById("accounticon").className = "glyphicon glyphicon-remove-sign";
						// 						alert("data="+data);
					} else { //檢查通過後換上 glyphicon glyphicon-ok-sign 圖示
						document.getElementById("accounticon").className = "glyphicon glyphicon-ok-sign";
						// 						alert("data="+data);
					}
				} else {
					alert(xhr.status + ":" + xhr.statusText);
				}
			}
		}
	</script>

	<!-- 	一鍵輸入 -->

	<script type="text/javascript">
		function insertfile() {
			document.submitform.account.value="eeit9115";
			document.submitform.password.value="123";
			document.submitform.name.value="劉昱岑";
			document.submitform.phone.value="0987654321";
			document.submitform.datepicker.value="1988-04-09";
			document.submitform.gender[1].checked=true;
			document.submitform.email.value="eeit9115@gmail.com";
			document.submitform.idnumber.value="C123456789";
			document.submitform.postalcode.value="206";
			document.submitform.district.value="台北市大安區";
			document.submitform.address.value="復興南路一段133號2樓";

		}
	</script>


</body>
</html>