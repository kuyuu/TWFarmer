<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <div class="row"> -->
<!-- 	<div class="col-md-12"> -->
<!-- <div data-spy="affix" data-offset-top="121"> -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
				class="icon-bar"></span><span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/TWFarmer/index.jsp"><img
			src="/TWFarmer/img/logo/TWFarmerLOGO-long.png"
			alt="TWFarmerLOGO-long" height="30px" /></a>
	</div>

	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="/TWFarmer/ProductSelect/ProductSelectAllServlet">購買蔬果</a></li>
			<li><a href="/TWFarmer/PurchaseSelect/PurchaseSelect.jsp">合購專區</a></li>
			<li><a href="/TWFarmer/shoppingCart/ShowShoppingCart.do">購物車</a></li>

		</ul>
		<c:choose>
			<c:when test="${empty LoginOK}">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/TWFarmer/MemberSubmit/MemberSubmit.jsp">註冊</a></li>
<!-- 					<li><a href="/TWFarmer/Login.jsp">登入</a></li> -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
						<ul id="login-dp" class="dropdown-menu">
							<li>
								<div class="row" style="margin: 10px;">
									<div class="col-md-12">
										<form action='<c:url value="/Login.controller" />'
											method="post" role="form">
											<div class="form-group">
												<div class="sr-only">帳號</div> <input
													type="text" name="account" value="" class="form-control"
													id="account" placeholder="請輸入您的帳號" required> <div style="color: #ff0000">${errors.account}</div>
											</div>
											<div class="form-group">
												<div class="sr-only">密碼</div> <input
													type="password" name="password" value=""
													class="form-control" id="password" placeholder="請輸入您的密碼"
													required> <div style="color: #ff0000">${errors.password}</div>
											</div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary btn-block">Sign
											in</button>
									</div>
									</form>
								</div>
							</li>
						</ul></li>
					<li><a></a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/TWFarmer/BackStage/WelcomeMember.jsp">會員專區</a></li>
					<li><a href="/TWFarmer/logout.jsp">登出</a></li>
					<li><a></a></li>
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
<!-- </div> -->
<!-- 	</div> -->
<!-- </div> -->
