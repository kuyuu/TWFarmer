<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>
<body>

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
					<a class="navbar-brand" href="../index.html">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<c:choose>
						<c:when test="${empty LoginOK}">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/TWFarmer/MemberSubmit/MemberSubmit.jsp">註冊</a>
								</li>
								<li><a href="/TWFarmer/Login.jsp">登入</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/TWFarmer/Msg/MsgCheckingServlet">站內信</a></li>
								<li><a href="/TWFarmer/BackStage/BackStageServlet">會員專區</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
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
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item">管理訂單</a> <a href="#"
						class="list-group-item">管理開團</a> <a href="#"
						class="list-group-item active">管理跟團</a><a href="#"
						class="list-group-item">管理追蹤商品</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<form class="form-horizontal" action="RemittanceServlet" method="POST">
						<input type="hidden" value="${jpfBean.JPFollowerId}" name="jpFollowerId"/>
						<div class="form-group">
							<label for="remittanceBank" class="col-sm-3 control-label">匯款銀行</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remittanceBank" name="remittanceBank" />
							</div>
						</div>
						<div class="form-group">
							<label for="remittanceAcc" class="col-sm-3 control-label">匯款帳號後5碼</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remittanceAcc" name="remittanceAcc" />
							</div>
						</div>
						<div class="form-group">
							<label for="remittance" class="col-sm-3 control-label">匯款金額</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remittance" name="remittance" />
							</div>
						</div>
						<div class="form-group">
							<label for="remittanceDate" class="col-sm-3 control-label">匯款時間</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remittanceDate" name="remittanceDate" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-default">送出</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>