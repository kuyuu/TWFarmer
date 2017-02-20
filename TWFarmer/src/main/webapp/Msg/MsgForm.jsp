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
			<div class="col-md-2">
				<div class="list-group">
					<a href="/TWFarmer/Msg/MsgCheckingServlet" class="list-group-item">收件匣</a>
					<a href="/TWFarmer/Msg/MsgForm.jsp" class="list-group-item active">寄件匣</a>

				</div>
			</div>
			<div class="jumbotrom col-md-offset-2">
				<h1>寄件匣</h1>
				<!-- 		Msg Outbox    Start    -->
				<div>
					<div class="text" style="color: #0F7C58; font-weight: bold">${sessionScope.LoginOK.name}，歡迎回家！</div>
					請開始撰寫您的新信<br> <br>
					<div class="row">
						<div class="col-md-12">

							<form action="<c:url value="MsgCreatingServlet"/>" method="POST">
								<div class="form-group ">
									<label for="msgWriterId">寄件人帳號</label> <br> <input
										id='msgWriterId' class="form-control"
										value="${sessionScope.LoginOK.account}" type="text" size="50"
										disabled /> <input type="hidden"
										value="${sessionScope.LoginOK.memberId}" type="text"
										name="msgWriterId" />
									<div style="color: #FF0000; display: inline">
										${errors.msgWriterId}</div>
								</div>
								<br>
								<div class="form-group ">
									<label for="msgReaderId">收件人帳號</label> <br>
									<div class="">
										<input id='account' value="${param.account}" type="text"
											name="account" size="50" class="form-control" placeholder="請在此輸入收件人帳號"/>
										<div style="color: #FF0000; display: inline">
											${errors.account}</div>
									</div>
								</div>
								<%-- <tr>
							<td width="10%">收件人</td>
							<br>
							<td style="width: 80px"><input id='msgReaderId'
								value="${param.msgReaderId}" type="text" name="msgReaderId"
								size="50" />
								<div style="color: #FF0000; display: inline">
									${errors.msgReaderId}</div></td>
						</tr> --%>
								<br>
								<div>
									<label for="msgTitle">標題</label> <br>
									<div class="form-group ">
										<input id='msgTitle' value="${param.msgTitle}" type="text"
											name="msgTitle" size="50" class="form-control" placeholder="請在此輸入主標題"/>
										<div style="color: #FF0000; display: inline">
											${errors.msgTitle}</div>
									</div>
								</div>
								<br> <br>
								<div>
									<label for="msgContent">內文</label> <br>
									<div class="form-group ">
										<textarea rows="10" cols="40" name="msgContent"
											id="msgContent" class="form-control" placeholder="請輸入內文">${param.msgContent}</textarea>
										<div style="color: #FF0000; display: inline">
											${errors.msgContent}</div>
										</td>
									</div>
								</div>
								<br>
								<div>
									<center>
										<div class="form-group">
											<button type="submit" class="btn btn-default">送出</button>
											<button type="button" class="btn btn-default" id="clearMsg"
												onclick="ClearFields();">清除</button>
										</div>
									</center>
								</div>
							</form>
						</div>
					</div>
				</div>
				<caption>
					<h2>貼心提醒：文長請勿超過500字</h2>
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