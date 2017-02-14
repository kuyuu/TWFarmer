<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
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
					<a class="navbar-brand" href="/TWFarmer/index.jsp">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="./ProductSelect/ProductSelect.jsp">購買蔬果</a></li>
						<li><a href="./PurchaseSelect/PurchaseSelect.jsp">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="./MemberSubmit/MemberSubmit.jsp">註冊</a>
						</li>
						<li><a href="./Login.jsp">登入</a></li>
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
					<div class="jumbotron">
						<div class="col-md-4">
							<c:forEach items="${picList}" var="x">
								<img src="img/${x.pictureName}" style="width: 100%;" />
							</c:forEach>
						</div>
						<div class="col-md-8">
							<h1>${productBean.productName}</h1>
							<p>${productBean.productIntro }</p>
							<p>${productBean.price } / ${productBean.unit }</p>
							<p>
								<a href="<c:url value="Order/NewOrderServlet?productId=${productBean.productId}&sellerId=${productBean.sellerId}" />" class="btn btn-default" >購買商品</a>
								<button type="button" class="btn btn-default">發起合購</button>
								<button type="button" class="btn btn-default">我想跟團</button>
								<button type="button" class="btn btn-default">加入購物車</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>