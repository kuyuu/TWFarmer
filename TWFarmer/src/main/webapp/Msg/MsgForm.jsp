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
<title>站內信 - 寄件匣</title>
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
					<a class="navbar-brand" href="../index.jsp">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="/TWFarmer/Order/OrderTemp.jsp">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<!-- <li><a href="#">註冊</a></li> -->
						<li><a href="#">登出</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">搜尋</button>
					</form>
				</div>

				</nav>
			</div>
		</div>

		<!-- 
		<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">

						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="/TWFarmer/Msg/MsgCheck.jsp">收件匣</a></li>

								<li><a href="/TWFarmer/Msg/MsgForm.jsp">寄信匣</a></li>
							</ul>
						</div>

					</div>
					<div class="col-md-2"></div>
				</div>
		
		-->


		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="/TWFarmer/Msg/MsgCheckingServlet" class="list-group-item">收件匣</a>
					<a href="/TWFarmer/Msg/MsgCreatingServlet"
						class="list-group-item active">寄件匣</a>

				</div>
			</div>
			<div class="jumbotrom col-md-offset-3">
				<h1>寄件匣</h1>
				<!-- 		Msg Outbox    Start    -->
				<div>
					<div class="text" style="color: #0F7C58; font-weight: bold">${sessionScope.LoginOK.name}，歡迎回家！</div>
					請開始撰寫您的新信<br> <br>
					<form action="<c:url value="MsgCreatingServlet"/>" method="POST">
						<tr>
							<td width="10%">寄件人帳號</td>
							<br>
							<td style="width: 80px"><input id='msgWriterId'
								value="${sessionScope.LoginOK.account}" type="text" size="50"
								disabled /></td>
							<td><input type="hidden"
								value="${sessionScope.LoginOK.memberId}" type="text"
								name="msgWriterId" />
								<div style="color: #FF0000; display: inline">
									${errors.msgWriterId}</div></td>
						</tr>
						<br> <br>
						<tr>
						<tr>
							<td width="10%">收件人帳號</td>
							<br>
							<td style="width: 80px"><input id='account'
								value="${param.account}" type="text" name="account" size="50" />
								<div style="color: #FF0000; display: inline">
									${errors.account}</div></td>
						</tr>

						<%-- <tr>
							<td width="10%">收件人</td>
							<br>
							<td style="width: 80px"><input id='msgReaderId'
								value="${param.msgReaderId}" type="text" name="msgReaderId"
								size="50" />
								<div style="color: #FF0000; display: inline">
									${errors.msgReaderId}</div></td>
						</tr> --%>
						<br> <br>
						<tr>
							<td width="10%">標題</td>
							<br>
							<td style="width: 80px"><input id='msgTitle'
								value="${param.msgTitle}" type="text" name="msgTitle" size="50" />
								<div style="color: #FF0000; display: inline">
									${errors.msgTitle}</div></td>
						</tr>
						<br> <br>
						<tr>
							<td width="10%">內文</td>
							<br>
							<td><textarea rows="10" cols="40" name="msgContent"
									id="msgContent">${param.msgContent}</textarea>
								<div style="color: #FF0000; display: inline">
									${errors.msgContent}</div></td>
						</tr>
						<br>
						<tr>
							<center>
								<div class="form-group">
									<button type="submit" class="btn btn-default">送出</button>
									<button type="button" class="btn btn-default" id="clearMsg"
										onclick="ClearFields();">清除</button>
								</div>
							</center>
						</tr>
					</form>
				</div>
				<caption>
					<h2>貼心提醒：文長不可超過500字喔！ᶘ ᵒᴥᵒᶅ</h2>
				</caption>
				<!-- Msg Outbox  End -->
			</div>

		</div>
	</div>
	<!-- 上方選單 End -->

	<script>
		function ClearFields() {

			document.getElementById("msgContent").value = "";
		}
	</script>


</body>


</html>