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
						<li><a href="#">註冊</a></li>
						<li><a href="#">登入</a></li>
						<li><a href="/TWFarmer/Msg/MsgHome.jsp">站內信</a></li>
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
					<a href="/TWFarmer/Msg/MsgCheck.jsp" class="list-group-item">收件匣</a>
					<a href="/TWFarmer/Msg/MsgForm.jsp" class="list-group-item active">寄件匣</a>

				</div>
			</div>
			<!-- 		Msg Outbox    Start    -->
			<div style="padding: 5% 10% 10% 10%;">
				<div
					style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">寄送站內信</div>
				<form action="<c:url value="MsgCreatingServlet"/>" method="POST">
					<table border="0" width="35%" align="center">
						<caption>
							<h2>貼心提醒：文長不可超過500字</h2>
						</caption>
						<%-- <tr>
				<td width="50%">寄件人：</td>
				<td>${sessionScope.Msg.msgWriterId}</td>
				<td></td>
			</tr> --%>
						<tr>
							<td width="50%">寄件人</td>
							<td><input id='msgWriterId' value="${param.msgWriterId}"
								type="text" name="msgWriterId" size="50" />
								<div style="color: #FF0000; display: inline">
									<center>${errors.msgWriterId}</center>
								</div></td>
						</tr>
						<tr>
						<tr>
							<td width="50%">收件人</td>
							<td><input id='msgReaderId' value="${param.msgReaderId}"
								type="text" name="msgReaderId" size="50" />
								<div style="color: #FF0000; display: inline">
									<center>${errors.msgReaderId}</center>
								</div></td>
						</tr>
						<tr>
							<td>標題</td>
							<td><input id='msgTitle' value="${param.msgTitle}"
								type="text" name="msgTitle" size="50" />
								<div style="color: #FF0000; display: inline">
									<center>${errors.msgTitle}</center>
								</div></td>
						</tr>
						<tr>
							<td>內文</td>
							<td><textarea rows="10" cols="40" name="msgContent">${param.msgContent}</textarea>
								<div style="color: #FF0000; display: inline">
									<center>${errors.msgContent}</center>
								</div></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="送出" /></td>
						</tr>



					</table>

				</form>
			</div>

			<!-- Msg Outbox  End -->
		</div>
	</div>
	<!-- 上方選單 End -->

</body>


</html>