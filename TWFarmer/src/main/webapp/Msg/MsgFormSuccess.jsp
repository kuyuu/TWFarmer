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
<<<<<<< HEAD
<h1>站內信順利寄出</h1><br>
以下是您的訊息內容：<br><br>
信件流水號:${msgBean.msgId}
寄件者:${msgBean.msgWriterId}<br>
收件者:${msgBean.msgReaderId}<br>
標題:${msgBean.msgTitle}<br>
內文:${msgBean.msgContent}<br>
=======
	<!-- 上方選單start -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
>>>>>>> branch 'master' of https://github.com/kuyuu/TWFarmer.git

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
						<li><a href="/TWFarmer/Order/OrderTemp.jsp">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">註冊</a></li>
						<li><a href="#">登入</a></li>
						<li><a href="/TWFarmer/Msg/MsgForm.jsp">站內信</a></li>
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

						<form>
							<h1>站內信順利寄出</h1>
							<br> 以下是您的訊息內容：<br>
							<br> 信件流水號:${msgBean.msgId}<br>
							寄件者:${msgBean.msgWriterId}<br> 收件者:${msgBean.msgReaderId}<br>
							寄送時間：${msgBean.msgTime}<br>
							<br> 標題:${msgBean.msgTitle}<br>
							內文:${msgBean.msgContent}<br>
						</form>


					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 上方選單 End -->


</body>
</html>






