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
<title>站內信 - 收件匣</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!--   Date Picker for Ship Date
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker_ShipDate" ).datepicker({
        altField : "#datepicker",
        altFormat : "yy-mm-dd",
        dateFormat : "yy-mm-dd"
      });
  } );
  </script>
   -->


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
					<a href="/TWFarmer/Msg/MsgCheckingServlet"
						class="list-group-item active">收件匣</a> <a
						href="/TWFarmer/Msg/MsgCreatingServlet" class="list-group-item">寄件匣</a>

				</div>
			</div>
			<div class="jumbotrom col-md-offset-3">
				<h1>收件匣</h1>
				<c:choose>
					<c:when test="${not empty msgList}">
						<div class="text" style="color: #0F7C58; font-weight: bold">${sessionScope.LoginOK.name}，歡迎回家！</div>以下是站友們寄給您的信<br>
						<br>
						<c:forEach var='msgBean' items='${msgList}' varStatus='vs'>
							<c:if test="${vs.first}">
								<c:out value="<table class='table'>" escapeXml='false' />
								<tr>
									<th style="width: 80px">流水號:</th>
									<th style="width: 80px">寄件者:</th>
									<th style="width: 80px">標題:</th>
									<th style="width: 250px">寄送時間：</th>
									<th style="width: 250px">內文:</th>
									<th style="width: 80px">回覆訊息</th>
									<th style="width: 80px">刪除訊息</th>
								</tr>
							</c:if>

							<tr>
								<td style="width: 80px">${msgBean.msgId}</td>
								<td style="width: 80px">${msgBean.writerName}</td>
								<td style="width: 180px">${msgBean.msgTitle}</td>
								<td style="width: 250px; text-align: left">&nbsp;${msgBean.msgTime}</td>
								<td style="width: 250px; text-align: left">${msgBean.msgContent}</td>
								<td><button type="button" class="btn btn-primary" onclick="location.href='/TWFarmer/Msg/MsgCheckingDetail?msgId=${msgBean.msgId}&value=reply'">回覆</button></td>
								<td><button type="button" class="btn btn-danger" onclick="location.href='/TWFarmer/Msg/MsgCheckingDetail?msgId=${msgBean.msgId}&value=torch'">刪除</button></td>
							</tr>
							<c:if test="${vs.last}">
								<c:out value="</table>" escapeXml='false' />
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<center>訊息${msgBean.msgTitle}已經刪除</center>
						<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					<center><div class="list-group">
					<a href="/TWFarmer/Msg/MsgCheckingServlet" class="list-group-item">回到收件匣</a>
				</div></center>
					</c:otherwise>
				</c:choose>
				
			</div>


		</div>
	</div>
	<!-- 上方選單 End -->

</body>
</html>






