<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>九重天產銷中心 - 賣場</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<h3>賣家帳號：ninenine99</h3>
				<h2 style="color: red">九重天產銷中心</h2>
				<h4 style="color: orange">關於我們</h4>
				<p>產銷中心歡迎大家來體驗蔬果的成長過程，新鮮有機蔬果請大家一起購買吧</p>
				<p>
				<h4 style="color: orange">本店商品</h4>
				<p>
					芭樂 <br> <br>一箱約15斤（20顆） 300元
				</p>
				<p>

					<a class="btn" href="#">了解詳情 »</a>
				</p>
				<div class="tabbable" id="tabs-840984">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-952660" data-toggle="tab">聯絡方式</a>
						</li>
						<!-- <li><a href="#panel-385033" data-toggle="tab">電子信箱</a></li>
 -->						<li><a href="#panel-385032" data-toggle="tab">問與答</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-952660">
							<p>國內電話： 03-987-9487</p>
							<p>電子信箱： ninenine@gmail.com</p>
						</div>
						<div class="tab-pane" id="panel-385033">
							
						</div>
						<div class="tab-pane" id="panel-385032">
							<form action="<c:url value="MsgCreatingServlet"/>" method="POST">
								<table border="0" width="35%" align="center">
									<td><textarea rows="10" cols="40" name="msgContent">${param.msgContent}</textarea>
										<div style="color: #FF0000; display: inline">
											<center>${errors.msgContent}</center>
										</div></td>
									</tr>

									<td colspan="2" align="center"><input type="submit"
										value="送出" /></td>

								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img alt="Bootstrap Image Preview"
					src="http://lorempixel.com/140/140/"><img
					alt="Bootstrap Image Preview" src="http://lorempixel.com/140/140/">
			</div>
			<div class="col-md-4">
				<img alt="Bootstrap Image Preview"
					src="http://lorempixel.com/140/140/">
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">

				<button type="button" class="btn btn-default btn-block active">
					檢舉違規</button>
			</div>
			<div class="col-md-3">

				<button type="button" class="btn btn-default btn-block active">
					直接購買</button>
			</div>
			<div class="col-md-3">

				<button type="button" class="btn btn-default active btn-block">
					發起合購</button>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>