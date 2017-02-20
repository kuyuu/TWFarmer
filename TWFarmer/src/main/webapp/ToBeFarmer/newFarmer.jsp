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
<title>臺灣小農 - 升級小農</title>
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/TWFarmer/index.jsp">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">註冊</a></li>
						<li><a href="#">登入</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">搜尋</button>
					</form>
				</div>

				</nav>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">

						<!-- 		小農升級表單    Start    -->
					<div style="padding:5% 10% 10% 10%;">
					<div style="font-weight:bold;color:#ff0000;margin: .67em 0;font-size: 2em;">升級小農</div>
						<center><h1 size="+4">歡迎使用小農升級系統。<br></h1>
						<h2 size="+2">請注意，信用是商人的法寶。<br>若您於販售農產期間有違規行為遭消費者投訴，<br>經查屬實將遭強制下架或停權處分。</h2>
						
						<h3 size="+1">請核對下列資料是否正確</h3></center>
						<form
							action="<c:url value="NewFarmerServlet" />"
							method="post" role="form" >
							
								<div class="form-group ">
								<label for="exampleInputEmail1">申請者編號</label>
								<input type="text" name="memberId"
									value="${param.memberId}" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.memberId}</span>
							</div>
							
							<div class="form-group ">
								<label for="exampleInputEmail1">小農證號</label>
								<input type="text" name="farmerId"
									value="${param.farmerId}" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.farmerId}</span>
							</div>
							
							<div class="form-group ">
								<label for="exampleInputEmail1">帳號</label>
								<input type="text" name="account"
									value="${param.account}" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.account}</span>
							</div>
						
							<div class="form-group">
								<label for="exampleInputEmail1">名字</label>
								<input type="text" name="name"
									value="${param.name}" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.name}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">手機</label>
								<input type="text" name="phone"
									value="${param.phone}" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.phone}</span>
							</div>
						
							<div class="form-group">
								<label for="exampleInputEmail1">E-mail</label>
								<input type="text" name="email"
									value="${param.email}" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.email}</span>
							</div>
							
							<div class="form-group form-inline">
								<label for="exampleInputEmail1">郵遞區號</label>
								<input type="text" name="postalCode"
									value="${param.postalCode}" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.postalCode}</span>
								
								<select name="district" value="" id="縣市1">
								</select> 
								<select name="district" value="" id="鄉鎮市區1">
								</select>
								<input type="button" onclick="show()" value="Show" />
								<span style="color:#ff0000">${errors.district}</span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">地址</label>
								<input type="text" name="address"
									value="${param.address}" class="form-control"
									id="exampleInputEmail1">
								<span style="color:#ff0000">${errors.address}</span>
							</div>
				<center><h3 size="+1">請輸入您的賣場介紹</h3></center>
				<tr>
                <td><textarea rows="10" cols="40" name="farmerIntro">${param.farmerIntro}</textarea>
                <div style="color: #FF0000; display: inline"><center>${errors.farmerIntro}</center>
                </div></td>
                </tr>
							
							
						<center><button type="submit" class="btn btn-default">
							提出申請
						</button></center>
					</form>
				</div>

						<!-- 會員註冊表單  End -->

					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
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
	<script src="../js/AddressSelectList.js"></script>
	<script type="text/javascript">
        window.onload = function () {
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