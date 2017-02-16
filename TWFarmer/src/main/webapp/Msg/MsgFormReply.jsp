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
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="/TWFarmer/Msg/MsgCheckingServlet" class="list-group-item">收件匣</a>
					<a href="/TWFarmer/Msg/MsgCreatingServlet"
						class="list-group-item active">寄件匣</a>

				</div>
			</div>
			<div class="jumbotrom col-md-offset-3">
				<h1>寄件匣 - 回覆信件</h1>
				<!-- 		Msg Outbox    Start    -->
				<div>
					<div class="text" style="color: #0F7C58; font-weight: bold">${sessionScope.LoginOK.name}，歡迎回家！</div>
					請撰寫您要回覆給${sessionScope.memberBeanReader.account}的內容:<br> <br>
					<form action="<c:url value="MsgCreatingServlet"/>" method="POST">
						<div>
							<label for="msgWriterId">寄件人帳號</label> <br>
							<div class="">
								<input id='msgWriterId' value="${sessionScope.LoginOK.account}"
									type="text" size="50" disabled />
							</div>
							<input type="hidden" value="${sessionScope.LoginOK.memberId}"
								type="text" name="msgWriterId" />
							<div style="color: #FF0000; display: inline">
								${errors.msgWriterId}</div>
						</div>
						<br> 
						<div>
							<label for="msgReaderId">收件人帳號</label>
							<br>
							<div class=""><input type="text"
								value="${sessionScope.memberBeanReader.account}"
								disabled="disabled" /> <input type="hidden"
								value="${sessionScope.memberBeanReader.account}" name="account" />
								<div style="color: #FF0000; display: inline">
									${errors.account}</div></div>
						</div>
						<br>
						<div>
							<label for="msgTitle">標題</label> <br>
							<div class="">
								<input id='msgTitle' value="${param.msgTitle}" type="text"
									name="msgTitle" size="50" />
								<div style="color: #FF0000; display: inline">
									${errors.msgTitle}</div>
							</div>
						</div>
						<br> <br>
						<div>
							<label for="msgContent">內文</label> <br>
							<div>
								<textarea rows="10" cols="40" name="msgContent" id="msgContent">${param.msgContent}</textarea>
								<div style="color: #FF0000; display: inline">
									${errors.msgContent}</div>
								</td>
							</div>
						</div>
						<br>
						<center>
							<div class="form-group">
								<button type="submit" class="btn btn-default">送出</button>
								<button type="button" class="btn btn-default" id="clearMsg"
									onclick="ClearFields();">清除</button>
							</div>
						</center>
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