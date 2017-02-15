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
<title>臺灣小農-註冊會員</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<!-- 上方選單start -->
	<div class="container">
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
						<li><a href="../ProductSelect/ProductSelect.jsp">購買蔬果</a></li>
						<li><a href="../PurchaseSelect/PurchaseSelect.jsp">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">註冊</a></li>
						<li><a href="../Login.jsp">登入</a></li>
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
					<div class="col-md-3">
				<div class="list-group">
					<a href="/TWFarmer/Msg/MsgCheckingServlet"
						class="list-group-item">收件匣</a> <a
						href="/TWFarmer/Msg/MsgCreatingServlet" class="list-group-item active">寄件匣</a>

				</div>
			</div>
					<div class="jumbotrom col-md-offset-3">
					<h1>寄件匣</h1>
					<div class="text" style="color: #0F7C58; font-weight: bold">${sessionScope.LoginOK.name}，歡迎回家！</div>
					請開始撰寫您的新信<br>
						<caption>
							<center><h2>ᶘᵒᴥᵒᶅ貼心提醒：文長不可超過500字喔！ᶘᵒᴥᵒᶅ</h2></center>
						</caption>
						<div>
						<form
							action="<c:url value="/Msg/MsgCheckingServlet" />"
							method="post" role="form" >
							<div class="form-group ">
								<label for="msgWriterId">寄件人</label>
								<input type="text" name="msgWriterId"
									value="${sessionScope.LoginOK.name}" class="form-control"
									id="msgWriterId" disabled>
								<span style="color:#ff0000">${errors.msgWriterId}</span>
								<input type="hidden"
								value="${sessionScope.LoginOK.memberId}" type="text" />
								<div style="color: #FF0000; display: inline">
									${errors.msgWriterId}</div>
							</div>
							<div class="form-group">
							<label for="msgReaderId">收件人</label>
							<input type="text" name="msgReaderId"
									value="" class="form-control" 
									id="msgReaderId" />
								<span style="color:#ff0000">${errors.msgReaderId}</span>
							</div>
							<div class="form-group">
								<label for="msgTitle">標題</label>
								<input type="text" name="msgTitle"
									value="" class="form-control"
									id="msgTitle">
								<span style="color:#ff0000">${errors.msgTitle}</span>
							</div>
							<div class="form-group">
								<label for="msgContent">內文</label><br>
								<textarea rows="10" cols="40" name="msgContent"
									id="msgContent">${param.msgContent}</textarea>
								<div style="color: #FF0000; display: inline">
									${errors.msgContent}</div>
							</div>
				
				
						<button type="submit" class="btn btn-default">
							寄出
						</button>
							<button type="button" class="btn btn-default" id="clearMsg"
										onclick="ClearFields();">清除</button>
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
		function ClearFields() {

			document.getElementById("msgContent").value = "";
		}
	</script>
	
	

</body>
</html>