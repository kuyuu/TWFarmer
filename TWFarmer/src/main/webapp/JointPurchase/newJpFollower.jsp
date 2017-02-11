<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
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
						<li><a href="#">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/TWFarmer/MemberSubmit/MemberSubmit.jsp">註冊</a>
						</li>
						<li><a href="/TWFarmer/MemberLogin.jsp">登入</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">搜尋</button>
					</form>
				</div>
				</nav>
				<div class="col-md-offset-2">
					<form action="<c:url value="CheckJointPurchaseServlet"/>"
						method="POST" class="form-horizontal">
						<div class="form-group">
							<label for="memberId" class="col-sm-2 control-label">會員ID</label>
							<div class="col-sm-6">
								<p id="memberId" class="form-control-static">${memberBean.memberId}</p>
							</div>
						</div>
						<div class="form-group">
							<label for="productId" class="col-sm-2 control-label">合購ID</label>
							<div class="col-sm-6">
								<p id="productId" class="form-control-static">${jpBean.jpId}</p>
							</div>
						</div>
						<div class="form-group">
							<label for="f2fId" class="col-sm-2 control-label">面交方式</label>
							<div class="col-sm-6">
								<c:forEach items="${f2fList}" var="x">
									<div class="radio">
										<label> <input type="radio" name="f2fId" id="f2fId"
											checked>${x.f2fTime} ${x.f2fPlace}
										</label>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="form-group">
							<label for="f2fId" class="col-sm-2 control-label">欲購商品</label>
							<div class="col-sm-6">
								<table class="table table-bordered">
									<thead>
										<tr>
											<td>商品名稱</td>
											<td>購買數量</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${jpDetailList}">
											<tr>
												<td>${row.productName}</td>
												<td><input type="text" id="jpPrice" name="jpPrice"
													class="form-control" value="${param.jpPrice}"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								<button type="submit" class="btn btn-default">送出</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
</body>
</html>