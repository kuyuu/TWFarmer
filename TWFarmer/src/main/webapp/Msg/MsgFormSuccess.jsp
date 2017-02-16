<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>寄信成功！</title>
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
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a href="/TWFarmer/Msg/MsgCheckingServlet" class="list-group-item">收件匣</a>
					<a href="/TWFarmer/Msg/MsgForm.jsp"
						class="list-group-item active">寄件匣</a>

				</div>
			</div>
			<div class="jumbotrom col-md-offset-2">
				<h1>寄件匣</h1>
				<div class="text" style="color: #0F7C58; font-weight: bold">${sessionScope.LoginOK.name}，信件已成功寄出！</div>
					以下是信件內容<br> <br>
				<form>

					<div class="form-group ">
						<label for="msgWriterId">寄件者:</label>
						<div>${msgBean.msgWriterId}</div>
					</div>

					<div class="form-group ">
						<label for="msgReaderId">收件者:</label>
						<div>${msgBean.msgReaderId}</div>
					</div>
					<div class="form-group ">
						<label for="msgTime">寄送時間：</label>
						<div><fmt:formatDate value="${msgBean.msgTime}"
												pattern="yyyy年MM月dd日 HH:mm" /></div>
					</div>
					<div class="form-group ">
						<label for="msgTitle">標題:</label>
						<div>${msgBean.msgTitle}</div>
					</div>
					<div class="form-group ">
						<label for="msgContent">內文:</label>
						<div>${msgBean.msgContent}</div>
					</div>

					<center><div class="list-group">
					<a href="/TWFarmer/Msg/MsgCheckingServlet" class="list-group-item">回到收件匣</a>
				</div></center>
				</form>
			</div>

		</div>
	</div>
	<!-- 上方選單 End -->




</body>

<%-- <form>
	<tr>
		<th style="width: 80px">寄件者:${msgBean.msgWriterId}</th>
		<br>
		<th style="width: 80px">收件者:${msgBean.msgReaderId}</th>
		<br>
		<th style="width: 180px">寄送時間：${msgBean.msgTime}</th>
		<br>
		<th style="width: 250px">標題:${msgBean.msgTitle}</th>
		<br>
		<th style="width: 250px">內文:${msgBean.msgContent}</th>
		<br>
		<th style="width: 80px">直接回覆</th>
	</tr>

</form> --%>

</html>




